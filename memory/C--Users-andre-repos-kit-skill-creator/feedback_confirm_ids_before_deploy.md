---
name: feedback_confirm_ids_before_deploy
description: "Before configuring env vars or deploying, ask user to paste IDs/keys directly from source and echo them back for confirmation"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 6a3def80-a4e3-4894-98a6-b713e194ee8b
---

Before wiring any ID, API key, or env var value into config or a deploy, ask the user to paste it directly from its source (browser URL, dashboard, etc.). Echo each value back character-for-character and wait for explicit confirmation before proceeding.

**Why:** Two typos in Google Drive/Sheet IDs in DigitalOcean env vars caused 45+ minutes of debugging that only resolved when Claude finally asked for the values directly from the browser URL. Hand-typed or assumed values are not trustworthy.

**How to apply:** Any time a deploy, env var config, or integration requires an ID/key — stop and ask the user to paste it. Repeat it back exactly. Only proceed after "yes" or "correct".
