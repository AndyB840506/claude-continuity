#!/bin/bash
# Claude Continuity - Mac/Linux installer
# Usage: cd claude-continuity && bash install.sh
#
# Prerequisites: git, Claude Code CLI installed, GitHub account

CLAUDE_DIR="$HOME/.claude"

# ---- CONFIGURE THIS ----
SKILLS_REPO_URL="https://github.com/AndyB840506/claude-code-skills.git"
# ------------------------

# 1. Ask for projects base directory
DEFAULT_BASE="$HOME/Projects"
read -p "Projects base directory? (Enter = $DEFAULT_BASE): " BASE_DIR
BASE_DIR="${BASE_DIR:-$DEFAULT_BASE}"

# 2. Save locally (gitignored)
mkdir -p ".config"
printf '{"baseDir": "%s"}' "$BASE_DIR" > .config/local-settings.json
echo "Base dir saved: $BASE_DIR"

# 3. Install Claude global config
mkdir -p "$CLAUDE_DIR/skills"
cp config/CLAUDE.md "$CLAUDE_DIR/CLAUDE.md"
cp config/settings.json "$CLAUDE_DIR/settings.json"
echo "Global config installed."

# 4. Clone skills repo into ~/.claude/skills/
if [ ! -d "$CLAUDE_DIR/skills/.git" ]; then
    echo "Cloning skills into $CLAUDE_DIR/skills/ ..."
    git clone "$SKILLS_REPO_URL" "$CLAUDE_DIR/skills"
else
    echo "Skills already cloned — pulling latest."
    git -C "$CLAUDE_DIR/skills" pull origin main
fi

# 5. Clone project repos
python3 -c "
import json, subprocess, os, sys
projects = json.load(open('projects.json'))
base = sys.argv[1]
for p in projects:
    full = os.path.join(base, p['folderName'])
    if not os.path.exists(full):
        print(f'Cloning {p[\"folderName\"]} ...')
        subprocess.run(['git', 'clone', p['url'], full])
    else:
        print(f'{p[\"folderName\"]} already exists — skipping.')
" "$BASE_DIR"

# 6. Restore memory. The repo's memory/<name> folders are keyed by Claude's REAL project
# slug (saved verbatim by sync), so restore mirrors them straight back -- no slug guessing.
python3 -c "
import os, shutil
claude_dir = os.path.expanduser('~/.claude')
mem_root = 'memory'
if os.path.isdir(mem_root):
    for name in sorted(os.listdir(mem_root)):
        src = os.path.join(mem_root, name)
        if not os.path.isdir(src):
            continue
        files = [f for f in os.listdir(src) if f.endswith('.md') and not f.startswith('README')]
        if not files:
            continue
        dest = os.path.join(claude_dir, 'projects', name, 'memory')
        os.makedirs(dest, exist_ok=True)
        for f in files:
            shutil.copy2(os.path.join(src, f), dest)
        print(f'Memory restored: {name}')
"

echo ""
echo "Claude restored. Open VS Code in any project folder to start."
