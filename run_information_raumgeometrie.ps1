param(
    [string]$Python = "python",
    [string]$ReportFile = "daemon_runtime/atheria_daemon_audit.jsonl",
    [int]$Limit = 120,
    [int]$SpatialDims = 3,
    [int]$TopLinks = 8,
    [string]$JsonOut = "runtime_audit/spacetime_reconstruction.json",
    [switch]$NoJsonOut,
    [switch]$Pretty,
    [switch]$OpenOutput
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
Push-Location $scriptDir

try {
    if (-not (Get-Command $Python -ErrorAction SilentlyContinue)) {
        throw ("Python executable not found: {0}" -f $Python)
    }

    $modulePath = Join-Path $scriptDir "atheria_spacetime_reconstruction.py"
    if (-not (Test-Path $modulePath)) {
        throw ("Module not found: {0}" -f $modulePath)
    }

    $reportFilePath = Resolve-AbsolutePath -PathValue $ReportFile -BaseDir $scriptDir
    $jsonOutPath = Resolve-AbsolutePath -PathValue $JsonOut -BaseDir $scriptDir
    if (-not $NoJsonOut) {
        $jsonOutDir = Split-Path -Parent $jsonOutPath
        if ($jsonOutDir -and (-not (Test-Path $jsonOutDir))) {
            New-Item -ItemType Directory -Path $jsonOutDir -Force | Out-Null
        }
    }

    $args = @(
        "atheria_spacetime_reconstruction.py",
        "--report-file", $reportFilePath,
        "--limit", ([string]([Math]::Max(3, $Limit))),
        "--spatial-dims", ([string]([Math]::Max(1, $SpatialDims))),
        "--top-links", ([string]([Math]::Max(1, $TopLinks)))
    )
    if (-not $NoJsonOut) {
        $args += @("--json-out", $jsonOutPath)
    }
    if ($Pretty) {
        $args += "--pretty"
    }

    Write-Host ("CMD> {0} {1}" -f $Python, ($args -join " "))
    & $Python @args
    if ($LASTEXITCODE -ne 0) {
        throw ("Spacetime reconstruction failed with exit code {0}" -f $LASTEXITCODE)
    }

    if ($OpenOutput -and (-not $NoJsonOut) -and (Test-Path $jsonOutPath)) {
        Start-Process $jsonOutPath | Out-Null
    }
}
finally {
    Pop-Location
}
