---
name: ai-image-prompts-logo-specificity
description: "Logos en prompts de imagen AI — usar nombres de marca directos, no descripciones geométricas"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 890d5e93-0d2e-45e7-b32d-e50a704328f8
---

En prompts de generación de imagen (Google Flow, Imagen 3, etc.):
- ✅ Correcto: "Spotify logo, Apple Podcasts logo, Amazon Music logo — small, in silver"
- ❌ Incorrecto: "silver platform logos" — vago, el modelo elige logos arbitrarios (ej: PlayStation)
- ❌ Anti-patrón: descripciones geométricas ("circle with sound-wave lines") — innecesariamente complejo y asume incorrectamente que los nombres de marca causan confusión

**El root cause de logos incorrectos es siempre VAGUEDAD, no el uso de nombres de marca.**

**Why:** Al testear artwork EP.002 en Flow salió el logo de PlayStation. Fix v1 usó
descripciones geométricas (asunción incorrecta). Fix v2 confirmado funcional: nombres de marca directos.

**How to apply:** En cualquier prompt de artwork, nombrar las plataformas explícitamente.
Fallback si salen mal: modo edición de Flow acepta brand names para reemplazar logos.

Ver también: [[btq_artwork_flow]]
