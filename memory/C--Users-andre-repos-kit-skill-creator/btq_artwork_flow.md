---
name: btq-artwork-flow
description: BTQ artwork generation workflow — Flow agent (visual) + Laswell (layout only). Split validated EP.014 May 2026.
metadata: 
  node_type: memory
  type: project
  originSessionId: 02562417-ea68-4940-8744-939e773258dd
---

## BTQ Artwork Generation — Workflow Actual (actualizado EP.014, mayo 2026)

**Herramienta principal:** Google Flow (Omni) + Nani Banana 2
- Motor Omni: más fluido + incluye audio al mismo costo
- Kling reemplazado completamente — 0 referencias en el proyecto

---

## División de responsabilidades (nueva desde EP.014)

| Quién | Qué hace |
|---|---|
| **Flow agent (built-in)** | Describe el visual del personaje desde imagen de referencia oficial |
| **Laswell** | Genera SOLO el bloque de layout BTQ (tipografía + footer + formato) |

**Proceso:**
1. Andy sube imagen de referencia al agente de Flow
2. Flow agent describe el visual (colores exactos, ropa, expresión, pose)
3. Andy agrega el bloque de layout BTQ generado por Laswell
4. Genera en 3 formatos

**Por qué:** Más fiel al canon que specs manuales. El agente ve la imagen; Laswell no.

---

## Reglas por tipo de episodio

### Anime (Frieren, Maomao, Dragon Ball, Saint Seiya)
- **Apertura canónica exacta:** `Color cinematic anime image 4k.`
- **Nunca usar:** `live-action` · `photographic` · `rendering` · `rendered` · `render` — todos triggers de live-action
- **Naming:** Nombrar el personaje directamente — el modelo respeta el diseño canónico
- **Specs críticos:** EN MAYÚSCULAS (colores de cabello, rasgos clave)
- **⚠ CRÍTICO:** "live-action interpretations for anime characters" es INCORRECTO para anime — solo aplica a personas reales (actores, músicos)

### Anime — variante Chibi/Neko (validado EP.014 Maomao)
- **Apertura canónica:** `Color cinematic anime image chibi Neko version, No Live-Action, No Rendering.`
- Chibi: proporciones cabeza 60-70% del cuerpo, ojos muy expresivos
- Neko: orejas del COLOR DEL CABELLO + cola pequeña del mismo color
- Specs del personaje idénticos a la versión principal
- Temáticamente canónico para Maomao (su nombre = 猫猫 = "Cat Cat")

### Videojuego (God of War, Metal Gear, The Last of Us)
- Personajes ficticios: nombrar directamente
- Rendering hiperrealista — diseños high-fidelity
- Referenciar estética de cutscenes cinematográficas

### Película / Música — personas reales (actores, músicos)
- **NO nombrar a la persona real** — riesgo de flag por copyright/likeness
- Usar silueta/sombra: "a silhouette figure suggesting [descripción genérica]"
- El personaje ficticio SÍ puede nombrarse (Marty McFly — la restricción es sobre el actor)
- Aperturas válidas: `Color cinematic image 4k.` o `Recreation of [film era] aesthetic, rendered in full warm cinematic color. Hyperrealistic photographic image...`

---

## Metodología de densidad (sigue vigente para film/música)

- Prompts deben ser DENSOS — nada vago, sin "creative freedom"
- Cada detalle especificado: vestuario, color de cabello (CAPS cuando crítico), edad, expresión, dirección de luz
- Menos espacio de interpretación = más cercano al target
- Si un prompt anterior funcionó: usarlo como base, no reescribir desde cero

---

## Nani Banana 2 — Regla de candidatos

Siempre genera 4 candidatos. Pedir a Andy que elija uno antes de guardar.

---

## EP.013 Back to the Future — estructura ganadora (referencia para film)

- Opening: `Recreation of [film era] aesthetic, rendered in full warm cinematic color. Hyperrealistic photographic image, captured on 35mm Kodak Portra film.`
- Characters: Nombre + edad + specs físicos EN CAPS + expresión + props + postura
- Lighting: Dirección específica + color temp + referencia Kodak + "NOT a 3D render"
- Subtitle: "La mentoría que cambió el futuro"

---

## Formatos por episodio

| Formato | Tamaño | Uso |
|---|---|---|
| 1:1 | 3000×3000px | Portada de plataforma, feed posts |
| 9:16 | 1080×1920px | TikTok, Stories |
| 16:9 | 1920×1080px | LinkedIn |
