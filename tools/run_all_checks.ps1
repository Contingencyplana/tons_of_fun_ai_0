Param(
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $root

$failures = 0

Write-Host 'Running ops_readiness...' -ForegroundColor Cyan
python -m tools.ops_readiness
if ($LASTEXITCODE -ne 0) { $failures++ }

Write-Host 'Validating staged JSON...' -ForegroundColor Cyan
./tools/validate_staged_json.ps1
if ($LASTEXITCODE -ne 0) { $failures++ }

Write-Host 'Checking docs...' -ForegroundColor Cyan
./tools/check_docs.ps1
if ($LASTEXITCODE -ne 0) { $failures++ }

if ($failures -gt 0) {
  Write-Error ("run_all_checks failed with {0} error(s)" -f $failures)
  exit 1
}

Write-Host 'All checks passed' -ForegroundColor Green
exit 0
