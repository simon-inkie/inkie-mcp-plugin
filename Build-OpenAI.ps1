param([string]$OutputPath)
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
if (-not $OutputPath) { throw 'Supply an absolute OutputPath outside the repository.' }
$manifest = Get-Content (Join-Path $root 'plugin.json') -Raw | ConvertFrom-Json
$mcp = Get-Content (Join-Path $root 'mcp.json') -Raw | ConvertFrom-Json
$ui = $manifest.extensions.'com.openai'.interface
if ($manifest.'$schema' -ne 'https://agent-plugins.org/schemas/1.0.0/plugin.schema.json') { throw 'Invalid plugin schema' }
if ($mcp.'$schema' -ne 'https://agent-plugins.org/schemas/1.0.0/mcp.schema.json') { throw 'Invalid MCP schema' }
if ($ui.shortDescription.Length -gt 30 -or $ui.displayName.Length -gt 30 -or $ui.longDescription.Length -gt 4000) { throw 'Listing too long' }
if ($manifest.apps -or $manifest.extensions.'com.openai'.apps) { throw 'Public package cannot contain app bindings' }
$cases = $manifest.extensions.'com.openai'.review.test_cases
if ($cases.positive.Count -lt 5 -or $cases.negative.Count -lt 3) { throw 'Missing review cases' }
foreach ($case in $cases.positive) {
    foreach ($field in @('description','prompt','tools_triggered','expected_behavior')) {
        if ([string]::IsNullOrWhiteSpace($case.$field) -or $case.$field -isnot [string]) { throw "Invalid case field $field" }
    }
}
foreach ($prompt in $ui.defaultPrompt) { if ($prompt.Length -gt 128 -or $prompt -match '[\r\n]') { throw 'Invalid prompt' } }
$skill = Get-Content (Join-Path $root 'skills/inkie-marketing/SKILL.md') -Raw
if ($skill -notmatch '(?s)^\uFEFF?---\s+name: inkie-marketing\s+description: .+?\r?\n---') { throw 'Invalid skill frontmatter' }
Add-Type -AssemblyName System.IO.Compression.FileSystem
Add-Type -AssemblyName System.Drawing
$icon = [System.Drawing.Image]::FromFile((Join-Path $root $ui.logo))
try { if ($icon.Width -ne $icon.Height -or $icon.Width -lt 256) { throw 'Invalid icon dimensions' } } finally { $icon.Dispose() }
if ((Get-Item (Join-Path $root $ui.logo)).Length -gt 5MB) { throw 'Icon too large' }
if (Test-Path -LiteralPath $OutputPath) { throw 'Output already exists; choose a new filename' }
$zip = [System.IO.Compression.ZipFile]::Open($OutputPath, 'Create')
try {
    foreach ($relative in @('plugin.json','mcp.json','assets/icon.png','skills/inkie-marketing/SKILL.md','LICENSE')) {
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip,(Join-Path $root $relative),$relative) | Out-Null
    }
} finally { $zip.Dispose() }
$zip = [System.IO.Compression.ZipFile]::OpenRead($OutputPath)
try {
    $zip.Entries | ForEach-Object { Write-Output "$($_.FullName) ($($_.Length) bytes)" }
    foreach ($name in @('plugin.json','mcp.json')) {
        $reader = [System.IO.StreamReader]::new($zip.GetEntry($name).Open())
        try { $reader.ReadToEnd() | ConvertFrom-Json | Out-Null } finally { $reader.Dispose() }
    }
    if ($zip.Entries.Count -ne 5) { throw 'Unexpected archive inventory' }
} finally { $zip.Dispose() }
Write-Output 'Local structural checks passed. Portal validation and live tests remain required.'
foreach ($field in @('websiteURL','supportURL','privacyPolicyURL','termsOfServiceURL')) {
    if (-not $ui.$field) { Write-Warning "Submission gap: $field" }
}
if (-not $manifest.extensions.'com.openai'.review.demo_recording_url) { Write-Warning 'Submission gap: verified demo recording URL' }
