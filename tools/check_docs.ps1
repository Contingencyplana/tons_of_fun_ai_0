$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$doc = Join-Path $root 'docs/doc_map.md'

if (-not (Test-Path $doc)) {
  Write-Error 'Missing docs/doc_map.md'
  exit 1
}

$content = Get-Content -Path $doc -ErrorAction Stop
if ($null -eq $content -or $content.Count -eq 0) {
  Write-Error 'docs/doc_map.md is empty'
  exit 1
}

Write-Output ("Docs check passed: {0}" -f $doc)
exit 0
