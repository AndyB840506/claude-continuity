---
name: feedback_artwork_workflow_no_omni
description: Omni/Flow Video animations are skipped — token cost too high. Static artwork (including quote cards) iterates freely.
metadata: 
  node_type: memory
  type: feedback
  originSessionId: f66742cc-ac0d-4bda-aa3f-7621f54e3751
---

No usar Omni (Flow Video) para animaciones de episodios — el flujo estándar es
artwork estático: 1:1 + 9:16 + 16:9. **Quote cards SÍ están dentro del flujo** (son
imágenes estáticas, no animadas) — corregido tras confirmación del usuario en la
sesión que restructuró `episode-pipeline` en 3 macro-stages: "Lo que se descartó fue
la animación por el problema de tokens, pero sí podemos generar iteraciones de
imágenes estáticas sin límite."

**Why:** Omni consume muchos tokens y si el resultado sale mal toca regenerar varias
veces — costo/riesgo alto solo en animación. Las imágenes estáticas no tienen ese
límite de iteración.

**How to apply:** En workflows de artwork, no ofrecer animaciones Omni. Sí ofrecer y
generar quote cards estáticas como parte normal del flujo de marketing/lanzamiento —
ver [[btq_artwork_flow]], `btq-project/workflows/quote-cards.md` (BTQ, ya construido)
y `episode-pipeline/workflows/03b-marketing.md`.
