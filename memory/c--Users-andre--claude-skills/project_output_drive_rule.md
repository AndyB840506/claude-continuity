---
name: output-drive-rule
description: "Production output (images, audio, generated files) goes to E:\\ on desktop and D:\\ on laptop — never C:\\"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6bdf8b67-ec6f-4eb2-8a65-4555440e5a49
---

Todo lo que se produzca (imágenes, archivos generados, audios, transcripciones, assets) debe escribirse en **E:\** en el PC de escritorio y en **D:\** en el portátil. Nunca en C:\.

**Why:** El disco C: es pequeño en ambas máquinas y se llena; E: (escritorio, 5.6 TB) y D: (portátil) son los discos de datos. Ver [[two-pcs-laptop-vs-desktop]].

**How to apply:** Antes de escribir cualquier artefacto de producción, detectar la máquina (E: existe → escritorio; solo C:/D: → portátil) y usar el disco de datos correspondiente. Config de Claude (`~/.claude/`) sigue en C: como siempre.
