---
name: feedback_laragon_local_dev
description: "Laragon local dev setup on Windows — symlink pattern, vhost auto-generation, correct www path"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: f86cd100-f786-45af-9669-c37d0592da27
---

Never manually create vhost conf files in `E:\laragon\etc\apache2\sites-enabled\`. Laragon auto-manages that folder — any `auto.*` file it didn't generate gets deleted on reload.

**Why:** Laragon auto-generates `auto.<domain>.conf` when it detects a folder (or symlink) in its www directory. Manual files bypass this and get wiped silently.

**How to apply:** To expose a project at `http://<name>.test`:
1. Create symlink in `E:\laragon\www\` pointing to the actual project folder:
   ```powershell
   New-Item -ItemType SymbolicLink -Path "E:\laragon\www\<name>" -Target "E:\path\to\project\app"
   ```
   (requires elevated PowerShell or Developer Mode enabled)
2. Reload Laragon — it auto-generates the vhost and the `.test` domain resolves
3. If DNS doesn't resolve, add to `C:\Windows\System32\drivers\etc\hosts`:
   `127.0.0.1      <name>.test       #laragon magic!`
   (also requires elevated PowerShell: `Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "..."`)

**Laragon www location:** `E:\laragon\www\` — NOT `E:\Claude Project\laragon\www\` or any project subfolder.
