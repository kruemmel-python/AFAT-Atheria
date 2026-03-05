param(
    [string]$ReportDir = "daemon_runtime"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

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

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$reportPath = Resolve-AbsolutePath -PathValue $ReportDir -BaseDir $scriptDir
$runtimeRoot = Join-Path $reportPath "_background"
$sessionFile = Join-Path $runtimeRoot "session.json"

if (-not (Test-Path $sessionFile)) {
    Write-Host ("Keine aktive Session gefunden: {0}" -f $sessionFile) -ForegroundColor Yellow
    exit 0
}

$session = Get-Content $sessionFile -Raw | ConvertFrom-Json
Write-Host ("Session:   {0}" -f $sessionFile)
Write-Host ("StartedAt: {0}" -f [string]$session.started_at)
Write-Host ("ReportDir: {0}" -f [string]$session.report_dir)

foreach ($entry in @($session.processes)) {
    $pidValue = [int]$entry.pid
    $proc = Get-Process -Id $pidValue -ErrorAction SilentlyContinue
    if ($null -ne $proc) {
        Write-Host ("- {0}: RUNNING (PID {1})" -f [string]$entry.name, $pidValue) -ForegroundColor Green
    }
    else {
        Write-Host ("- {0}: STOPPED (PID {1})" -f [string]$entry.name, $pidValue) -ForegroundColor Red
    }
}

if ($session.urls) {
    if ($session.urls.PSObject.Properties.Match("finance").Count -gt 0 -and $session.urls.finance) {
        Write-Host ("Finance: {0}" -f [string]$session.urls.finance)
    }
    if ($session.urls.PSObject.Properties.Match("chronik").Count -gt 0 -and $session.urls.chronik) {
        Write-Host ("Chronik: {0}" -f [string]$session.urls.chronik)
    }
}
