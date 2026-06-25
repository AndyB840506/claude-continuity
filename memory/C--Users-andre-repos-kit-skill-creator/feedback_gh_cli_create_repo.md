---
name: feedback_gh_cli_create_repo
description: gh repo create --source . --remote origin --push crea repo y hace push en un solo comando
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 99603a47-a605-4c8c-a8bd-2bb44d054bac
---

Para crear un repositorio GitHub desde un proyecto local existente, usar:

```
gh repo create <nombre> --private --description "..." --source . --remote origin --push
```

**Why:** Crea el repo, configura el remote `origin`, y hace el push inicial — todo en un comando. Evita el flujo manual de crear en browser → copiar URL → git remote add → git push.

**How to apply:** Patrón estándar para nuevos proyectos Node.js/web cuando se tiene GitHub CLI instalado. Requiere autenticación previa con `gh auth login --web`.
