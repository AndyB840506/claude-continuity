---
name: feedback_premium_web_design
description: "Web pages must be art-directed and distinctive, never the default generic AI skeleton — applies to all web work"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

When building ANY web page, art direction comes FIRST and is non-negotiable. Do not emit the generic AI skeleton (centered hero with gradient + two buttons, a row of 3 identical feature cards, auto-rotating carousel, rotating gradient ring around a photo, alternating white/grey/white sections, Inter/Roboto as display font, reflexive parallax + count-up stats). The user explicitly rejects "premium-but-identical-clone" output and wants ultra-premium, agency-grade pages.

**Why:** the user judged my past pages as generic — same layout/header/carousel every time. Distinctiveness (not more tooling) is the gap; I already have the `frontend-design` and `ui-ux-pro-max` skills.

**How to apply:** (1) get ONE real reference first (Awwwards/Dribbble) or commit to a stated tone; (2) commit to a concept = tone + layout architecture + one signature idea, written before coding; (3) make the layout serve the concept (asymmetric/editorial, oversized display type clamp 5–11rem, line SVGs not emoji, intentional concept-driven motion); (4) run the anti-generic checklist before delivery. Full standard lives in `web-page-kit/docs/design-guide.md` Rule 0 + the homepage workflow now treats the old skeleton as opt-in building blocks. Reinforces [[feedback_design_references]] and [[reskin_vs_overhaul]]; security still applies per [[feedback_security_baseline_client_sites]].

**Premium / agency tier (validated 2026-06-23 on BTQ liner-notes page):** when the brief is explicitly "ultra-premium / break the mold," promote to the stack in `design-guide.md` **Rule 18** — a GLOBAL fixed WebGL reactive field behind the whole page (not hero-only — that's why "everything after the scroll feels dead"), Lenis momentum scroll with `syncTouch:true`, GSAP ScrollTrigger scrubbed/pinned motion (not uniform fade-up), tactile click feedback (DOM ripple + decaying shader pulse via pointerdown/pointermove), Fontshare fonts (Boska/Satoshi) not Google. CDN libs are allowed at this tier (Rule 1 exception). Everything must degrade gracefully + full reduced-motion branch. User confirmed "se ve genial." The user often tests on TOUCH — prioritize touch fluidity (syncTouch, pointer events), not mouse.

**CRITICAL nuance (user, 2026-06-23):** Rule 18 is a TECHNIQUE/capability tier, NOT a look. Do NOT copy-paste BTQ's black+gold / Boska / fbm-gold-shader / vinyl metaphor onto new pages or redesigns — that just makes a new generic clone (the exact failure Rule 0 prevents). For every new page or redesign, re-run Rule 0: the page TYPE + brand + one reference decide the concept (palette, type, what the reactive field actually *is*, the signature metaphor). Rule 18 only supplies the engine (reactive global field, momentum scroll, scrubbed motion, tactile feedback); the vehicle is rebuilt each time. If two premium-tier pages could swap palettes/fonts and look interchangeable, the concept step was skipped. See [[feedback_reskin_vs_overhaul]] for the sibling-pages-share-neither-type-nor-color rule and the anti-AI-tell copy bans (no carousels/marquees, no cards-on-cards, no `-`/`/`/em-dash in copy).

**Reveal robustness (user, 2026-06-26, "no cargo bien"):** never gate content visibility on JS — do NOT set `opacity:0` in CSS and rely on GSAP/JS to reveal it. If the script throws, the whole page stays blank. Make content visible BY DEFAULT and animate with GSAP `.from()` (start state in the tween, end state is the natural DOM), and wrap the GSAP/ScrollTrigger block in try/catch so a CDN or shader failure degrades to a fully readable static page.
