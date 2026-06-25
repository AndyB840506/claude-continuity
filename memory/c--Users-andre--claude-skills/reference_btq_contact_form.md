---
name: reference_btq_contact_form
description: "BTQ (behind-thequeue.com) contact form runs on Web3Forms — recipient andy@behind-thequeue.com, access key lives in the form markup"
metadata: 
  node_type: memory
  type: reference
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

The **behind-thequeue.com** homepage contact form (added 2026-06-24, in the `#contacto` section above the footer) is a **static-site form wired to Web3Forms** — BTQ has no backend, so submissions POST to `https://api.web3forms.com/submit`.

- **Recipient inbox:** `andy@behind-thequeue.com` (set on the Web3Forms side, tied to the access key).
- **Access key** is stored in plain text in the form markup (`<input type="hidden" name="access_key" ...>`) in `btq-production/website/index.html` (and its source `index-liner.html`). This is by design — Web3Forms keys are public/client-side; abuse is limited by their spam filter + the honeypot `botcheck` field.
- Submit is **AJAX** (fetch → inline success/error status); degrades to a normal POST (Web3Forms success page) if JS is off.
- The top bar also has a **"Contacto"** link (`.bar-contact`) anchoring to `#contacto`; the footer keeps the direct mailto + Instagram (@behindthequeue84) / TikTok (@behind.the.queue) / LinkedIn.

**Why:** the premium liner-notes redesign originally dropped all contact discoverability; this restored it. To change the recipient or rotate the key, create a new key at web3forms.com and replace the `access_key` value, then redeploy.

**Deploy reminder:** BTQ goes live via `vercel deploy --prod --cwd btq-production/website`, NOT git push — see [[reference_deploy_mechanisms]]. Related: [[project_andyfreelancer_redesign]].
