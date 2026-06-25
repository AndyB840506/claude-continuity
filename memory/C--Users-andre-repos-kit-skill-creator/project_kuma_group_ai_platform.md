---
name: project-kuma-group-ai-platform
description: Kuma Group Ontario/Federal grant proposals — dual-module AI platform (Kuma Flow lead engagement + Hiresignal text hiring). Two versions: Ontario Chamber + NRC IRAP federal. Files in kit-skill-creator/proposals/.
metadata: 
  node_type: memory
  type: project
  originSessionId: ae4d7819-351d-4cfd-a24a-7e5b096e0199
---

## LuccaTech AI Platform (ex-Kuma Group)

**Status:** Kuma Talent en radio silent (2026-06-02). Todos los productos desarrollados por Andres pasan a ser propiedad de LuccaTech, no Kuma Talent.

**Rebrand:** Kuma Flow → **Lucca Flow** (aún no construido — sin código ni archivos). Kuma Group/Kuma Talent ya no son el vehículo.

**Note on name:** "Kuma Group" era nombre de trabajo temporal para las propuestas de beca. Ahora todo bajo LuccaTech.

**Team:**
- Andres Bermudez — Lead Developer (built Hiresignal). Based in Colombia (remote).
- Hugo Lancheros — Marketing & Sales Director. Based in Ontario, Canada.
- Contact: hello@kumatalent.com | +1 (587) 894-9527

**Business registration:** Ontario-based. Hugo Lancheros is the Ontario registrant. Registration pending at ontario.ca/businessregistry (~$60 CAD, same-day online).

**Grant targets (two versions):**
1. Ontario Chamber of Commerce — provincial grant
2. NRC IRAP (National Research Council — Industrial Research Assistance Program) — federal grant

**Amount requested:** $58,500 CAD
**Project duration:** 12 months | Build: 10 weeks

**Why:** Help Ontario/Canadian SMEs compete with enterprise tools they can't afford. Keep Canadian AI IP in Canada.

---

## Two Modules

**Module 1 — Lucca Flow (Multi-Channel AI Lead Engagement)** _(ex-Kuma Flow)_
- Captures leads from SMS, Email, WhatsApp, Instagram, Facebook, Telegram
- AI (Claude) responds on the SAME channel the lead came from
- Ad-triggered via click-to-message links on Facebook/Instagram/Google ads
- Follow-up engine: 4 attempts (Day 1/4/9/16) → 30-day cooling → re-engages automatically
- Lead never deleted — "cooling" not "lost"
- Built on GoHighLevel (channel backbone) + Hiresignal AI engine (extended)

**Module 2 — Hiresignal Text Candidate Screening**
- When SME posts a job → AI texts every applicant automatically
- Conducts structured qualification conversation via SMS/WhatsApp
- Scores and ranks candidates by fit before owner reads a resume
- Replaces recruitment agencies ($7,500–$12,500/hire) at near-zero marginal cost
- Voice functionality on hold (cost); text is the current scope
- Built by extending existing Hiresignal PHP + Claude AI engine

---

## Tech Stack
- Hiresignal (PHP + Claude API) — existing, proven — extended not rebuilt
- GoHighLevel Agency Pro — channel backbone (~$407 CAD/month)
- Anthropic Claude API — claude-sonnet-4-6 for qualification, claude-opus-4-7 for closing
- Supabase (Postgres) — leads + candidate DB
- Railway — hosting
- Telegram Bot API — direct (GHL doesn't support Telegram)

---

## Privacy / Compliance
- PIPEDA (Personal Information Protection and Electronic Documents Act) — federal Canadian law governing data handling. Used in all proposals (not PIPA, which is Alberta-specific).

---

## Files
All in `e:\Claude Project\Claude Projects\kit-skill-creator\proposals\`

| File | Description |
|---|---|
| `ontario-grant-proposal-ai-lead-funnel.md` | Ontario Chamber grant proposal (markdown) |
| `ontario-grant-proposal-ai-lead-funnel.html` | Ontario Chamber grant proposal (HTML, print-ready) |
| `ontario-business-registration.html` | Ontario business registration guide + letter template |
| `federal-grant-proposal-ai-lead-funnel.md` | NRC IRAP federal grant proposal (markdown) |
| `federal-grant-proposal-ai-lead-funnel.html` | NRC IRAP federal grant proposal (HTML, print-ready) |
| `platform-explainer.html` | Plain-language explainer for non-technical reviewers |

---

## IRAP Labour Eligibility Warning
NRC IRAP reimburses Canadian-based labour only. Hugo's Ontario hours are fully eligible. Andres's Colombia-based hours may not qualify for reimbursement — confirm with ITA before submitting federal version.

---

## Before Submission — Open Items
1. Business not yet registered — Hugo completes at ontario.ca/businessregistry (~$60 CAD, same day)
2. Hugo's Ontario mailing address needed (for registration form + grant proposal header)
3. Hugo's bio section — 2–3 sentences about background, sales/marketing experience, Ontario SME relevance
4. For federal (IRAP): Contact NRC to be assigned an Industrial Technology Advisor (ITA) — first step
5. For federal (IRAP): Confirm with ITA whether Andres's Colombia hours qualify for reimbursement
6. Remove DRAFT banners once Business Identification Number received and all placeholders resolved
7. Verify ~500,000 Ontario SME count against latest Statistics Canada Business Register before submitting
