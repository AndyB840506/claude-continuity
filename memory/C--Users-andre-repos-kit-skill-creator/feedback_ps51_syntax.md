---
name: feedback_ps51_syntax
description: "All PowerShell scripts must be PS 5.1-compatible — no backtick-quotes, no Unicode, no inline if-expressions, no xcopy"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6a3def80-a4e3-4894-98a6-b713e194ee8b
---

This machine runs Windows + PowerShell 5.1. All scripts must use PS 5.1-compatible syntax only.

**Forbidden:**
- Backtick-quotes (`` ` ``) as line continuation inside strings
- Unicode/emoji characters in scripts
- Inline if-expressions (`$x = if (...) { } else { }` — PS 5.1 parses these poorly in some contexts)
- `xcopy` — use `Copy-Item` instead
- `pwsh` — use `powershell.exe`; pwsh (Core) is not installed

**Why:** Multiple sessions lost time to PS 5.1 parse errors from syntax that works in PS 7+ or Bash but silently fails or errors on this machine.

**How to apply:** Before showing any PowerShell script, mentally parse it for PS 5.1 compatibility. Use `[System.IO.File]::WriteAllText` for UTF-8-no-BOM writes. Use `powershell.exe -NonInteractive -ExecutionPolicy Bypass` as the invocation prefix.

**File-copy scripts specifically:** before running any multi-file copy/move script, do a dry-run on a single file first (or `-WhatIf` if the cmdlet supports it) and confirm it lands correctly before running it against the full set. Catches both PS 5.1 syntax issues and wrong-path/wrong-target mistakes before they multiply across many files.
