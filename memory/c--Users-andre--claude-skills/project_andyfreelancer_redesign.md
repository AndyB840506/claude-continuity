---
name: project_andyfreelancer_redesign
description: "Andyfreelancer.com ultra-premium redesign — locked direction (boutique-showroom, world-map background); index-showroom.html is WIP, not yet live"
metadata: 
  node_type: memory
  type: project
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

Redesign of **andyfreelancer.com** to ultra-premium (Rule 18 tier), started 2026-06-24. Locked direction after ~13 feedback iterations:

- **Concept:** boutique-showroom that *sells experiences, not products*. NOT pure engineering — that framing is reserved for the separate "Lucca Tech" brand. See [[feedback_named_concept_drives_render]].
- **Colors:** charcoal `#0e1113` + brand red `#ff3d00` (logo-dominant), cream `#f4efe7` accent. Dark unified background.
- **Fonts (Fontshare):** Cabinet Grotesk (display) + Supreme (body) + Martian Mono (mono).
- **Signature element:** interactive **world map** background — full world, every country glows red + shows its name on hover/tap. Real Natural Earth geometry (world-atlas + d3-geo + topojson). No cursor light. See the Rule 18 "Full-bleed reactive background — gotchas" subsection in web-page-kit/docs/design-guide.md.

**Status (updated 2026-06-24):** the showroom homepage is **LIVE** — promoted into `one-pager/index.html` (commit `bb7433a`, master) and verified on andyfreelancer.com (worldmap + Cabinet Grotesk + Martian Mono present). The `index-showroom.html` preview file was removed. DO App Platform auto-deploys on push to master (see [[reference_deploy_mechanisms]]). **Next:** redesign the OTHER andyfreelancer pages in the same showroom direction.

Preserves from the original: EN/ES/PT i18n (`setLang`), `/contact` form POST, `/widget.js`, schema.org.

Related: [[reference_andyfreelancer_infra]], [[feedback_security_baseline_client_sites]], [[feedback_premium_web_design]].
