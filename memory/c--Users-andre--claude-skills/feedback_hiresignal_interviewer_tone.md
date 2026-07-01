---
name: feedback_hiresignal_interviewer_tone
description: "HireSignal interviewer feels too aggressive/prosecutorial when a candidate is evasive — must stay warm & human WHILE probing, not an interrogator"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c095eaa1-ddd2-48cd-beda-36c84c765b41
---

The HireSignal interviewer (config.php buildSystemPrompt / buildToneInstruction) becomes **too aggressive and prosecutorial** once a candidate is evasive — repeated "you didn't answer me / it's the third time I ask", cold demands for exact words, and gotcha-style call-outs when exposing an inconsistency. Owner's words (2026-07-01): "se siente super agresiva... crea tensión y presión... no tiene ese toque humano, es totalmente un ojete."

**Why it matters:** even a correct REJECT leaves a bad candidate experience, which reflects on the CLIENT's employer brand (HireSignal runs on the client's behalf). The screening value is real but the *delivery* is off.

**How to apply (when tuning the interview prompt):**
- The problem is delivery/tone, NOT the probing itself — do NOT weaken evasion/fabrication detection (that's the product's core value). The `ADAPTIVE DIFFICULTY ENGINE` escalation lacks a warmth guardrail: it presses hard but coldly.
- Add "stay warm and human WHILE probing" to the escalation path: firm but kind, curious not accusatory, give benefit of the doubt when confronting a contradiction ("help me understand..." not "you didn't answer / that wasn't real").
- Tone is SUBJECTIVE — can't be validated by the simulator's verdict/FP metrics. Validate by generating sample transcripts (candidate-simulator.js) and having the owner read whether it feels human while still catching evasion. Iterate with the owner, not autonomously.
- Related: [[project_hiresignal_testing]], [[feedback_adaptive_llm_testing]].
