---
name: btq-website
description: "BTQ website live at behind-thequeue.com — tech stack, Vercel project, how to update"
metadata: 
  node_type: memory
  type: project
  originSessionId: 56aacff5-ab69-4d39-a320-08278566231e
---

El sitio de Behind the Queue está live en **behind-thequeue.com**.

**Stack:** Single HTML file self-contained (CSS/JS inline) — mismo modelo que mrputridsden.com.

**Archivos (ruta verificada 2026-06-07 — la carpeta real es `btq-production\website`, no `.claude\skills\btq-project\website`):**
- `e:\Claude Project\Claude Projects\kit-skill-creator\btq-production\website\index.html`
- `e:\Claude Project\Claude Projects\kit-skill-creator\btq-production\website\vercel.json`
- `e:\Claude Project\Claude Projects\kit-skill-creator\btq-production\website\robots.txt`
- `.vercel\project.json` → projectId `prj_SIXnUYNlwet3DbAVlKpDrV353f3U`, projectName `website`
- Imagen Andy: `1000092965.png`
- Logo BTQ: `Podcast_logo_design_202604211135.jpg`

**Vercel:** Proyecto `website` bajo cuenta `mrputridsden`. Dominio conectado en GoDaddy con A record `216.198.79.1`.

**Para actualizar el sitio (agregar episodios, cambiar copy):**
1. Editar `index.html`
2. Desde la carpeta `btq-production\website\`: `vercel --prod`
3. Live en ~30 segundos — verificar con `curl -s "https://behind-thequeue.com/?v=$(date +%s)" | grep "ep-num"`

**Why:** Wix fue cancelado — costo alto, páginas rotas, poca flexibilidad.
**How to apply:** Al agregar episodios nuevos, editar las ep-cards en el HTML Y re-deployar con `vercel --prod` — el commit a git NO actualiza el sitio en vivo (deploy es manual vía Vercel CLI, no auto-deploy desde git push). Confirmado en EP.016: el HTML ya tenía el grid correcto en el commit pero el sitio seguía mostrando el grid viejo hasta correr `vercel --prod`.
