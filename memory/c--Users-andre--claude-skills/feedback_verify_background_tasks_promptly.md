---
name: feedback-verify-background-tasks-promptly
description: "When a run_in_background command is started, actually check its real output before telling the user it's running/done — don't let \"I'll report back\" go unverified"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bedf27ca-45e2-4991-9284-f4e2b22804e2
---

After starting a `run_in_background` command, verify its actual output before
moving on or telling the user "I'll report back when it finishes." A failure
(bad CLI flags, malformed JSON input, etc.) can happen instantly, before any
real work starts — but if the result isn't checked promptly, that failure sits
silently and the user is left thinking something is in progress when it
already failed.

**Why:** During the Kuma Talent Facebook-scrape exploration (2026-06-29),
several `apify actors call` background runs were started with "running now,
I'll report back" — but two of them had already failed instantly (flag
conflict, then a JSON quoting bug) and weren't actually re-checked until the
user prompted again much later in the session, after a batch of stale
task-notifications surfaced on reconnect. No harm was done (failures cost
nothing), but it created a false impression of progress for longer than
necessary.

**How to apply:** Treat "started in background" as incomplete until the
output is actually read and confirmed — not just assumed. This matters most
when the user is waiting on a concrete deliverable from that command, less so
for exploratory/throwaway probes where a delayed check is low-stakes.
