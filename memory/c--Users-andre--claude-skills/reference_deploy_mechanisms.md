---
name: reference_deploy_mechanisms
description: "How each site goes live — andyfreelancer auto-deploys on git push (DO); behind-thequeue needs manual `vercel --prod` CLI (NOT git push)"
metadata: 
  node_type: memory
  type: reference
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

The two production sites deploy by **different mechanisms** — do not assume `git push` makes a change live:

- **andyfreelancer.com** → DigitalOcean App Platform, **auto-deploys on `git push` to `master`** of the `the-freelancer` repo. Push = live (after ~1-2 min build). Behind Cloudflare, so a CDN hard-refresh/purge may be needed to see it. See [[reference_andyfreelancer_infra]].

- **behind-thequeue.com (BTQ)** → **Vercel, deploys via CLI only**, NOT GitHub auto-deploy. The site lives in the skills repo at `btq-production/website/` (Vercel project `website`, linked via that folder's `.vercel/project.json`). Git push only versions the file — to go LIVE you must run:
  ```
  vercel deploy --prod --yes --cwd "C:\Users\andre\.claude\skills\btq-production\website"
  ```
  Vercel aliases the deployment to behind-thequeue.com automatically. The `*.vercel.app` deployment URL is behind deployment-protection (401) — verify on the apex domain instead.

**Verify live, fresh (bypass WebFetch's 15-min cache):**
```powershell
$r = Invoke-WebRequest -Uri "https://SITE/?cb=$(Get-Random)" -UseBasicParsing -Headers @{"Cache-Control"="no-cache"}
if ($r.Content -match "<title>(.*?)</title>") { $matches[1] }
```

**Why:** Discovered 2026-06-24 — pushed a BTQ homepage swap to GitHub and it stayed stale because BTQ doesn't auto-deploy from git. Running `vercel --prod` fixed it. Matches the older "EP.018 BTQ launch: deploy" / "fresh-machine deploy recovery" commits being manual CLI deploys.

Related: [[project_andyfreelancer_redesign]], [[feedback_validate_before_theorizing]].
