---
name: port-assignments-local-dev
description: Puerto asignado por proyecto Node.js local — evita EADDRINUSE al correr múltiples servidores simultáneamente
metadata: 
  node_type: memory
  type: project
  originSessionId: 007c71fe-6092-41a4-a3bd-dbf7020d8c56
---

## Asignación de puertos — proyectos locales Node.js

| Puerto | Proyecto |
|--------|----------|
| 3000 | `andres-freelance` (andyfreelancer.com) |
| 3001 | `skill-creator-web` |

**Regla:** Cada proyecto usa un puerto diferente en `.env`. Si aparece `EADDRINUSE`, cambiar `PORT=` en el `.env` del proyecto nuevo.

## Guard antes de npm install

Antes de correr `npm install`, verificar si ya existe `node_modules`:

```powershell
if (!(Test-Path "node_modules")) { npm install }
```

Previene corridas duplicadas cuando el contexto se resetea y se pierde track del estado.

**Why:** En la sesión de skill-creator-web, `npm install` corrió 3 veces (background) porque no se verificó existencia previa de `node_modules`. Los 3 completaron con exit 0 pero fue trabajo redundante.
