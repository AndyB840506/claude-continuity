---
name: project_hiresignal_do_deploy
description: "HireSignal deployment notes for DigitalOcean App Platform — stateless filesystem, env vars, repo structure"
metadata: 
  node_type: memory
  type: project
  originSessionId: f86cd100-f786-45af-9669-c37d0592da27
---

HireSignal NOT yet deployed (2026-06-02). Belongs to LuccaTech, not KumaTalent.

**Why:** Was deprioritized. Now being reconsidered as part of "The Freelancer" platform (andres-freelance project) rather than a standalone DO deploy.

**How to apply:** When deploying:
- Repo: `https://github.com/Lucca-Tech/hiresignal.git`, branch `master`, source dir `/`
- NOT `AndyB840506/kuma-talent-recruiter` — that repo is unrelated
- Env vars needed: `ANTHROPIC_API_KEY`, `ADMIN_PASSWORD`, `RECRUITER_EMAIL`, `APP_NAME`, `SENDER_NAME`, `DEV_MODE=false`
- `config.php` reads env vars, overrides `settings.json`

**Critical — stateless filesystem:** DO App Platform has ephemeral filesystem. `data/jobs.json`, `data/interviews.json`, `reports/` lost on redeploy. Fine for demos; needs DO Spaces or DB for production.

**Open question (2026-06-02):** Deploy as standalone app or integrate into "The Freelancer" project? User leaning toward integration.

**Related:** [[feedback_digitalocean_deploy]]
