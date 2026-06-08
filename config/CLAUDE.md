# Claude Global Config

Replace this file with your actual `~/.claude/CLAUDE.md`.

This file contains your global Claude Code instructions — the rules, preferences, and
behaviors that apply across ALL your projects, regardless of which folder you open.

## What to put here

- Language and tone preferences
- Operating system / shell constraints (e.g. "use PowerShell, not Bash on Windows")
- Principles of truthfulness (always flag uncertainty, never invent API names, etc.)
- Operational rules (where to store files, how to handle IDs, etc.)
- Any behavior you find yourself correcting repeatedly across different projects

## How this file gets used

`install.ps1` (or `install.sh`) copies this file to `~/.claude/CLAUDE.md` on a new machine.
Claude Code reads it automatically for every project.

`sync.ps1` / `sync.sh` copies your current `~/.claude/CLAUDE.md` back here at session-close
so the latest version is always in GitHub.
