---
name: podcast-visualizer-kit
description: "Kit independiente de podcast visualizer — ubicación, configuración probada, preferencias de waveform del usuario"
metadata: 
  node_type: memory
  type: project
  originSessionId: 8b19d2e3-9c9a-4852-9d88-569fa1b2d2fd
---

Kit creado en `e:\Claude Project\Claude Projects\kit-podcast-visualizer\` — completamente autónomo, no depende del skill creator.

**Configuración probada y validada (EP.12 BTQ):**
- Portada: cuadrada 2048×2048 → se escala con pillarbox a 1920×1080
- Audio: WAV del episodio completo
- Waveform preferido: rojo `#FF3B30`, modo `p2p`, tamaño `1920×500`, posición `overlay=0:560`
- Output: H.264, AAC 192kbps, 1920×1080

**Why:** Enfoque de dos pasos obligatorio (scale imagen primero, luego generar video). Combinar scale+pad+showwaves en un solo filter_complex falla en FFmpeg 8.x con error "Generic error in an external library".

**How to apply:** Siempre usar el flujo: (1) `ffmpeg -vf scale+pad portada_scaled.jpg`, (2) `ffmpeg -filter_complex showwaves+overlay video_final.mp4`. Limpiar `portada_scaled.jpg` al final.
