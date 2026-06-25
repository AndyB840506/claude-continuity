---
name: feedback-duplicate-projects
description: Claude Projects/ has duplicate/archive folders that are not real projects — verify before auditing
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c489a420-1e04-41e3-aa7e-47244ad589dd
---

Not every folder in `E:\Claude Project\Claude Projects\` is an active project:

- `kit-podcast-creator-20260521T122725Z-3-001` — ZIP artifact, contains only a duplicate `kit-podcast-creator/` subfolder. Flag for deletion, not audit.
- `leads` — Contains only CSV/HTML files. No CLAUDE.md, no skills, no structure. Flag as incomplete.
- `10 SKILLS ADRI Y JUANPE` — Contains copies of 10 skill kits intended for Adri and Juanpe. May be independent versions or duplicates of root-level kits. Verify before modifying.

**Why:** During the full audit planning, these three folders were missed in the initial list. Discovered only by running `Get-ChildItem` directly.

**How to apply:** Always run `Get-ChildItem "E:\Claude Project\Claude Projects\" -Directory` before any full-project audit to get the verified, current list. Never rely on memory or a previous session's list.
