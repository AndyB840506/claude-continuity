---
name: mrputridsden-project
description: "Estado completo del proyecto Mr. Putrid's Den — podcast bogotano de rock/metal/jazz con Andrés y Juan"
metadata: 
  node_type: memory
  type: project
  originSessionId: 741f8a59-20dc-4b35-b41d-b94a1f509b66
---

Podcast Mr. Putrid's Den en producción activa. EP.001 grabado y guión completo generado.

**Why:** Andrés y Juan crearon un podcast conversacional bogotano sobre rock, metal, jazz y géneros variados. Juan es promotor de eventos underground.

**How to apply:** Siempre leer `podcast-profile.json` antes de cualquier workflow. Consultar `glosario-cachaco.md` antes de generar guiones.

## Estado actual (2026-06-03)

- EP.001 "Bienvenidos a la Guarida" — live ✅
- EP.002 "Black Sabbath: El Génesis del Heavy Metal" — live desde semana del 2026-05-27 ✅
- EP.003 "Las raíces del rock: Sister Rosetta Tharpe" — guión v2 completo ✅ (próximo a grabar)
  - v2: formato HTML aligerado + balance co-host corregido (Juan lidera SEG 5, 6, 7)
  - Drive ID v2: `1f7L59rG8q4VrK3azsyg_T9lT13UHHzZz` · Git commit: `74d73bf`
- EP.004 "Salsa: de África al Caribe" — en roadmap, conecta directamente con EP.003 ✅
- Roadmap EP.002-EP.011 definido con regla de rotación de género y regla de conector de género ✅
- Workspace consolidado: kit-podcast-creator eliminado, todo en kit-skill-creator ✅

## Sistema tipográfico — Artwork (confirmado EP.002)

Siempre usar este sistema para prompts de Flow. NO mezclar con BTQ.

- **5 puntos plata** (#A8A8A8) encima del nombre del show
- **"MR. PUTRID'S DEN"** — ultra-bold WHITE condensed sans-serif
- **"MPD"** — pequeño, CRIMSON (#9B1C1C)
- **Título del episodio** — white bold condensed, tercio inferior
- **Footer bar** — fondo #1a1a1a · izq: "Mr. Putrid's Den" · centro: "EP.00X" + ícono temático en crimson · der: logos Spotify, Apple Podcasts, Amazon Music en plata (#A8A8A8)
- **Ícono footer por episodio:** EP.002 = chimeneas · EP.003 = carretera/crossroads
- **Workflow de artwork:** Google Flow con foto de referencia. Tamaños: 1:1 (3000×3000), 9:16 (1080×1920), 16:9 (1920×1080)

## Reglas de prompts para Flow (lecciones EP.003)

Errores confirmados y sus fixes — aplicar siempre:

1. **Tipografía SIEMPRE en tercio inferior** — nunca centrada en la imagen. Usar gradiente oscuro (transparent → #0d0d0d) en el tercio inferior y confinar todo el texto ahí. Texto al centro = atravesado con el visual.

2. **Split scenes: división explícita** — nunca escribir "merge at center." Usar "Strict left-right vertical split" con "exactly left 50% of frame" y "exactly right 50% of frame" por separado. Sin esto, Flow superpone las escenas.

3. **Escenas con vida** — siempre especificar personas/actividad en la escena. "Caribbean street" sin más = calle vacía. Necesita "with dancers", "with crowd", etc.

4. **Quote cards autoexplicativos** — los quotes deben entenderse sin haber escuchado el episodio. Eliminar referencias que requieren contexto interno (ej. "Iron Man" sin explicar que es Black Sabbath).

5. **El sujeto en escena, no implícito** — si el momento tiene un protagonista (ej. Sister Rosetta en su boda), ponerlo explícitamente en el prompt. Escenario vacío con spotlight = imagen genérica sin fuerza.

## Reglas de formato para scripts EP.004+

- CSS base: ver EP.003 v2 como referencia canónica (bloques de diálogo sin fondo, tints claros)
- Co-host balance: Juan lidera ~50% de segmentos de contenido. Ver [[feedback-cohost-balance]]

## Archivos clave

- Local: `e:\Claude Project\Claude Projects\kit-skill-creator\.claude\skills\mrputridsden\`
- GitHub: `https://github.com/AndyB840506/claude-code-skills.git`
- Google Drive proyecto: `drive.google.com/drive/folders/1_gblT3LGmOIyY5Ia7NllqrK7VYMJ2ikR`

## Contacto y web

- Web: www.mrputridsden.com
- General: hello@mrputridsden.com
- Andrés: Andres@mrputridsden.com
- Juan: Juan@mrputridsden.com

## Segmentos del podcast

**La Silla Pútrida:** episodio especial con invitado. Flujo: Claude investiga al invitado (Modo Narval) → carta simple al invitado → bio + temas + NO-list → guión. Grabación presencial, los 3 en el mismo cuarto.

**Segmento de Promoción:** en TODOS los episodios. Juan lo conduce. Posición: bloque intermedio en episodios normales, al final en Silla Pútrida. Fuente: Google Doc "Eventos Underground".

## Backup en 3 capas

1. Local `e:\Claude Project\...`
2. Google Drive disco G (cuando esté montado)
3. GitHub — push automático después de cada guión/documento

## Google Docs de Juan (carpeta "Para Juan" en Drive)

- Guía de Flujos para Juan
- Eventos Underground (Juan llena aquí antes de cada grabación)
- La Silla Pútrida — Preparación del Invitado
