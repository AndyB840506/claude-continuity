---
name: feedback_winget_source
description: winget install requiere --source winget en Windows — msstore falla con SSL cert error
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 99603a47-a605-4c8c-a8bd-2bb44d054bac
---

Siempre usar `--source winget` al instalar con winget en Windows.

**Why:** El source `msstore` falla con `0x8a15005e: The server certificate did not match` — error SSL que bloquea la instalación. El source `winget` funciona sin problemas.

**How to apply:** En cualquier `winget install --id X`, agregar `--source winget` explícitamente. Ejemplo: `winget install --id GitHub.cli --source winget --silent --accept-package-agreements --accept-source-agreements`
