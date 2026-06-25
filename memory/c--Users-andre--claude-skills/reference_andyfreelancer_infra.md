---
name: reference-andyfreelancer-infra
description: "Hosting/DNS/email topology for andyfreelancer.com (the-freelancer repo) — consult before touching its DNS, deploy, or email"
metadata: 
  node_type: memory
  type: reference
  originSessionId: d854435b-ca4d-4e24-9472-99aaa15a43e0
---

Topología de **andyfreelancer.com** (repo `C:\Users\andre\repos\the-freelancer`, rama `master`, GitHub AndyB840506/the-freelancer):

- **App:** servidor Express (`server.js`) con SSE streaming (`freelancer/bot.js`) y storage en disco (`freelancer/storage`). NO es estático ni serverless → NO migrar a Vercel (rompe storage en disco + streaming).
- **Hosting:** DigitalOcean App Platform (component `the-freelancer`, app interna `jellyfish-app-tjom4.ondigitalocean.app`). Auto-deploy al hacer `git push` a `master`. Header delator: `x-do-app-origin`.
- **CDN:** Cloudflare por delante (lo pone DO App Platform). Por eso los A/AAAA del dominio apuntan a IPs de Cloudflare (162.159.x, 172.66.x). Header `Server: cloudflare`.
- **Registrador:** Porkbun. Su panel DNS está **DORMIDO** (no autoritativo) — editar ahí no tiene efecto. NUNCA darle "Yes, update my domain" (cambiaría los nameservers y tumba el sitio).
- **DNS autoritativo:** DigitalOcean (ns1/ns2/ns3.digitalocean.com). Se edita en **DO → Networking → Domains** (NO en App Platform → Domains, que es otra pantalla).
- **Dos zonas en DO:** `andyfreelancer.com` (apex, PRIMARY) y `www.andyfreelancer.com` (aparte). El **email vive en el apex** (`@`), no en www.
- **Email:** forwarding de Porkbun vía MX `fwd1.porkbun.com` (prio 10) + `fwd2.porkbun.com` (prio 20) + TXT SPF `v=spf1 include:_spf.porkbun.com ~all`, todo en la zona **apex** de DO.

**Gotcha de verificación DNS:** el `nslookup` local en esta máquina devuelve caché rezagada/PoP viejo y MIENTE. Para ver la verdad usar DoH: `curl -s -H "accept: application/dns-json" "https://cloudflare-dns.com/dns-query?name=andyfreelancer.com&type=MX"`. Caché negativo del SOA = 1800s (~30 min).

**SEO:** el catch-all de Express servía 200-homepage para cualquier path (soft-404 → "not indexed" en Search Console). Fix en `server.js`: `app.get(['/services','/services/*'])` → 301 a `/`, y catch-all `*` → 404 real. Commit 80dcb47.
