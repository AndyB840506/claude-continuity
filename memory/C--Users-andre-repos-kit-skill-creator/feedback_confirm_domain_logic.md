---
name: feedback_confirm_domain_logic
description: "Before writing code for complex business rules (grid rotation, featured logic, etc.), restate the rule with a concrete example and wait for explicit confirmation"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 0679244e-70df-4255-b4dc-0f7b38856acc
---

Before coding any non-trivial domain logic, restate it back in plain words with a concrete example, then wait for the user's confirmation before writing any code.

**Why:** The BTQ recent-episodes grid rotation logic was misunderstood multiple times across sessions, forcing repeated re-explanation of which episodes show and what "featured" means. Restating first catches mismatches before edits happen.

**How to apply:** Any time the task involves rotation rules, featured/pinned logic, ordering, or conditional display — stop before coding and say: "Here's how I understand this rule: [restatement + concrete example of which episodes/items show]. Is this correct?" Only proceed after explicit confirmation. This pairs with the existing approval-gate habit. See also [[feedback_verify_before_done]].
