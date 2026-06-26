---
name: reference_mpd_website_live
description: "Mr Putrid's Den (MPD) podcast website — live at mrputridsden.com, single HTML, premium tier, deploy quirks"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 5369ce55-ef27-4516-95ba-cc57b92779e0
---

The Mr Putrid's Den (MPD) podcast site is live at **mrputridsden.com** (www serving). Source: `mrputridsden-production/website/index.html` — a single self-contained HTML file (inline CSS/JS), premium tier (GSAP + ScrollTrigger + Lenis + WebGL shader, custom cursor, neon flicker). Sibling of the BTQ site but a DISTINCT identity — see [[feedback_reskin_vs_overhaul]].

**Identity:** palette crimson/cream/dark (`--crimson:#B23B3B`, `--ink:#F1E8D6`, `--bg:#0D0A09`), fonts Bebas Neue + Spectral + Space Mono. Signature elements: WHITE flickering neon sign masthead, concert-ticket episode cards, an AI-generated bar-interior background (`bar-bg.png`) with interactive easter-egg hotspots revealing band names (see [[reference_ai_background_hotspots]]).

**Deploy (CRITICAL — same trap as the rest of this monorepo):** Vercel project `v0-mr-putrids-den`. Its `vercel.json` has `"ignoreCommand":"exit 0"`, so a normal `vercel --prod` produces an EMPTY deploy = 404. MUST use the PREBUILT flow: build `<dir>/.vercel/output/` manually (`config.json`={"version":3}, copy current index.html + bar-bg.png into `static/`), then `vercel deploy --prebuilt --prod`, then `vercel alias set <url> www.mrputridsden.com`. Full steps in deploy-preflight Paso 7. Git auto-deploy is disconnected — production deploys are manual.
