---
name: feedback-use-user-suggested-tool
description: "When the user proposes a specific tool or approach, use it directly — don't attempt an alternative first"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 58fc768f-514f-45d8-aead-b527a48a358a
---

When the user explicitly suggests a tool or approach ("usa X", "por X que tienes acceso", "hazlo con X"), go directly to that tool. Do not attempt an alternative approach first, even if you think you can solve it another way.

**Why:** In this session, user suggested Canva for logo background removal. I loaded the Canva MCP tools but then used PowerShell System.Drawing flood-fill instead — which made the result worse. The user ended up doing it himself. Two wasted deploys and frustration.

**How to apply:** If the user names a specific tool and you have access to it, use it immediately. Reserve alternative approaches only for when the suggested tool is unavailable or fails.
