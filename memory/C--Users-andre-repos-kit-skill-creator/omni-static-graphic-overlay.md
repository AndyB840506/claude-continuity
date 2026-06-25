---
name: omni-static-graphic-overlay
description: Omni (Google Flow Video) — técnica STATIC GRAPHIC OVERLAY para mantener branding estático mientras el fondo anima
metadata: 
  node_type: memory
  type: reference
  originSessionId: 890d5e93-0d2e-45e7-b32d-e50a704328f8
---

En Omni (Google Flow video mode):

**STATIC GRAPHIC OVERLAY**: añadir al final del prompt para mantener tipografía estática mientras el fondo se anima. Confirmado funcional en EP.002 de Mr. Putrid's Den (2026-05-27).

Frase exacta a insertar:
> "STATIC GRAPHIC OVERLAY: All typography and logos from the reference image must remain perfectly sharp, static, and unmoving throughout the entire video. The branding elements ([SHOW NAME], EP.NNN, footer bar) are locked in place while the background environment animates behind them."

**Limitación de formato:** Omni solo procesa 9:16 y 16:9. El formato 1:1 no está disponible.

**Workaround 1:1:** recortar un 9:16 a cuadrado en CapCut/Canva, o añadir padding lateral (#1a1a1a para podcast oscuro).

**Fallback:** si STATIC GRAPHIC OVERLAY no respeta la tipografía → generar sin texto y añadir overlays en Canva/CapCut en post.

**Why:** El approach original ("No text + Canva") era correcto como fallback, pero STATIC GRAPHIC OVERLAY es superior porque integra todo en un solo archivo de video sin post-producción adicional.

**How to apply:** En cualquier prompt de animación para Omni, insertar la frase STATIC GRAPHIC OVERLAY antes del estilo/calidad. Verificar siempre que el formato sea 9:16 o 16:9 antes de generar.

Ver también: [[btq_artwork_flow]], [[ai-image-prompts-logo-specificity]]
