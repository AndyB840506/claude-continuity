---
name: feedback-html-script-format
description: "Scripts HTML de podcast: diálogos sin fondo, info blocks con tint claro, container 780px — no fondos oscuros"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: fbe685c3-8183-4b2b-aac8-9f89145e2758
---

Para scripts HTML de podcast (Mr. Putrid's Den), el formato liviano es el correcto. La primera versión de EP.003 usaba fondos de color en cada bloque de diálogo, lo que creaba un "muro visual" pesado de leer.

**Why:** El usuario dijo "se ve muy pesado al leer" con la versión original. El rediseño eliminó fondos y aligeró los bloques informativos.

**How to apply:**
- **Bloques de diálogo (.host-block):** Sin fondo — solo borde izquierdo sutil (gris para host 1, azul claro para host 2). Permite leer el diálogo como texto natural.
- **Bloques informativos (dato, leyenda, recomendacion, intercambio):** Tint muy claro del color asociado (no fondos oscuros tipo `#1a1a1a`). Ejemplo: dato = crema claro `#fdfaf3`, leyenda = lavanda claro `#faf5ff`.
- **Container:** max-width 780px (no 900px) para líneas de lectura más cortas.
- **Fuente base:** 15px con line-height 1.85.
- Aplicar desde EP.004 en adelante. El archivo de referencia CSS está en EP.003 v2.

Ver también: [[mrputridsden-project]]
