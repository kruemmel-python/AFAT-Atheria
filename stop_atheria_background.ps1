param(
    [string]$ReportDir = "daemon_runtime",
    [switch]$Force
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

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $scriptDir

try {
    $reportPath = Resolve-AbsolutePath -PathValue $ReportDir -BaseDir $scriptDir
    $sessionFile = Join-Path (Join-Path $reportPath "_background") "session.json"

    if (-not (Test-Path $sessionFile)) {
        Write-Host ("Keine Session-Datei gefunden: {0}" -f $sessionFile) -ForegroundColor Yellow
        exit 0
    }

    $session = Get-Content $sessionFile -Raw | ConvertFrom-Json
    $stopped = @()
    $missing = @()
    $errors = @()

    foreach ($entry in @($session.processes)) {
        $name = [string]$entry.name
        $pidValue = [int]$entry.pid
        if ($pidValue -le 0) {
            continue
        }
        $proc = Get-Process -Id $pidValue -ErrorAction SilentlyContinue
        if ($null -eq $proc) {
            $missing += ("{0} (PID {1})" -f $name, $pidValue)
            continue
        }
        try {
            if ($Force) {
                Stop-Process -Id $pidValue -Force -ErrorAction Stop
            }
            else {
                Stop-Process -Id $pidValue -ErrorAction Stop
            }
            $stopped += ("{0} (PID {1})" -f $name, $pidValue)
        }
        catch {
            $errors += ("{0} (PID {1}): {2}" -f $name, $pidValue, $_.Exception.Message)
        }
    }

    Write-Step "Stop summary"
    if ($stopped.Count -gt 0) {
        Write-Host ("Gestoppt: {0}" -f ($stopped -join ", ")) -ForegroundColor Green
    }
    if ($missing.Count -gt 0) {
        Write-Host ("Bereits beendet: {0}" -f ($missing -join ", ")) -ForegroundColor Yellow
    }
    if ($errors.Count -gt 0) {
        foreach ($line in $errors) {
            Write-Host ("Fehler: {0}" -f $line) -ForegroundColor Red
        }
    }

    Remove-Item -Path $sessionFile -Force -ErrorAction SilentlyContinue
}
finally {
    Pop-Location
}
