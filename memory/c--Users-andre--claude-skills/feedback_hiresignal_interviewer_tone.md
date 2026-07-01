---
name: feedback_hiresignal_interviewer_tone
description: "HireSignal interviewer was too aggressive/prosecutorial when a candidate was evasive — fixed 2026-07-01 with a DELIVERY guardrail + deferred callbacks, deployed to master"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c095eaa1-ddd2-48cd-beda-36c84c765b41
---

The HireSignal interviewer (config.php buildSystemPrompt / buildToneInstruction) used to become **too aggressive and prosecutorial** once a candidate was evasive — repeated "you didn't answer me / it's the third time I ask", cold demands for exact words, and gotcha-style call-outs when exposing an inconsistency. Owner's words (2026-07-01): "se siente super agresiva... crea tensión y presión... no tiene ese toque humano, es totalmente un ojete." Clarified further: "no es lo que dices sino como lo dices... hay mil maneras de decirle a una persona estas mintiendo sin tener que insinuárselo."

**Why it mattered:** even a correct REJECT left a bad candidate experience, reflecting on the CLIENT's employer brand (HireSignal runs on the client's behalf). The screening value was real but the *delivery* was off.

**Fix shipped 2026-07-01 (`fix/interviewer-tone-delivery`, merged + pushed to master `59e4717`, live):**
- New `## DELIVERY — HOW YOU PROBE` section in the system prompt (config.php + mirrored in tests/model-comparison.js under APPLY_FIXES): bans accusatory phrasing ("that's the third time", "you didn't answer", counting attempts), reframes every probe as the interviewer's own curiosity ("help me understand..."), owns the confusion when reconciling a contradiction instead of calling it out.
- The owner's specific fix idea: instead of insisting on a vague answer in the moment, the anti-loop rule was reworked into **DEFERRED CALLBACKS** — ask at most one gentle follow-up, then move on and park it as a memory_hook; circle back later in the interview from a relaxed angle; bundle multiple parked points into ONE low-pressure question instead of re-litigating each ("a couple of things from earlier I'd love to hear more about — X and Y"). Added a documented exception to the "one question per message" rule for this bundling case.
- Detection logic (contradiction/injection flags, scoring, dealbreakers) was **not touched** — only when/how findings surface to the candidate.

**Validated via candidate-simulator.js** (targeted with a new `PERSONA=` env filter) against the two personas that used to trigger the cold tone: an honest-but-vague candidate (saw the deferred callback in action) and a candidate planting a real tenure contradiction (saw it confronted without accusation — "help me connect those two" — still resulted in correct REJECT). Verdict accuracy 2/2, contradiction recall 1/1, 0 false positives: the filter is warmer, detection held.

- Related: [[project_hiresignal_testing]], [[feedback_adaptive_llm_testing]].
