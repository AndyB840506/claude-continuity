---
name: feedback-live-dns-danger
description: Acciones de DNS/dominio/cert que tumban un sitio LIVE con un solo click — verificar que NO sean destructivas antes de tocarlas
metadata: 
  node_type: memory
  type: feedback
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

Antes de tocar DNS, dominios o certificados de un sitio que ya está **live**, confirmar que la acción **NO es destructiva**. Varias UIs de host/registrar tienen un botón tentador que resetea el cert o los nameservers y tumba el sitio.

**Why:** el mismo tipo de trampa salió en varias sesiones —
(1) en Vercel, **remover/re-agregar un dominio custom resetea la emisión del cert Let's Encrypt** y rate-limita; el cert de `www` quedó atascado (06-24, Kuma). Fix que sirvió: dejar de "churnear" el dominio y poner el **apex como serving domain** (su cert emite rápido).
(2) en Porkbun, el botón **"Yes, update my domain / update nameservers" cambiaría los NS y tumbaría el sitio** (06-19, andyfreelancer) — nunca darle.
(3) **mover los nameservers a Vercel** huérfana el `app` CNAME + los MX que viven en la zona de DO (06-24). Agregar registros `ns*.vercel-dns.com` *dentro* de la zona de DO es inerte (la delegación está en el registrar).

**How to apply:** ante cualquier acción de DNS/dominio/cert en un sitio live: (a) identificar quién es autoritativo (DO/Cloudflare) vs quién es el registrar — no confundirlos; (b) **nunca** darle a "update nameservers" en el registrar salvo que migrar la zona sea el objetivo explícito; (c) no remover/re-agregar dominios en Vercel solo para "refrescar" — resetea el cert; (d) preservar MX y CNAMEs de apps en cualquier cutover. Verificar DNS con DoH, no con nslookup local — ver [[feedback_validate_before_theorizing]], [[reference_andyfreelancer_infra]], [[reference_kuma_infra]].
