---
name: feedback-reskin-vs-overhaul
description: "When a page is called \"basic/not premium\", overhaul the architecture, not just colors/fonts"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: d481eb4d-455e-45e6-aa59-e357b8d8e1c3
---

When the user calls an existing web page "básica / poco premium / generic", do NOT respond with a reskin (new palette + fonts on the same layout). They will reject it as "the same in the core". A real premium upgrade changes the **architecture**: asymmetric/full-bleed layout (not centered hero + uniform card grid), oversized display type (clamp up to 6–11rem), an editorial interactive list (hover-expand rows) instead of identical cards, marquee, custom cursor, scroll-driven reveals, a dark↔light section break, one signature accent, and line SVGs instead of emoji.

**Why:** selling premium pages requires the site itself to look premium; a reskin keeps the generic-AI structure that reads as "basic".

**How to apply:** ask the user for ONE concrete reference (Awwwards/Dribbble link) up front — it locks the direction instantly and beats iterating blind. Build one page as the proof, get approval, then replicate the language across the rest. See [[feedback-design-references]] and web-page-kit design-guide Rule 17.

**Sibling pages share NEITHER type NOR color (user, 2026-06-26, MPD redesign):** when asked to bring page B "to the same tier" as page A, that means same TECHNIQUE tier (WebGL field, momentum scroll, scrubbed motion), NOT page A's palette or fonts. MPD (crimson/cream/dark, Bebas/Spectral/Space-Mono, concert-ticket episode cards, neon sign) must look NOTHING like BTQ (gold/black, Boska/Satoshi, vinyl). I first reskinned BTQ with new colors and the user rejected it: "no era la idea era hacer una pagina nueva no un reskin." Reinforces the CRITICAL nuance in [[feedback_premium_web_design]].

**Anti-AI-tell bans (user, recurring through 2026-06-26):** zero carousels/marquees, zero cards-on-cards (no nested card stacks), and in COPY no hyphens `-`, no slashes `/`, no em-dashes — they read as AI tells. Grep the copy before delivering. The user wants "obras maestras unicas," not detectable AI output.
