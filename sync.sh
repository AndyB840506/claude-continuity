#!/bin/bash
# Claude Continuity - Mac/Linux sync
# Usage: cd claude-continuity && bash sync.sh

CLAUDE_DIR="$HOME/.claude"
LOCAL_CONFIG=".config/local-settings.json"

if [ ! -f "$LOCAL_CONFIG" ]; then
    echo "No local-settings.json found. Run install.sh first."
    exit 1
fi

BASE_DIR=$(python3 -c "import json; print(json.load(open('$LOCAL_CONFIG'))['baseDir'])")

cp "$CLAUDE_DIR/CLAUDE.md" config/CLAUDE.md
cp "$CLAUDE_DIR/settings.json" config/settings.json
echo "Config synced."

# Sync ALL real memory folders verbatim. Do NOT recompute Claude's project slug --
# the derivation differs from Claude Code's, so a computed slug silently misses the real
# folder. Copy every ~/.claude/projects/*/memory that has files, keyed by its real name.
python3 -c "
import os, shutil
claude_dir = os.path.expanduser('~/.claude')
proj_root = os.path.join(claude_dir, 'projects')
for name in sorted(os.listdir(proj_root)):
    src = os.path.join(proj_root, name, 'memory')
    if os.path.isdir(src) and any(os.path.isfile(os.path.join(src, f)) for f in os.listdir(src)):
        dest = os.path.join('memory', name)
        os.makedirs(dest, exist_ok=True)
        for f in os.listdir(src):
            s = os.path.join(src, f)
            if os.path.isfile(s):
                shutil.copy2(s, dest)
        print(f'Memory synced: {name}')
"

git add .
DATE=$(date +%Y-%m-%d)
if ! git diff --cached --quiet; then
    git commit -m "sync: Claude config + memory $DATE"
    git push origin master
    echo "Pushed to GitHub."
else
    echo "Nothing changed."
fi
