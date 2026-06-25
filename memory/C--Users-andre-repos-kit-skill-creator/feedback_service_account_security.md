---
name: feedback-service-account-security
description: Nunca usar PowerShell tool para minificar service account JSON — el output queda expuesto en el chat. Dar comando al usuario para su propia terminal.
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 896d78d2-2cae-488d-bcf8-0538242ec057
---

No usar el PowerShell tool (ni ninguna herramienta propia) para minificar o procesar service account JSON. El output aparece en el chat y expone la private key.

**Regla:** Dar al usuario el comando para que lo corra EN SU PROPIA terminal:
```powershell
@"
const fs = require('fs');
console.log(JSON.stringify(JSON.parse(fs.readFileSync('D:/Downloads/tu-archivo.json', 'utf8'))));
"@ | node
```
Luego pedirle que copie el resultado desde su terminal y lo pegue en DigitalOcean — sin pasar por el chat.

**Why:** En esta sesión, correr el minify via PowerShell tool expuso la private key del service account dos veces en el historial del chat. El usuario tuvo que regenerar la key cada vez.

**How to apply:** Cada vez que el usuario necesite minificar credenciales JSON (service accounts, API keys, secrets), dar el comando para su terminal y pedir que copie directo — nunca procesar credenciales con herramientas propias.
