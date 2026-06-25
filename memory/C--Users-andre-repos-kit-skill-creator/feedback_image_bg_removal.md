---
name: feedback-image-bg-removal
description: Para remover fondo de imágenes en Windows usar removebg/Canva — no PowerShell System.Drawing
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 58fc768f-514f-45d8-aead-b527a48a358a
---

Para remover el fondo de una imagen (logo, foto, etc.) en Windows, la solución correcta es:
1. **removebg.com** — el usuario lo hace directamente, resultado limpio en segundos
2. **Canva** — disponible vía MCP, puede manejar fondo transparente y exportar PNG

No intentar PowerShell System.Drawing flood-fill — no maneja anti-aliasing correctamente y produce resultados peores que el original.

**Why:** En esta sesión intenté flood-fill con BFS desde las esquinas para remover el fondo blanco de un logo JPEG. El resultado fue visiblemente peor (bordes pixelados, pérdida de gradiente). El usuario terminó usando removebg él mismo en 30 segundos.

**How to apply:**
- Cuando el usuario necesite fondo transparente en una imagen: dirigir a removebg.com o usar Canva MCP directamente.
- Logos desde Google Flow se descargan como JPEG — no soportan transparencia. Si el usuario necesita PNG transparente, indicar esto desde el inicio y recomendar removebg antes del primer deploy.
