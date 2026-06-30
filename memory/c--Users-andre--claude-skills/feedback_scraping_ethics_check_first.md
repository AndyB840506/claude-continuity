---
name: feedback-scraping-ethics-check-first
description: "Check robots.txt/ToS for explicit scraping prohibitions BEFORE building any scraper, and respect AI-crawler-specific exclusions instead of spoofing a browser User-Agent around them"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: bedf27ca-45e2-4991-9284-f4e2b22804e2
---

Before writing any scraper (self-hosted or via Apify) for a new target site,
fetch `robots.txt` first and check for two things, in this order:

1. A blanket prohibition on scraping for commercial/AI use, sometimes stated
   as a comment rather than a `Disallow` rule (e.g. elempleo.com explicitly
   bans scraping for AI/ML development and any commercial purpose). If
   present, stop — don't build anything, regardless of technical feasibility.
2. AI-crawler-specific exclusions (`GPTBot`, `ClaudeBot`, `anthropic-ai`,
   `DeepSeekBot`, etc.) that block paths general browsers/Googlebot can still
   access (seen on Indeed: `/jobs` allowed for Googlebot, disallowed for
   ClaudeBot). Don't spoof a generic browser User-Agent to route around a
   distinction the site owner deliberately made — treat it the same as an
   explicit prohibition.

**Why:** During the Kuma Talent Argentina sourcing benchmark (2026-06-29),
checking robots.txt before writing code caught a real policy violation
(elempleo.com) and an AI-specific exclusion (Indeed) before any scraper was
built — not after. This was unprompted and the user didn't push back on
either exclusion, confirming the approach.

**How to apply:** This is a standing rule for any future scraping work, not
just [[apify-scraper]] — applies equally to self-hosted scripts and to
choosing/running Apify Actors. See [[apify-scraper]]'s
`workflows/self-hosted-alternative.md` for the full technical checklist this
rule is step 1 of.
