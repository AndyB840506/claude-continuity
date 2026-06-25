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

# 2. Sync ALL real memory folders verbatim.
# Do NOT recompute Claude's project slug -- the derivation differs from Claude Code's
# (case + dash handling), so a computed slug silently misses the real folder. Instead,
# copy every ~/.claude/projects/*/memory that actually has files, keyed by its real name.
$projRoot = "$claudeDir\projects"
Get-ChildItem $projRoot -Directory | ForEach-Object {
    $src = Join-Path $_.FullName "memory"
    if ((Test-Path $src) -and (Get-ChildItem $src -File -ErrorAction SilentlyContinue)) {
        $dest = ".\memory\$($_.Name)"
        New-Item -ItemType Directory -Force $dest | Out-Null
        Copy-Item "$src\*" $dest -Recurse -Force
        Write-Host "Memory synced: $($_.Name)"
    }
}

# 3. Commit and push
git add .
$date = Get-Date -Format "yyyy-MM-dd"
$status = git status --porcelain
if ($status) {
    git commit -m "sync: Claude config + memory $date"
    git push origin master
    Write-Host "Bootstrap pushed to GitHub."
} else {
    Write-Host "Nothing changed -- no commit needed."
}
