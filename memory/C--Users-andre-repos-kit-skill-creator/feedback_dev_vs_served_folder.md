---
name: feedback-dev-vs-served-folder
description: Never edit the dev/project copy of a web app — always edit the served folder (e.g. laragon/www/)
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c489a420-1e04-41e3-aa7e-47244ad589dd
---

Always verify WHICH copy of the project is being served before editing. There are two locations:

- Dev/source: `E:\Claude Project\Claude Projects\kit-*/`
- Served: `E:\laragon\www\kit-*/`

Edits to the source folder are invisible to the browser — the browser hits the served folder.

**Why:** During estimador debugging, multiple fixes were applied to the wrong copy. Email remained broken until we identified and edited `laragon\www\estimador\` instead.

**How to apply:** Before editing any PHP/HTML file in a project, confirm which path Laragon (or equivalent) is serving. If both exist, establish the served folder as canonical and keep the source as reference only.
