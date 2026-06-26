---
name: reference_ai_background_hotspots
description: How to build an immersive AI-generated scene background with interactive overlay hotspots (Canva generate + export + hotspot layer)
metadata: 
  node_type: memory
  type: reference
  originSessionId: 5369ce55-ef27-4516-95ba-cc57b92779e0
---

For an immersive, painterly scene background (e.g. a bar interior with hidden interactive easter eggs), do NOT try to hand-code it in SVG — perspective/painterly scenes can't be drawn convincingly in code. Generate the IMAGE with AI, then overlay an HTML hotspot layer.

**Image generation (Canva MCP):** `generate-design` (e.g. `desktop_wallpaper`) → present candidate design URLs to the user to pick → `create-design-from-candidate` → `get-export-formats` → `export-design` (png). KEY gotcha: the `design.canva.ai` THUMBNAIL URLs require login and are NOT fetchable; only the `export-download.canva.com` URL returned by `export-design` is downloadable. Save that PNG next to the page (e.g. `bar-bg.png`).

**Hotspot overlay pattern:** full-bleed fixed background layer (`#atmo`, z-index 0) holding `background:url(...) center/cover` + a glow/vignette div for text legibility. A SEPARATE interactive layer (`#eggs`, z-index 40, ABOVE content) with `pointer-events:none` on the container and `pointer-events:auto` on each `.egg` button positioned by `left%/top%`. Each egg = a pulsing dot + a hidden `.tag` label that lights up on hover/focus/`.lit`; JS toggles `.lit` on click. Hide the whole egg layer once scrolled past the hero (`scrollY > innerHeight*0.7`) so it doesn't float over later sections.

Validated 2026-06-26 on the MPD site ([[reference_mpd_website_live]]) — bar scene with 8 band/brand easter eggs.
