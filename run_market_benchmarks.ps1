param(
    [string]$Python = "python",
    [string]$ReportFile = "daemon_runtime_live/atheria_daemon_audit.jsonl",
    [int]$Limit = 220,
    [int]$MinTrainEvents = 24,
    [double]$ScenarioThreshold = 0.03,
    [double]$StepSeconds = 300.0,
    [int]$Seed = 42,
    [string]$JsonOut = "runtime_audit/market_benchmark_report.json",
    [string]$MarkdownOut = "runtime_audit/market_benchmark_table.md",
    [int]$Threads = 1,
    [switch]$SkipTransformer,
    [switch]$Pretty,
    [switch]$OpenJson,
    [switch]$OpenMarkdown
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

$oldOpenBlas = $env:OPENBLAS_NUM_THREADS
$oldOmp = $env:OMP_NUM_THREADS
$oldMkl = $env:MKL_NUM_THREADS

try {
    if (-not (Get-Command $Python -ErrorAction SilentlyContinue)) {
        throw ("Python executable not found: {0}" -f $Python)
    }

    $modulePath = Join-Path $scriptDir "atheria_market_benchmarks.py"
    if (-not (Test-Path $modulePath)) {
        throw ("Module not found: {0}" -f $modulePath)
    }

    $reportFilePath = Resolve-AbsolutePath -PathValue $ReportFile -BaseDir $scriptDir
    $jsonOutPath = Resolve-AbsolutePath -PathValue $JsonOut -BaseDir $scriptDir
    $markdownOutPath = Resolve-AbsolutePath -PathValue $MarkdownOut -BaseDir $scriptDir

    $jsonOutDir = Split-Path -Parent $jsonOutPath
    if ($jsonOutDir -and (-not (Test-Path $jsonOutDir))) {
        New-Item -ItemType Directory -Path $jsonOutDir -Force | Out-Null
    }
    $markdownOutDir = Split-Path -Parent $markdownOutPath
    if ($markdownOutDir -and (-not (Test-Path $markdownOutDir))) {
        New-Item -ItemType Directory -Path $markdownOutDir -Force | Out-Null
    }

    $threadCount = [Math]::Max(1, $Threads)
    $env:OPENBLAS_NUM_THREADS = [string]$threadCount
    $env:OMP_NUM_THREADS = [string]$threadCount
    $env:MKL_NUM_THREADS = [string]$threadCount

    $args = @(
        "atheria_market_benchmarks.py",
        "--report-file", $reportFilePath,
        "--limit", ([string]([Math]::Max(12, $Limit))),
        "--min-train-events", ([string]([Math]::Max(12, $MinTrainEvents))),
        "--scenario-threshold", ([string]([Math]::Max(0.000001, $ScenarioThreshold))),
        "--step-seconds", ([string]([Math]::Max(1.0, $StepSeconds))),
        "--seed", ([string]$Seed),
        "--json-out", $jsonOutPath,
        "--markdown-out", $markdownOutPath
    )
    if ($SkipTransformer) {
        $args += "--skip-transformer"
    }
    if ($Pretty) {
        $args += "--pretty"
    }

    Write-Host ("CMD> {0} {1}" -f $Python, ($args -join " "))
    & $Python @args
    if ($LASTEXITCODE -ne 0) {
        throw ("Market benchmarks failed with exit code {0}" -f $LASTEXITCODE)
    }

    Write-Host ("JSON report: {0}" -f $jsonOutPath)
    Write-Host ("Table report: {0}" -f $markdownOutPath)

    if ($OpenJson -and (Test-Path $jsonOutPath)) {
        Start-Process $jsonOutPath | Out-Null
    }
    if ($OpenMarkdown -and (Test-Path $markdownOutPath)) {
        Start-Process $markdownOutPath | Out-Null
    }

}
finally {
    $env:OPENBLAS_NUM_THREADS = $oldOpenBlas
    $env:OMP_NUM_THREADS = $oldOmp
    $env:MKL_NUM_THREADS = $oldMkl
    Pop-Location
}
