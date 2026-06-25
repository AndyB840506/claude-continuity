# Claude Continuity - Windows installer
# Run once on a new machine to restore your Claude environment.
# Usage: cd claude-continuity && .\install.ps1
#
# Prerequisites: git, Claude Code CLI installed, GitHub account

param(
    [string]$BaseDir = ""
)

$claudeDir = "$env:USERPROFILE\.claude"

# ---- CONFIGURE THESE ----
# URL of the repo that contains your Claude skills (cloned into ~/.claude/skills/)
$SKILLS_REPO_URL = "https://github.com/AndyB840506/claude-code-skills.git"
# -------------------------

# 1. Ask for projects base directory
if (-not $BaseDir) {
    $defaultBase = "C:\Users\$env:USERNAME\Projects"
    $BaseDir = Read-Host "Projects base directory? (Enter = $defaultBase)"
    if (-not $BaseDir) { $BaseDir = $defaultBase }
}

# 2. Save locally (gitignored — never pushed)
New-Item -ItemType Directory -Force ".\.config" | Out-Null
$escaped = $BaseDir -replace '\\', '\\\\'
"{`"baseDir`": `"$escaped`"}" | Out-File ".\.config\local-settings.json" -Encoding utf8
Write-Host "Base dir saved: $BaseDir"

# 3. Install Claude global config
New-Item -ItemType Directory -Force "$claudeDir\skills" | Out-Null
Copy-Item ".\config\CLAUDE.md" "$claudeDir\CLAUDE.md" -Force
Copy-Item ".\config\settings.json" "$claudeDir\settings.json" -Force
Write-Host "Global config installed."

# 4. Clone skills repo into ~/.claude/skills/
if (-not (Test-Path "$claudeDir\skills\.git")) {
    Write-Host "Cloning skills into $claudeDir\skills ..."
    git clone $SKILLS_REPO_URL "$claudeDir\skills"
} else {
    Write-Host "Skills already cloned — pulling latest."
    Push-Location "$claudeDir\skills"
    git pull origin main
    Pop-Location
}

# 5. Clone project repos into base dir
$projects = Get-Content ".\projects.json" | ConvertFrom-Json
foreach ($p in $projects) {
    $fullPath = Join-Path $BaseDir $p.folderName
    if (-not (Test-Path $fullPath)) {
        Write-Host "Cloning $($p.folderName) into $fullPath ..."
        git clone $p.url $fullPath
    } else {
        Write-Host "$($p.folderName) already exists — skipping clone."
    }
}

# 6. Restore memory files. The repo's memory\<name> folders are keyed by Claude's REAL
# project slug (saved verbatim by sync), so restore mirrors them straight back -- no slug guessing.
$memRoot = ".\memory"
if (Test-Path $memRoot) {
    Get-ChildItem $memRoot -Directory | ForEach-Object {
        $src = $_.FullName
        $files = Get-ChildItem $src -File -Filter *.md | Where-Object { $_.Name -notlike "README*" }
        if ($files.Count -gt 0) {
            $dest = "$claudeDir\projects\$($_.Name)\memory"
            New-Item -ItemType Directory -Force $dest | Out-Null
            $files | ForEach-Object { Copy-Item $_.FullName $dest -Force }
            Write-Host "Memory restored: $($_.Name)"
        }
    }
}

Write-Host ""
Write-Host "Claude restored. Open VS Code in any project folder to start."
Write-Host "Tip: if memory does not load, check ~/.claude/projects/ for the actual slug name."
