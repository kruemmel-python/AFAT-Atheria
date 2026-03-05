param(
    [string]$Python = "python",
    [string]$ReportFile = "daemon_runtime/atheria_daemon_audit.jsonl",
    [int]$Limit = 180,
    [int]$HorizonSteps = 12,
    [double]$StepSeconds = 300.0,
    [double]$Ridge = 0.08,
    [string]$JsonOut = "runtime_audit/market_future_projection.json",
    [switch]$NoJsonOut,
    [switch]$Pretty,
    [switch]$OpenOutput,
    [switch]$OpenBrowser,
    [int]$HttpPort = 8000
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

function Get-WebRelativePath {
    param(
        [string]$AbsolutePath,
        [string]$BaseDir
    )
    $full = [System.IO.Path]::GetFullPath($AbsolutePath)
    $base = [System.IO.Path]::GetFullPath($BaseDir)
    if (-not $full.StartsWith($base, [System.StringComparison]::OrdinalIgnoreCase)) {
        return $null
    }
    $suffix = $full.Substring($base.Length).TrimStart("\", "/")
    if ([string]::IsNullOrWhiteSpace($suffix)) {
        return $null
    }
    return $suffix.Replace("\", "/")
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $scriptDir

try {
    if (-not (Get-Command $Python -ErrorAction SilentlyContinue)) {
        throw ("Python executable not found: {0}" -f $Python)
    }

    $modulePath = Join-Path $scriptDir "atheria_market_future_projection.py"
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
        "atheria_market_future_projection.py",
        "--report-file", $reportFilePath,
        "--limit", ([string]([Math]::Max(8, $Limit))),
        "--horizon-steps", ([string]([Math]::Max(1, $HorizonSteps))),
        "--step-seconds", ([string]([Math]::Max(1.0, $StepSeconds))),
        "--ridge", ([string]([Math]::Max(0.000001, $Ridge)))
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
        throw ("Future projection failed with exit code {0}" -f $LASTEXITCODE)
    }

    if ($OpenOutput -and (-not $NoJsonOut) -and (Test-Path $jsonOutPath)) {
        Start-Process $jsonOutPath | Out-Null
    }

    if ($OpenBrowser) {
        $proofPath = Join-Path $scriptDir "future_landscape_proof.html"
        if (-not (Test-Path $proofPath)) {
            Write-Warning ("Proof HTML not found: {0}" -f $proofPath)
        }
        elseif ($NoJsonOut) {
            Start-Process ("http://localhost:{0}/future_landscape_proof.html" -f $HttpPort) | Out-Null
        }
        else {
            $webJson = Get-WebRelativePath -AbsolutePath $jsonOutPath -BaseDir $scriptDir
            if ($null -eq $webJson) {
                Write-Warning "JsonOut liegt ausserhalb des Script-Ordners und ist ueber lokalen http.server nicht erreichbar."
                Start-Process ("http://localhost:{0}/future_landscape_proof.html" -f $HttpPort) | Out-Null
            }
            else {
                $url = "http://localhost:{0}/future_landscape_proof.html?json={1}" -f $HttpPort, [uri]::EscapeDataString($webJson)
                Write-Host ("Proof URL: {0}" -f $url)
                Start-Process $url | Out-Null
            }
        }
    }
}
finally {
    Pop-Location
}
