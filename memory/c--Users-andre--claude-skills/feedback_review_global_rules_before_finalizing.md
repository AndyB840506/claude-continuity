---
name: review-global-rules-before-finalizing
description: "Run prompt-reviewer on new/edited CLAUDE.md rules before finalizing, to catch contradictions with existing rules"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bedf27ca-45e2-4991-9284-f4e2b22804e2
---

When adding or editing rules in global CLAUDE.md, run prompt-reviewer (prompt-reviewer-en or /prompt-reviewer) on the changed section before declaring the edit done.

**Why:** a newly-added rule (#17, autonomous iteration within a step) directly contradicted an existing section (Approvals, wait for explicit approval before multi-step work) and wasn't caught by self-review — it only surfaced once a review pass was run.

**How to apply:** after any addition or edit to rules in `~/.claude/CLAUDE.md` (or a project CLAUDE.md), invoke prompt-reviewer-en on the changed section before considering the task complete — check for contradictions and redundancy with existing rules, not just clarity of the new text.
