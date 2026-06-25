---
name: feedback-session-close-no-gdrive
description: "session-close has no Google Drive backup step; don't trust step numbers from old handoff docs as current skill structure"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 634ae456-7186-4706-a1cf-417a02330514
---

The Google Drive backup step is permanently dropped from `/session-close` — never reintroduce it.

**Why:** An old handoff (`2026-06-10-skill-kit-fixes.md`) referenced a stale 6-step
session-close workflow ("Step 5: Google Drive backup, Step 6: bootstrap sync") that no
longer matches the current 3-step `session-close/SKILL.md` (retrospective → skill
management audit → handoff). Following the stale handoff's "next steps" caused the
Google Drive step to be reintroduced into a new plan, which the user had to correct again.

**How to apply:** When resuming from a handoff, treat its "next steps" as historical
context only — verify against the live SKILL.md for the actual current workflow before
building a plan. Specifically, `/session-close` is always retrospective → audit → handoff,
with no Google Drive component.
