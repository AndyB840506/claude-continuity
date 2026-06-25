---
name: assets-on-e-drive
description: "Skills SOLO en C: (un lugar). Producción SOLO en E:, en carpeta propia, NUNCA dentro de .claude/skills/. Regla única que evita copias huérfanas."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 77321bdf-9962-4ab4-a44f-001a9b9393b1
---

**LA REGLA Única (memorizar esto, no las versiones anteriores de esta nota):**
Cada skill vive en **UN SOLO lugar físico**. Cada producción vive en **UN SOLO lugar físico**. Nunca el uno dentro del otro.

**Why:** El 2026-06-07 una auditoría completa encontró **24 carpetas huérfanas**: un mirror congelado de 16 skills completos en `e:\...\kit-skill-creator\<nombre>\` (creado en un refactor de hace semanas y nunca vuelto a sincronizar) + 8 copias duplicadas dentro de `.claude\skills\` + **2 carpetas `website/` de producción viva** (BTQ y Mr. Putrid's Den, ambas con `.vercel/project.json` de despliegues reales) ancladas dentro de carpetas de skill. El síntoma que lo expuso: SKILL.md desactualizados con información de hace semanas (roadmap de BTQ con la frase de cierre del guion V1, no la grabada). Causa raíz: una nota de memoria anterior daba instrucciones contradictorias (decía "skills solo en C:" en una línea y luego listaba rutas de producción apuntando DENTRO de `.claude/skills/btq-project/`).

**How to apply (las 2 reglas, sin excepciones):**

1. **Skills (SKILL.md, workflows/, config/) → SOLO en `C:\Users\andre\.claude\skills\<nombre>\`**
   - No es preferencia, es requisito técnico: así Claude Code los carga como globales, invocables desde cualquier workspace (confirmado: el usuario quiere "que se pueda llamar desde cualquier espacio").
   - Si una skill solo debe activarse en este proyecto, vive SOLO en `<proyecto>\.claude\skills\<nombre>\` — nunca duplicada en C:.
   - **Nunca** copiar/exportar un skill completo a una carpeta de proyecto en E: "para tenerlo a la mano". Eso es exactamente lo que creó las 24 carpetas huérfanas.

2. **Producción (HTML, websites, metadata, imágenes, propuestas, guiones) → SOLO en su propia carpeta limpia en E:, jamás anidada dentro de `.claude/skills/<nombre>/`**
   - Ejemplo correcto: `e:\Claude Project\Claude Projects\kit-skill-creator\btq-production\website\`
   - Ejemplo correcto: `e:\Claude Project\Claude Projects\kit-skill-creator\mrputridsden-production\website\`
   - Si encuentras producción vieja anidada dentro de una carpeta de skill (como pasó con `website/` en btq-project y mrputridsden), **muévela** a su propia carpeta — no la dupliques ni la borres sin rescatarla primero.

**Checklist antes de crear CUALQUIER carpeta nueva relacionada con un skill o kit:**
- ¿Esto es instrucción de skill (SKILL.md/workflows)? → va en C:, punto. No la repitas en E:.
- ¿Esto es producción/asset/código desplegado? → va en su propia carpeta en E:, nunca dentro de una carpeta de skill.
- ¿Ya existe una copia de esto en otro lugar? → verificar con `Get-ChildItem` antes de crear, no asumir.

**Estado post-limpieza (2026-06-07) — auditoría completa de TODO E:\Claude Project\:**
- E: top-level (`kit-skill-creator\<nombre>\`): 16 carpetas-mirror de skills eliminadas (idénticas o más viejas que C:)
- `.claude\skills\` (kit-skill-creator): 9 copias duplicadas/huérfanas eliminadas (8 diverged + retrospective idéntico)
- `hiresignal\`: 3 copias huérfanas eliminadas (prompt-reviewer, retrospective, skill-management — congeladas 15-mayo, más viejas que C:)
- `kit-btq\`: carpeta-cascarón completa eliminada (solo contenía un btq-project huérfano del 14-mayo, el más viejo encontrado)
- `kit-podcast-visualizer\`: copia huérfana de retrospective eliminada (17-mayo, diverge de C:)
- `website/` de BTQ y Mr. Putrid's Den rescatados a `btq-production\` y `mrputridsden-production\`
- `mrputridsden\` (skill): 6 carpetas de producción real (audio, documents, episodios, fichas-invitados, scripts, templates) rescatadas a `mrputridsden-production\` — más todas las referencias de ruta actualizadas en CLAUDE.md y workflows/01-episodio.md
- Revisado y limpio sin cambios: kuma-talent-recruiter, lucca-tech-web, los 12 kits entregables (kit-ai-lead-generator, auditoría-*, etc. — sus `.claude/skills/<nombre>.md` son productos empaquetados para clientes, NO copias de trabajo, no tocar)
- Quedan en `.claude\skills\` (kit-skill-creator) solo 7 skills legítimamente project-scoped: crear-skill, episode-launch, mrputridsden, prompt-reviewer-en, skill-creator, smart-recruiter, web-page-kit
- Quedan en `kit-podcast-visualizer\.claude\skills\` solo el legítimo project-only: podcast-visualizer

**Nota sobre kits entregables:** los `.md` sueltos dentro de `<kit>\.claude\skills\<nombre>.md` (sin estructura de carpeta `<nombre>/SKILL.md`) son el PRODUCTO que se entrega al cliente — generados por crear-skill/skill-creator. Difieren intencionalmente de las skills de trabajo en C:. No son huérfanos, no comparar ni sincronizar con C:.

[[btq_website]] [[mrputridsden_project]]
