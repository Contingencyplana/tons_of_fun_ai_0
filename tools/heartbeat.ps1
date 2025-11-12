Param(
  [string]$OutDir = 'logs'
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $root

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

$ts = (Get-Date).ToUniversalTime().ToString('s') + 'Z'
$payload = [ordered]@{
  timestamp_utc = $ts
  workspace     = 'tons_of_fun_ai_0'
  script        = 'tools/heartbeat.ps1'
  hub_path      = $env:SHAGI_EXCHANGE_PATH
}

$fileName = 'heartbeat-' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '.json'
$outPath = Join-Path $OutDir $fileName

$payload | ConvertTo-Json -Depth 5 | Out-File -FilePath $outPath -Encoding utf8
Write-Output ("Heartbeat written to {0}" -f $outPath)
