---
name: project-kuma-talent-sourcing
description: "kuma-talent-sourcing repo state — what's working (Computrabajo Argentina), what's parked (Job Bank Canada, Facebook Groups) and why, plus the country/legal strategy behind it"
metadata: 
  node_type: memory
  type: project
  originSessionId: bedf27ca-45e2-4991-9284-f4e2b22804e2
---

New repo `kuma-talent-sourcing` (GitHub, Lucca-Tech org) holds self-hosted
(non-Apify) scrapers for Kuma Talent's recruiting research — built 2026-06-29
because Apify's per-result pricing is a real cost concern (the user's partner
isn't contributing financially, see [[reference_kuma_infra]]).

**Working, active tool:** `computrabajo_scraper.py` — scrapes Computrabajo
Argentina job listings (title, company, location, remote, salary, posted,
URL). Server-rendered, open robots.txt, $0 cost. Paired with
`benchmark_report.py` (CSV → text summary: salary median/range, remote split,
top companies/cities) and `executive_report.py` (same data → partner-facing
PDF with matplotlib charts). Five roles benchmarked so far: Asistente Virtual
(59% remote, far higher than the other four — the only category where remote
framing matches market expectation), Atención al Cliente, Ingreso de Datos,
Auxiliar Contable, Soporte Técnico (all 0-2% remote in Argentina).

**Parked, not abandoned:**
- `jobbank_canada_scraper.py` / `canada_demand_benchmark.py` — Job Bank Canada
  (jobbank.gc.ca) has a fully open robots.txt and scrapes cleanly, but it
  measures *domestic* Canadian hiring, not outsourcing intent — a company
  outsourcing to Argentina has no reason to post that job on a Canadian
  government board. Revisit with Upwork (or similar) instead if/when
  "what do Canadian companies want to outsource" becomes the active question.
- Facebook Groups scraping (via Apify's `apify/facebook-groups-scraper`, not
  self-hosted) — technically works and is interesting (candidates sometimes
  post their own CV as an image, OCR'd by the Actor), but signal is mostly
  noise (employer job ads, unrelated spam) mixed in with real candidate posts.
  Not worth pursuing further unless Computrabajo-style sourcing dries up.

**Country/legal framing:** Argentina is the first target — USD-paid
contractor work is attractive given peso devaluation, plus a strong
English-proficient talent pool. The mechanism is independent-contractor
classification (monotributista), not "weak labor law" — Argentina's actual
*employment* law is strict; contractor status is what sidesteps it. This is a
real compliance question the user should verify with local counsel before
scaling, not something resolved here.

**Platform feasibility already checked (don't re-investigate):** Bumeran,
Laborum, ZonaJobs all share one platform (SPA + Cloudflare bot detection) —
self-hosting fails there, would need a paid Apify Actor. elempleo.com
explicitly prohibits scraping for commercial/AI use. Indeed blocks AI
crawlers specifically on job-listing paths. See [[feedback_scraping_ethics_check_first]]
and [[apify-scraper]]'s `workflows/self-hosted-alternative.md` for the
checklist used to evaluate all of these.
