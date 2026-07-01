---
name: feedback_adaptive_llm_testing
description: "To test an adaptive LLM app, fixed scripts can't validate the positive case — use an LLM-vs-LLM simulator with ground-truth labels to measure false positives"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c095eaa1-ddd2-48cd-beda-36c84c765b41
---

When testing an **adaptive** LLM system (one that changes its behavior based on the input's earlier turns — e.g. an AI interviewer, a multi-turn agent), fixed/scripted test inputs cannot fairly validate the positive case.

**Why:** a pre-written "good" input can't answer the system's dynamically-generated follow-ups, so it looks evasive/inconsistent and the system flags it — producing false failures that are testing artifacts, not real bugs. In HireSignal this manifested as phantom "critical contradiction" flags on a scripted cooperative candidate; a dynamic simulator then showed the real false-positive rate was ~0%.

**How to apply:**
- Build an **LLM-vs-LLM simulator**: the real system prompt on one side, a *second* model (a cheaper/different one) playing the counterpart, responding dynamically. See `tests/candidate-simulator.js` in [[project_hiresignal_testing]].
- Give each simulated persona **ground-truth labels** (honest? planted flaw? expected verdict?) so you can compute false-positive rate, recall, and verdict accuracy against known-correct outcomes — not just eyeball transcripts.
- Keep a fixed-script harness too for adversarial/edge cases and cheap A/B (an `APPLY_FIXES`-style toggle for clean before/after), but don't trust it for the positive case.
- Reinforces [[feedback_validate_before_theorizing]]: a 3×3 (fixes on/off × 3 runs) matrix caught a self-introduced scoring regression before it shipped.
