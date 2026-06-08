# Memory — my-project

This folder holds Claude's persistent memory for the `my-project` workspace.

## What goes here

Claude Code stores memory files in `~/.claude/projects/<slug>/memory/`. These files
persist across sessions and tell Claude things like:
- Your role and domain expertise
- Feedback you've given ("don't do X", "always do Y")
- Project state and decisions
- References to external systems

## How this works

`sync.ps1` / `sync.sh` copies your project's memory folder from `~/.claude/projects/`
into this repo at session-close. The folder name here (`my-project`) maps to your
project by `folderName` in `projects.json`.

`install.ps1` / `install.sh` restores this folder to the correct location on a new machine,
computing the right slug from your base directory path.

## Add your own memory files

If you want to pre-seed memory for a new machine, add `.md` files here with Claude's
memory format (frontmatter with `name`, `description`, `metadata.type`).

For the memory file format, see the Claude Code documentation or look at how
`claude-bootstrap` structures its own memory files.
