param(
    [string]$Python = "python",
    [string]$ReportFile = "daemon_runtime/atheria_daemon_audit.jsonl",
    [int]$Limit = 180,
    [int]$SpatialDims = 3,
    [int]$ProbeCount = 24,
    [int]$ProbeSteps = 180,
    [double]$Dt = 0.045,
    [double]$Gravity = 0.55,
    [ValidateSet("standard", "conservative")]
    [string]$Mode = "standard",
    [switch]$AutoTuneConservative,
    [int]$AutoTuneMaxTrials = 12,
    [double]$AutoTuneTargetCorr = 0.35,
    [switch]$AutoTuneStopOnVerified,
    [int]$PathDecimation = 2,
    [string]$JsonOut = "runtime_audit/einstein_like_reconstruction.json",
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

    $modulePath = Join-Path $scriptDir "atheria_information_einstein_like.py"
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

    $effectiveMode = $Mode
    if ($AutoTuneConservative) {
        $effectiveMode = "conservative"
    }

    $args = @(
        "atheria_information_einstein_like.py",
        "--report-file", $reportFilePath,
        "--limit", ([string]([Math]::Max(4, $Limit))),
        "--spatial-dims", ([string]([Math]::Max(2, $SpatialDims))),
        "--probe-count", ([string]([Math]::Max(4, $ProbeCount))),
        "--probe-steps", ([string]([Math]::Max(20, $ProbeSteps))),
        "--dt", ([string]([Math]::Max(0.005, $Dt))),
        "--gravity", ([string]([Math]::Max(0.000001, $Gravity))),
        "--mode", $effectiveMode,
        "--path-decimation", ([string]([Math]::Max(1, $PathDecimation)))
    )
    if ($AutoTuneConservative) {
        $args += "--auto-tune-conservative"
        $args += @("--auto-tune-max-trials", ([string]([Math]::Max(1, $AutoTuneMaxTrials))))
        $args += @("--auto-tune-target-corr", ([string]([Math]::Max(0.0, $AutoTuneTargetCorr))))
        if ($AutoTuneStopOnVerified) {
            $args += "--auto-tune-stop-on-verified"
        }
    }
    if (-not $NoJsonOut) {
        $args += @("--json-out", $jsonOutPath)
    }
    if ($Pretty) {
        $args += "--pretty"
    }

    Write-Host ("CMD> {0} {1}" -f $Python, ($args -join " "))
    & $Python @args
    if ($LASTEXITCODE -ne 0) {
        throw ("Einstein-like reconstruction failed with exit code {0}" -f $LASTEXITCODE)
    }

    if ($OpenOutput -and (-not $NoJsonOut) -and (Test-Path $jsonOutPath)) {
        Start-Process $jsonOutPath | Out-Null
    }

    if ($OpenBrowser) {
        $proofPath = Join-Path $scriptDir "einstein_like_proof.html"
        if (-not (Test-Path $proofPath)) {
            Write-Warning ("Proof HTML not found: {0}" -f $proofPath)
        }
        elseif ($NoJsonOut) {
            Start-Process ("http://localhost:{0}/einstein_like_proof.html" -f $HttpPort) | Out-Null
        }
        else {
            $webJson = Get-WebRelativePath -AbsolutePath $jsonOutPath -BaseDir $scriptDir
            if ($null -eq $webJson) {
                Write-Warning "JsonOut liegt ausserhalb des Script-Ordners und ist ueber lokalen http.server nicht erreichbar."
                Start-Process ("http://localhost:{0}/einstein_like_proof.html" -f $HttpPort) | Out-Null
            }
            else {
                $url = "http://localhost:{0}/einstein_like_proof.html?json={1}" -f $HttpPort, [uri]::EscapeDataString($webJson)
                Write-Host ("Proof URL: {0}" -f $url)
                Start-Process $url | Out-Null
            }
        }
    }
}
finally {
    Pop-Location
}
