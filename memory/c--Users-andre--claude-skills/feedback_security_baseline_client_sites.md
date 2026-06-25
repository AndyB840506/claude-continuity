---
name: feedback_security_baseline_client_sites
description: "Apply the security hardening baseline to client websites delivered via Andyfreelancer, not only our own properties"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

The security baseline we applied to our own apps (security headers/helmet, no secrets in client code, rate limiting on cost/abuse endpoints, escaping user input, single-use/expiring tokens where credentials are involved, .htaccess/data protection) must ALSO apply to the websites generated/delivered through Andyfreelancer's Web Page Kit service — not just the pages we build for ourselves.

**Why:** client deliverables handle other people's data and brand; shipping an insecure site under our name is a liability and the opposite of "agency premium." The user explicitly wants the patch discipline carried into client work.

**How to apply:** when producing a client web deliverable, run the same security pass before handoff — security headers, secret hygiene, input escaping, and rate limiting/abuse protection on any backend or form endpoints. Treat it as part of "done," like the deliverable checklist. Related: [[feedback_design_references]], [[reskin_vs_overhaul]].
