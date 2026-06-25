---
name: two-pcs-laptop-vs-desktop
description: "Andres works on two PCs — desktop (C:/D:/E:, RTX 3080 Ti 12GB, WhisperX in E:\\Transcriptor) and laptop (C:/D: only, RTX 3060 6GB, no WhisperX)"
metadata: 
  node_type: memory
  type: project
  originSessionId: 6bdf8b67-ec6f-4eb2-8a65-4555440e5a49
---

Andres trabaja en **dos máquinas**:

- **Escritorio:** discos C:, D: y E: (E: ~5.6 TB, disco de datos). GPU RTX 3080 Ti 12 GB. WhisperX vive en `E:\Transcriptor\` (venv Python 3.12, setup 2026-06-12). `HF_HOME` apunta a `E:\Transcriptor\hf-cache`.
- **Portátil:** solo C: y D:. GPU RTX 3060 Laptop 6 GB. SIN WhisperX ni Python de producción. Si tocara transcribir ahí: large-v2 + diarización queda justo en 6 GB — fallback `--compute_type int8`.

**Cómo detectar la máquina:** `Test-Path E:\` — si existe, es el escritorio.

Regla de discos para output: [[output-drive-rule]].
