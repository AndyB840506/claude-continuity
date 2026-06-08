# Claude Continuity - Windows sync
# Run at end of each session to push latest ~/.claude config and memory to GitHub.
# Usage: cd claude-continuity && .\sync.ps1

$claudeDir = "$env:USERPROFILE\.claude"
$localConfig = ".\.config\local-settings.json"

if (-not (Test-Path $localConfig)) {
    Write-Host "No local-settings.json found. Run install.ps1 first."
    exit 1
}

$settings = Get-Content $localConfig | ConvertFrom-Json
$baseDir = $settings.baseDir

# 1. Sync global config
Copy-Item "$claudeDir\CLAUDE.md" ".\config\CLAUDE.md" -Force
Copy-Item "$claudeDir\settings.json" ".\config\settings.json" -Force
Write-Host "Config synced."

# 2. Sync memory for each project
$projects = Get-Content ".\projects.json" | ConvertFrom-Json
foreach ($p in $projects) {
    $fullPath = Join-Path $baseDir $p.folderName
    $slug = $fullPath.ToLower() -replace '[:\\/ ]', '--' -replace '-{2,}', '--'
    $slug = $slug.TrimStart('-')
    $src = "$claudeDir\projects\$slug\memory"
    if (Test-Path $src) {
        $dest = ".\memory\$($p.folderName)"
        New-Item -ItemType Directory -Force $dest | Out-Null
        Copy-Item "$src\*" $dest -Force
        Write-Host "Memory synced: $($p.folderName)"
    }
}

# 3. Commit and push
git add .
$date = Get-Date -Format "yyyy-MM-dd"
$status = git status --porcelain
if ($status) {
    git commit -m "sync: Claude config + memory $date"
    git push origin main
    Write-Host "Bootstrap pushed to GitHub."
} else {
    Write-Host "Nothing changed — no commit needed."
}
