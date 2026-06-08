# claude-continuity

**Survive OS reformats. Resume Claude sessions across machines. Never lose context again.**

A GitHub-based continuity system for [Claude Code](https://claude.ai/code) that keeps your
AI assistant in sync across multiple machines — or restores it completely after a reformat.

---

## The Problem

You invest weeks teaching Claude how to work with your projects: preferences, rules, project
memory, custom skills. Then you reformat your machine (or switch to a laptop), and it's all gone.
Claude is a stranger again.

The root cause: Claude Code stores its "brain" in `~/.claude/` — a local folder that's never
backed up, never synced, never version-controlled.

This repo fixes that.

---

## How It Works

Two things need to survive a reformat:

1. **Claude's global config** — `~/.claude/CLAUDE.md`, `settings.json`, skills
2. **Per-project context** — handoff docs showing where you paused and what comes next

**This repo handles #1.** Your project repo handles #2 (via `.agents/handoff/` files).

At the end of each session, `sync.ps1` (or `sync.sh`) copies your latest `~/.claude/` state
to this repo and pushes to GitHub. On a new machine, `install.ps1` (or `install.sh`) pulls it
all back in one step.

```
[Machine A] session-close → sync.ps1 → push to GitHub
[Machine B] install.ps1 → pull from GitHub → Claude restored
             open project in VS Code → CLAUDE.md auto-resume →
             "Pick up where you left off on Machine A?"
```

---

## Quick Start

### 1. Use this template

Click **"Use this template"** on GitHub to create your private copy.

### 2. Configure

Edit `projects.json`:
```json
[
  {
    "url": "https://github.com/you/your-project.git",
    "folderName": "your-project"
  }
]
```

Edit `install.ps1` / `install.sh` and set `SKILLS_REPO_URL` to your Claude skills repo
(the repo that gets cloned into `~/.claude/skills/`).

Replace `config/CLAUDE.md` with your actual `~/.claude/CLAUDE.md`.
Replace `config/settings.json` with your actual `~/.claude/settings.json`.

### 3. Install on this machine

**Windows:**
```powershell
git clone https://github.com/YOUR_USERNAME/claude-continuity.git
cd claude-continuity
.\install.ps1
```

**Mac/Linux:**
```bash
git clone https://github.com/YOUR_USERNAME/claude-continuity.git
cd claude-continuity
bash install.sh
```

The installer asks where to put your project repos (e.g. `C:\Projects` or `~/Projects`).
That answer is saved locally in `.config/local-settings.json` (gitignored — never pushed).

### 4. Keep in sync (run at end of each session)

```powershell
cd path/to/claude-continuity
.\sync.ps1   # Windows
# or
bash sync.sh  # Mac/Linux
```

Tip: integrate this into your Claude Code session-close ritual so it runs automatically.

### 5. Restore on a new machine

Same as step 3 — clone the repo, run the installer, done.

---

## Per-project handoff docs (cross-machine context)

This repo handles global config. For per-project context (what were you working on?), add
auto-resume to your project's `CLAUDE.md`:

```markdown
## On startup

**Before responding**, in this order:

1. Run `git pull origin main`
2. Check `.agents/handoff/` for the most recent file
3. If one exists: summarize it in 2-3 lines and ask if the user wants to continue from there
4. If none: proceed with the normal welcome message
```

Then configure your `/handoff` skill to write files and push instead of using clipboard.
The handoff file in `.agents/handoff/YYYY-MM-DD-topic.md` becomes the cross-machine context.

---

## Repository structure

```
claude-continuity/
├── install.ps1          # Windows: one-time setup per machine
├── install.sh           # Mac/Linux: same
├── sync.ps1             # Windows: run at session-close
├── sync.sh              # Mac/Linux: same
├── .config/             # gitignored — local machine settings only
│   └── local-settings.json
├── config/
│   ├── CLAUDE.md        # your ~/.claude/CLAUDE.md
│   └── settings.json    # your ~/.claude/settings.json
├── memory/
│   └── your-project/   # memory files per project
└── projects.json        # repos to clone (URL + folder name, no absolute paths)
```

---

## Platform compatibility

- **Windows**: PowerShell 5.1+ (`install.ps1`, `sync.ps1`)
- **Mac/Linux**: bash + Python 3 (`install.sh`, `sync.sh`)
- **Any disk / any path**: no hardcoded absolute paths — the installer asks where to put things

---

## Note on memory slugs

Claude Code identifies projects by a slug derived from the workspace path. The installer
computes this slug automatically. If memory doesn't load after a restore, check
`~/.claude/projects/` for the actual folder name Claude created and copy the memory files
there manually — it's a one-time fix per machine.

---

## Privacy

Keep this repo **private** — it contains your Claude configuration and project memory,
which may include sensitive context about your work.

---

Made with ❤️ by someone who formatted their machine one too many times.
