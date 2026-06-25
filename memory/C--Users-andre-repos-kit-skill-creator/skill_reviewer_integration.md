---
name: skill_reviewer_integration
description: Prompt-reviewer skill integrated into retrospective and handoff workflows
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 1184a771-fb16-4566-810c-b669c0ae8402
---

# Prompt-Reviewer Auto-Integration into Session End Workflows

After `/retrospective` or `/handoff` completes, automatically suggest running `/prompt-reviewer` on the modified skills.

**Integration points:**

1. **After `/retrospective`** — After skills are updated, suggest:
   > "Got it — the skills are updated. Want to run `/prompt-reviewer` on the improved sections to catch any clarity issues before the next session? (Takes 2 min with RÁPIDO mode)"
   - This catches ambiguities or unclear instructions in the updated sections
   - User can say yes/no/later

2. **After `/handoff`** — After backup is pushed, suggest:
   > "Your backup is pushed. Before the next session, want to run `/prompt-reviewer` on any skills you created or modified today? Catches clarity issues early."
   - If they created or modified skills in this session, this is a natural quality gate
   - Ensures new skills are clear before using them again

**Why this works:**
- User already runs retrospective + handoff at session end
- Integrating prompt-reviewer here makes it a natural part of the close-out routine
- RÁPIDO mode = 2-3 min, fits in session wrap-up
- Catches clarity issues before they surface in actual use
