param(
    [string]$Python = "python",
    [string]$ReportDir = "daemon_runtime",
    [ValidateSet("crypto", "finance")]
    [string]$MarketProfile = "finance",
    [ValidateSet("auto", "websocket", "poll")]
    [string]$MarketTransport = "poll",
    [double]$AuditHours = 1.0,
    [double]$MarketPollSeconds = 5.0,
    [double]$ChronikPollSeconds = 5.0,
    [int]$HttpPort = 8000,
    [string]$ChronikHtmlOut = "chronik.html",
    [switch]$StartInsight,
    [switch]$NoWebServer,
    [switch]$OpenBrowser,
    [switch]$DryRun
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Write-Step {
    param([string]$Message)
    $stamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$stamp] $Message" -ForegroundColor Cyan
}

function Resolve-AbsolutePath {
    param(
        [string]$PathValue,
        [string]$BaseDir
    )

    if ([System.IO.Path]::IsPathRooted($PathValue)) {
        return [System.IO.Path]::GetFullPath($PathValue)
    }
    return [System.IO.Path]::GetFullPath((Join-Path $BaseDir $PathValue))
}

function Get-WebReportDir {
    param(
        [string]$RequestedValue,
        [string]$ScriptBaseDir
    )

    $clean = [string]$RequestedValue
    if ([string]::IsNullOrWhiteSpace($clean)) {
        return "daemon_runtime"
    }
    $clean = $clean.Trim().Replace("\", "/")

    if ([System.IO.Path]::IsPathRooted($RequestedValue)) {
        $absolute = [System.IO.Path]::GetFullPath($RequestedValue)
        $base = [System.IO.Path]::GetFullPath($ScriptBaseDir)
        if ($absolute.StartsWith($base, [System.StringComparison]::OrdinalIgnoreCase)) {
            $suffix = $absolute.Substring($base.Length).TrimStart("\", "/")
            if (-not [string]::IsNullOrWhiteSpace($suffix)) {
                return ($suffix.Replace("\", "/"))
            }
        }
        throw ("Absolute ReportDir outside workspace cannot be served via local http.server: {0}" -f $RequestedValue)
    }

    $parts = @()
    foreach ($part in ($clean -split "/")) {
        if ([string]::IsNullOrWhiteSpace($part)) {
            continue
        }
        if (($part -eq ".") -or ($part -eq "..")) {
            continue
        }
        $parts += $part
    }
    if ($parts.Count -eq 0) {
        return "daemon_runtime"
    }
    return ($parts -join "/")
}

function Test-ProcessAlive {
    param([int]$PidValue)
    if ($PidValue -le 0) {
        return $false
    }
    $proc = Get-Process -Id $PidValue -ErrorAction SilentlyContinue
    return $null -ne $proc
}

function Start-TrackedProcess {
    param(
        [string]$PythonExe,
        [string]$Name,
        [string[]]$Arguments,
        [string]$WorkingDirectory,
        [string]$StdOutFile,
        [string]$StdErrFile,
        [switch]$DryRunMode
    )

    $commandLine = "$PythonExe " + ($Arguments -join " ")
    Write-Step ("Start {0}: {1}" -f $Name, $commandLine)
    Write-Host ("  stdout -> {0}" -f $StdOutFile)
    Write-Host ("  stderr -> {0}" -f $StdErrFile)

    if ($DryRunMode) {
        return [pscustomobject]@{
            name = $Name
            pid = -1
            command = $commandLine
            stdout = $StdOutFile
            stderr = $StdErrFile
        }
    }

    $proc = Start-Process `
        -FilePath $PythonExe `
        -ArgumentList $Arguments `
        -WorkingDirectory $WorkingDirectory `
        -RedirectStandardOutput $StdOutFile `
        -RedirectStandardError $StdErrFile `
        -WindowStyle Hidden `
        -PassThru

    Start-Sleep -Milliseconds 350
    if ($proc.HasExited) {
        $details = ""
        if (Test-Path $StdErrFile) {
            $details = (Get-Content $StdErrFile -Raw)
        }
        throw ("Process {0} exited immediately. {1}" -f $Name, $details)
    }

    return [pscustomobject]@{
        name = $Name
        pid = [int]$proc.Id
        command = $commandLine
        stdout = $StdOutFile
        stderr = $StdErrFile
    }
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $scriptDir

try {
    if (-not (Get-Command $Python -ErrorAction SilentlyContinue)) {
        throw ("Python executable not found: {0}" -f $Python)
    }

    $reportPath = Resolve-AbsolutePath -PathValue $ReportDir -BaseDir $scriptDir
    $webReportDir = Get-WebReportDir -RequestedValue $ReportDir -ScriptBaseDir $scriptDir
    $runtimeRoot = Join-Path $reportPath "_background"
    $logDir = Join-Path $runtimeRoot "logs"
    $sessionFile = Join-Path $runtimeRoot "session.json"

    New-Item -ItemType Directory -Path $reportPath -Force | Out-Null
    New-Item -ItemType Directory -Path $runtimeRoot -Force | Out-Null
    New-Item -ItemType Directory -Path $logDir -Force | Out-Null

    if ((Test-Path $sessionFile) -and (-not $DryRun)) {
        $existing = Get-Content $sessionFile -Raw | ConvertFrom-Json
        $running = @()
        foreach ($entry in @($existing.processes)) {
            $pidValue = [int]$entry.pid
            if (Test-ProcessAlive -PidValue $pidValue) {
                $running += [string]$entry.name + " (PID " + [string]$pidValue + ")"
            }
        }
        if ($running.Count -gt 0) {
            throw ("Background session already active: {0}. Stop first with .\stop_atheria_background.ps1 -ReportDir {1}" -f ($running -join ", "), $ReportDir)
        }
    }

    $chronikOutPath = Resolve-AbsolutePath -PathValue $ChronikHtmlOut -BaseDir $scriptDir
    $chronikOutParent = Split-Path -Parent $chronikOutPath
    if (-not (Test-Path $chronikOutParent)) {
        New-Item -ItemType Directory -Path $chronikOutParent -Force | Out-Null
    }

    $processes = @()
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"

    $daemonArgs = @(
        "atheria_daemon.py",
        "--report-dir", $reportPath,
        "--market-profile", $MarketProfile,
        "--market-transport", $MarketTransport,
        "--market-poll-seconds", ([string]$MarketPollSeconds),
        "--audit-hours", ([string]$AuditHours)
    )
    $processes += Start-TrackedProcess `
        -PythonExe $Python `
        -Name "daemon" `
        -Arguments $daemonArgs `
        -WorkingDirectory $scriptDir `
        -StdOutFile (Join-Path $logDir ("daemon_{0}.out.log" -f $timestamp)) `
        -StdErrFile (Join-Path $logDir ("daemon_{0}.err.log" -f $timestamp)) `
        -DryRunMode:$DryRun

    $chronikArgs = @(
        "aion_chronik.py",
        "--report-dir", $reportPath,
        "--follow",
        "--poll-seconds", ([string]$ChronikPollSeconds),
        "--html-out", $chronikOutPath
    )
    $processes += Start-TrackedProcess `
        -PythonExe $Python `
        -Name "chronik" `
        -Arguments $chronikArgs `
        -WorkingDirectory $scriptDir `
        -StdOutFile (Join-Path $logDir ("chronik_{0}.out.log" -f $timestamp)) `
        -StdErrFile (Join-Path $logDir ("chronik_{0}.err.log" -f $timestamp)) `
        -DryRunMode:$DryRun

    if ($StartInsight) {
        $insightArgs = @(
            "aion_insight.py",
            "--report-dir", $reportPath,
            "--follow",
            "--poll-seconds", ([string]$ChronikPollSeconds)
        )
        $processes += Start-TrackedProcess `
            -PythonExe $Python `
            -Name "insight" `
            -Arguments $insightArgs `
            -WorkingDirectory $scriptDir `
            -StdOutFile (Join-Path $logDir ("insight_{0}.out.log" -f $timestamp)) `
            -StdErrFile (Join-Path $logDir ("insight_{0}.err.log" -f $timestamp)) `
            -DryRunMode:$DryRun
    }

    if (-not $NoWebServer) {
        $serverArgs = @(
            "-m", "http.server", ([string]$HttpPort)
        )
        $processes += Start-TrackedProcess `
            -PythonExe $Python `
            -Name "http" `
            -Arguments $serverArgs `
            -WorkingDirectory $scriptDir `
            -StdOutFile (Join-Path $logDir ("http_{0}.out.log" -f $timestamp)) `
            -StdErrFile (Join-Path $logDir ("http_{0}.err.log" -f $timestamp)) `
            -DryRunMode:$DryRun
    }

    $absoluteReportDir = (Resolve-Path $reportPath).Path
    $urls = [ordered]@{
        chronik = ("http://localhost:{0}/chronik.html?reportDir={1}" -f $HttpPort, [uri]::EscapeDataString($webReportDir))
    }
    if (Test-Path (Join-Path $scriptDir "finance_dashboard.html")) {
        $urls.finance = ("http://localhost:{0}/finance_dashboard.html?reportDir={1}" -f $HttpPort, [uri]::EscapeDataString($webReportDir))
    }
    $session = [ordered]@{
        started_at = (Get-Date).ToString("o")
        script_dir = $scriptDir
        report_dir = $absoluteReportDir
        report_dir_web = $webReportDir
        chronik_html = $chronikOutPath
        urls = $urls
        processes = $processes
    }

    if (-not $DryRun) {
        $session | ConvertTo-Json -Depth 8 | Set-Content -Path $sessionFile -Encoding UTF8
    }

    Write-Host ""
    Write-Host "Background stack ready." -ForegroundColor Green
    Write-Host ("ReportDir (fs):  {0}" -f $absoluteReportDir)
    Write-Host ("ReportDir (web): {0}" -f $webReportDir)
    Write-Host ("Session:   {0}" -f $sessionFile)
    foreach ($p in $processes) {
        Write-Host ("- {0}: PID {1}" -f $p.name, $p.pid)
    }
    if (-not $NoWebServer) {
        Write-Host ("Chronik URL: {0}" -f $session.urls.chronik)
        if ($session.urls.PSObject.Properties.Match("finance").Count -gt 0 -and $session.urls.finance) {
            Write-Host ("Finance URL: {0}" -f $session.urls.finance)
        }
    }

    if ($OpenBrowser -and (-not $NoWebServer) -and (-not $DryRun)) {
        try {
            Start-Sleep -Milliseconds 450
            if ($session.urls.PSObject.Properties.Match("finance").Count -gt 0 -and $session.urls.finance) {
                Start-Process $session.urls.finance -ErrorAction Stop | Out-Null
                Start-Sleep -Milliseconds 150
            }
            Start-Process $session.urls.chronik -ErrorAction Stop | Out-Null
        }
        catch {
            Write-Warning ("Konnte Browser nicht automatisch oeffnen: {0}" -f $_.Exception.Message)
        }
    }
}
finally {
    Pop-Location
}
