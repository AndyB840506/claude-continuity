---
name: feedback-flow-quotecard-text-validation
description: Validar texto de quote cards de Flow contra el audio real + regla sin-tildes antes de aprobar
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 0f445e9b-39d7-417f-9c67-aa2ced2456e8
---

Antes de aprobar una quote card generada en Flow, validar su texto contra (1) lo que el host **realmente dijo en la grabación** (SRT) y (2) la regla de marca de **sin tildes en el texto dentro de la imagen**.

**Why:** En BTQ EP.017, la card Q3 volvió de Flow con "PODÍA" (con tilde, viola la regla sin-tildes) y "SU PRESENCIA" cuando el host grabó "UNA presencia". Aprobar sin contrastar contra el audio + la regla habría publicado texto que no coincide con el episodio ni con el estándar visual.

**How to apply:** al revisar imágenes, leer cada card y comparar su texto con la frase del SRT y con el caption aprobado; verificar que no quedaron tildes/eñes. Si solo falla el texto, NO regenerar — edición sobre la misma imagen ("On this same image, keep everything identical and only change the text…"). Ver checklist en `episode-launch/docs/brand-constants.md`.
