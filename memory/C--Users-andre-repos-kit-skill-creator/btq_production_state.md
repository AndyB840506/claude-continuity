---
name: btq-production-state
description: "Estado de producción actual de BTQ — qué está listo, qué está pendiente, por episodio"
metadata: 
  node_type: memory
  type: project
  originSessionId: 281e3cb8-73b2-4264-bd48-affe81bec56e
---

Estado actualizado 2026-06-08. EP.016 cerrado por completo: publicado y live en Spotify (requirió un segundo push del episodio al hosting para propagar correctamente), website grid corregido y redeployado, plan social de 4 días con copy completo guardado en `btq-production/launch-assets/EP016-the-wall-launch.md` §B. Próximo: EP.017 (Soda Stereo / Cerati) — estado "en roadmap", sin guión ni assets aún. Recomendado iniciar el pipeline de guión en sesión nueva para no arrastrar contexto del cierre de EP.016.

**Why:** El skill tiene el estado canonical pero puede quedar desactualizado entre sesiones. Esta memoria registra el estado verificado directamente por Andy.

**How to apply:** Al iniciar sesión BTQ, verificar contra este estado antes de proponer acciones. Confirmar qué next steps ya se completaron.

## Estado por episodio (2026-06-02)

| EP | Título | Estado |
|---|---|---|
| EP.011 | Frieren | ✅ Completado — publicado |
| EP.012 | Bohemian Rhapsody | ✅ Completado — publicado |
| EP.013 | Back to the Future | ✅ Completado — publicado |
| EP.014 | Maomao | ✅ Completado — publicado |
| EP.015 | Solid Snake | ✅ Publicado en Spotify · Guión v2.0 densificado (60 min) |
| EP.016 | Pink Floyd / The Wall | ✅ Live en Spotify: https://open.spotify.com/episode/3CNyTkA6OCLoCrmNEh0LVR (URL corregida 2026-06-07 — la primera URL usada en el grid del sitio, `6GoODyUOac1rKLZR83yllR`, era incorrecta/vieja) |

## Nota: propagación a Spotify
EP.016 no apareció live en Spotify tras el primer push del episodio al hosting — hubo que repetir el push. Si un episodio no aparece tras publicar, considerar re-pushear antes de asumir que es solo demora de propagación.

## EP.015 — estado completo

- Spotify: https://open.spotify.com/episode/6fpGqMqaLozmWB4ABOlO3S (URL verificada 2026-06-02)
- Guión HTML: v2.0 densificado — 18 bloques aplicados — en `btq-project/scripts/EP015-metal-gear-solid-snake.html`
- Website grid: correcto — EP.015 en slot 4, grid EP.012→013→014→015
- Social plan: completado — Dom intriga / Lun lanzamiento / Mié refuerzo
- Artwork: prompts 1:1 / 9:16 / 16:9 generados (Solid Snake MGS1 canon, sin eye patch)
- SEO: Spotify description + YouTube title/tags/thumbnail text generados
- Safe Creative: ✅ registrado (2026-06-02)
- YouTube: ✅ subido con SEO metadata — timestamps incorrectos (archivo TurboScribe incompleto)
- Transcript: skill `transcriptor` reemplaza TurboScribe — pendiente re-transcribir para corregir timestamps

## Próximos pasos EP.015 restantes
1. Re-transcribir con skill `transcriptor` para corregir timestamps de YouTube

## Roadmap Season 2
- EP.016: Pink Floyd / The Wall — Roger Waters · Berlín 21 jul 1990 — en queue
- EP.017: Soda Stereo / Cerati — en queue
