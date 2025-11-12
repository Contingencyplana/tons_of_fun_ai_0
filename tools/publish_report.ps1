Param(
  [string]$ReportPath = 'planning/reports',
  [switch]$CopyToHub
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $root

if (-not (Test-Path $ReportPath)) {
  Write-Error ("No reports path: {0}" -f $ReportPath)
  exit 1
}

$reports = Get-ChildItem -Path $ReportPath -Filter '*.md' -File -ErrorAction SilentlyContinue
if (-not $reports) {
  Write-Host 'No markdown reports to publish.'
} else {
  New-Item -ItemType Directory -Force -Path 'logs' | Out-Null
  $logPath = 'logs/publish_report.json'
  $payload = [ordered]@{
    timestamp_utc = ((Get-Date).ToUniversalTime().ToString('s') + 'Z')
    workspace     = 'tons_of_fun_ai_0'
    published     = ($reports | ForEach-Object { $_.Name })
    copied_to_hub = $false
  }
  $payload | ConvertTo-Json -Depth 6 | Out-File -FilePath $logPath -Encoding utf8
  Write-Host ("Publish stub wrote {0}" -f $logPath)
}

if ($CopyToHub) {
  # Optional: run exchange sync to push any staged artifacts
  python tools/exchange_all.py
}

exit 0
