---
name: feedback-windows-tool-selection
description: "On Windows, use PowerShell tool for file operations — not Bash tool. Bash returns exit 127 on Remove-Item, New-Item, etc."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c7e4f0c8-6aff-4a0b-a699-da09adfab92e
---

Use the `PowerShell` tool (not `Bash`) for any file operation on Windows: `Remove-Item`, `New-Item`, `Move-Item`, `Copy-Item`, `Get-ChildItem`.

**Why:** Bash tool doesn't support PowerShell syntax. During a skill cleanup session, `Remove-Item` via Bash returned `exit code 127: command not found` and the deletion had to be redone with the PowerShell tool.

**How to apply:** Any time I need to delete, create, move, or copy files in a Windows workspace, route to the PowerShell tool. Bash is fine for git, npm, curl, and other cross-platform CLI tools.

**Patrón adicional — `powershell.exe` envuelto en Bash mangla `$`:** Nunca invocar
`powershell.exe -Command "..."` desde la herramienta Bash cuando el script usa variables
de pipeline (`$_`, `ForEach-Object`, `$bytes[0]`, etc.) — Bash expande el `$` antes de
que el string llegue a PowerShell, produciendo errores de parseo encadenados (visto en
sesión EP.016 al correr el BOM scan y JSON validation del deploy-preflight: 2 fallos
seguidos hasta cambiar a la herramienta PowerShell directa). Si el script tiene `$`,
usar la herramienta `PowerShell` — no Bash, ni siquiera para invocar el binario nativo.

**Patrón adicional — `node -e` falla en PowerShell con strings internos:** El comando `node -e "const x=require('fs')..."` falla cuando el script contiene comillas dobles internas — PowerShell las interpreta antes de pasarlas a node. Usar here-string pipe en su lugar:
```powershell
@"
const fs = require('fs');
console.log(JSON.stringify(JSON.parse(fs.readFileSync('path/to/file.json', 'utf8'))));
"@ | node
```
