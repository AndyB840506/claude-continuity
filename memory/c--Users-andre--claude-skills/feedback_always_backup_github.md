---
name: feedback-always-backup-github
description: Siempre respaldar el trabajo en GitHub (commit + push) por si Andrés cambia al portátil — no dejar cambios solo en local
metadata: 
  node_type: memory
  type: feedback
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

Al terminar un bloque de trabajo (skills nuevas, fixes, cambios de config), **respaldar en GitHub con commit + push** — no dejar los cambios solo en local.

**Why:** Andrés trabaja en dos PCs (escritorio y portátil — ver [[project_two_pcs]]) y puede cambiar de máquina en cualquier momento. Lo que quede sin pushear no aparece al retomar en el otro equipo. Lo pidió explícito (06-25): "recuerda siempre tener respaldos en github por si cambio al portatil".

**How to apply:** después de cambios sustanciales, hacer commit + push al repo correcto. Ojo con QUÉ repo cubre cada cosa:
- **Skills, docs, handoffs** → repo `claude-code-skills` (`~/.claude/skills`, este repo). `git add` scoped + `git pull --rebase` antes de push (ver workflow de [[handoff]]).
- **Memoria** (`~/.claude/projects/.../memory/`) **NO está bajo este repo** — se sincroniza por el `claude-bootstrap` sync (manual, separado). Un push del repo de skills NO respalda la memoria. Si Andrés va a cambiar de PC, recordarle correr ese sync para no perder memorias nuevas.
- Producción (sitios de clientes) vive en `C:\Users\andre\repos\` con su propio remoto/deploy — ver [[reference_deploy_mechanisms]].
