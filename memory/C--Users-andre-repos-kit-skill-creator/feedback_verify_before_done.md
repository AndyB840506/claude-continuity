---
name: feedback_verify_before_done
description: Never declare a bug fixed until re-running the exact failing scenario and showing output that proves the error no longer reproduces
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6a3def80-a4e3-4894-98a6-b713e194ee8b
---

Never claim a fix is done until the original failing scenario has been re-run and the output shown.

**Why:** Multiple sessions ended with bugs Claude believed resolved but that still reproduced (JSON errors persisting, shallow data). Declaring "done" without verification gives false confidence and wastes the next session diagnosing the same issue again.

**How to apply:** After any fix, re-run the exact command or flow that originally failed. Paste the output in the response. Only then mark it resolved. If the error still reproduces, keep iterating — do not hand off an unverified fix. User's exact rule: *"After you edit to fix this error, re-run the exact failing command/input and paste the output to confirm the error is actually gone before telling me it's fixed."*
