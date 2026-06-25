---
name: project-kuma-talent-recruiter
description: "Estado del proyecto kuma-talent-recruiter — repo, despliegue, credenciales SMTP, env vars"
metadata: 
  node_type: memory
  type: project
  originSessionId: 58fc768f-514f-45d8-aead-b527a48a358a
---

PHP recruiter bot para Kuma Talent. Entrevistas AI + reportes.

**Repo:** `github.com/AndyB840506/kuma-talent-recruiter` (privado)
**Stack:** PHP + Anthropic API (cURL) + PHPMailer
**Local:** `e:\Claude Project\Claude Projects\hiresignal\kuma-talent-recruiter\`

**DO deployment:** Listo para crear app. Conectar repo `AndyB840506/kuma-talent-recruiter`, branch `master`.

**Env vars para DO (8 variables):**
- `ANTHROPIC_API_KEY` — misma key que andres-freelance y skill-creator-web
- `SMTP_HOST` = `smtp.hostinger.com`
- `SMTP_PORT` = `465`
- `SMTP_SECURE` = `ssl`
- `SMTP_USER` = `hello@kumatalent.com`
- `SMTP_PASS` = `Kuma2026$`
- `RECRUITER_EMAIL` = `berandre2@gmail.com`
- `ADMIN_PASSWORD` = `KumaAdmin2026` (default)

**Prompt caching:** Habilitado en `config.php` — `callLLMChat()` usa system como array con `cache_control: ephemeral` + header `anthropic-beta: prompt-caching-2024-07-31`.

**Config pattern:** `config.php` lee env vars primero, `data/settings.json` como fallback (admin panel).

**Why:** DO deployment requiere env vars, no puede escribir settings.json en filesystem efímero.
**How to apply:** Al desplegar en DO, usar las 8 vars del .env local. No cambiar nada más en el código.
