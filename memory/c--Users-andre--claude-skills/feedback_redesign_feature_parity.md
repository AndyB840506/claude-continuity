---
name: feedback_redesign_feature_parity
description: "When replacing a live page with a redesign, audit feature parity AND discoverability — don't drop or bury contact/email/social/nav affordances"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

When promoting a redesign over a live page, a beautiful new look is not enough — the page must keep AND surface every functional affordance the old one had. On the BTQ liner-notes swap (2026-06-24) the user reported twice that contact and then social media were "missing / no están por ningún lado" — even though they technically existed in the bottom footer colophon.

**Why:** A redesign *replaces a working page*. Two distinct failures, both read by the user as "you removed it":
1. **Dropped function** — a redesign can silently omit the contact form, email, social links, platform/RSS links, nav anchors, i18n toggle, form POST, analytics. 
2. **Buried function** — present in the footer but unreachable: a minimal premium top bar with no "Contacto" link means the user never scrolls far enough to find it. Present ≠ findable.

**How to apply:**
- Before swapping `index-redesign.html` → `index.html`, **diff the OLD page** (`git show HEAD~1:path`) and grep for `mailto:`, `instagram|tiktok|linkedin|spotify|youtube`, `#contacto`, form `action=`, i18n. Everything present before must be present after.
- **Surface contact + social**: add a nav link to the contact area, and a dedicated contact section bundling email + working form + social icons together. If the nav can't reach it in one click, assume the user won't find it.
- Static site (Vercel/Netlify) form needs a service (Web3Forms) or serverless function — a `mailto:` is not a form. See [[reference_btq_contact_form]].

Captured in web-page-kit/docs/design-guide.md Rule 17. Related: [[reference_deploy_mechanisms]], [[feedback_named_concept_drives_render]].
