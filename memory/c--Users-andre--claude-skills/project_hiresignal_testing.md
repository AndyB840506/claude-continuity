---
name: project_hiresignal_testing
description: "HireSignal both flows on Opus 4.8 (Sonnet 5 evaluated & rejected for chat); reusable evals in tests/; hardening + tone-delivery fix both shipped and smoke-tested as of 2026-07-01"
metadata: 
  node_type: memory
  type: project
  originSessionId: c095eaa1-ddd2-48cd-beda-36c84c765b41
---

HireSignal (`C:\Users\andre\repos\hiresignal`, PHP, deploys to DO via git push to `Lucca-Tech/hiresignal` master — see [[reference_kuma_infra]]) interview + report engine, state as of 2026-07-01:

**Model choice:** both Claude flows (interview chat + Intelligence Engine report) run `claude-opus-4-8` (config.php LLM_CHAT_MODEL / LLM_REPORT_MODEL). **Sonnet 5 was evaluated and rejected for chat** even though it's ~55% cheaper: it skipped the required English-assessment stage (6/6 runs) and false-flagged injection on benign text. Model choice is developer-controlled — admin/settings.php strips any client model fields. `docs/costos-estimados.md` has the current pricing + this decision.

**Reusable test tooling (in `tests/`, all reuse the production-ported prompts):**
- `model-comparison.js` — exports the interview engine (guarded main); `--personas` (model A/B), `--battery2` (edge cases + reports); `APPLY_FIXES=0|1` toggles the hardening on/off for clean before/after.
- `candidate-simulator.js` — LLM-vs-LLM: real interviewer prompt (Opus) vs a second model (Sonnet) playing a ground-truth-labeled candidate; scores verdict accuracy + false-positive/recall. See [[feedback_adaptive_llm_testing]].
- `docs/testing-strategy.md` — 3-layer plan; Layer 3 = a **planned weekly real-data regression tester** (regression replay + hand-labeled golden set vs real hiring outcomes) to build once production data exists.

**Shipped to master 2026-07-01 (deployed):** 7 interview-engine fixes — cognitive-block per-turn reminder, anti-loop rule, strong-flag calibration, injection false-positive guard, injection→hard-REJECT (`injection_attempts>=1`), English dealbreaker (required + `basic`→REJECT), and deterministic scoring recomputed server-side from `score × fixed weight` in `applyOverrideRules` (`scoringWeights()`, sum=1.0). Simulator validation: 15/15 verdict accuracy, 0% contradiction/injection false-positives, 100% recall.

**Live smoke test PASSED 2026-07-01** (full real interview → generated PDF report, `✓DB` badge = Postgres connected): report rendered cleanly (no PHP error), deterministic score math verified correct (base 17.9 − 2×15 crit → clamped 0/100), hard-REJECT fired on 2 critical contradictions, anti-loop rule closed the interview gracefully after 3 repeats, and it caught a real fabrication with no false positives. All 7 fixes confirmed working in production.

**Tone-delivery fix shipped 2026-07-01 (`59e4717`, deployed):** see [[feedback_hiresignal_interviewer_tone]] — DELIVERY guardrail bans accusatory phrasing, deferred callbacks replace in-the-moment insistence on vague answers (park → circle back later → bundle multiple parked points into one warm question). Detection logic untouched; validated via a persona-filtered simulator run (`PERSONA=` env var, new) — verdict accuracy 2/2, contradiction recall 1/1, 0 FP.

**Residual:** model contradiction *recall* varies run-to-run (~2-3/3) — a Layer-3 golden-set target, not rule-fixable.
