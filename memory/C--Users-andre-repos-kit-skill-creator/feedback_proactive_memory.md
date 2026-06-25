---
name: feedback-proactive-memory
description: "Save project details to memory proactively when established — don't wait for user to prompt it"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: ae4d7819-351d-4cfd-a24a-7e5b096e0199
---

Save to memory proactively when these are established in conversation: team names, contact info, company/entity name, geographic scope, project goals, key constraints.

**Why:** In the Kuma Group grant session, memory was only created at end of session after user said "yes save it" — key facts (province, team names, contact info) were available earlier. Earlier memory saves would have prevented the Ontario→Alberta rewrite (wrong province was assumed because geographic signals weren't captured and referenced proactively).

**How to apply:** When a user provides project-identifying details (team members, location, entity name, contact info, scope), write the memory entry in that same turn. Don't defer to end of session or wait for the user to ask.
