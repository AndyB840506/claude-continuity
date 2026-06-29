---
name: reference_the_freelancer_reuse
description: "C:\\Users\\andre\\repos\\the-freelancer has Andy's real service catalog, voice playbook, and deliverable prompts — read live, never duplicate, when building freelance-related skills"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 636d973b-06eb-49fc-b4cb-2ccaecaf4b2a
---

`C:\Users\andre\repos\the-freelancer` is Andy's live production system for
andyfreelancer.com's own paid intake bot. It is the single source of truth for:
- `services.config.js` — the 7 productized services, real price ranges, intake
  questions.
- `freelancer/bot.js` `SYSTEM_PROMPT` — Andy's voice playbook (persona, tone,
  conversational rules, pricing rules, ToS).
- `freelancer/prompts/{service_id}.md` — per-service deliverable methodology
  and design rules.
- `freelancer/deliverable.js` `BASE_RULES` — output contract (single-file HTML,
  brand frame, language-matching, truth rules) and `resolveServiceId()` fuzzy
  matcher pattern.

That bot only fires for orders through Andy's own site form.

**How to apply:** any skill or task touching freelance work elsewhere (Upwork,
Fiverr, direct outreach) should read these files live at runtime, never copy
their content into the skill — this is what the `freelance-gig` skill
(`c:\Users\andre\.claude\skills\freelance-gig\`, see its `docs/reuse-map.md`)
does, to avoid two divergent definitions of "how Andy works" living in two
repos. If a referenced file is missing/renamed, fall back to generic handling
and say so rather than guessing a replacement.
