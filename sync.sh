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

python3 -c "
import json, os, shutil, re
projects = json.load(open('projects.json'))
base = '$BASE_DIR'
claude_dir = os.path.expanduser('~/.claude')
for p in projects:
    full = os.path.join(base, p['folderName'])
    slug = re.sub(r'[:\\/ ]', '--', full.lower())
    slug = re.sub(r'-{2,}', '--', slug).lstrip('-')
    src = os.path.join(claude_dir, 'projects', slug, 'memory')
    dest = os.path.join('memory', p['folderName'])
    if os.path.exists(src):
        os.makedirs(dest, exist_ok=True)
        for f in os.listdir(src):
            shutil.copy2(os.path.join(src, f), dest)
        print(f'Memory synced: {p[\"folderName\"]}')
"

git add .
DATE=$(date +%Y-%m-%d)
if ! git diff --cached --quiet; then
    git commit -m "sync: Claude config + memory $DATE"
    git push origin main
    echo "Pushed to GitHub."
else
    echo "Nothing changed."
fi
