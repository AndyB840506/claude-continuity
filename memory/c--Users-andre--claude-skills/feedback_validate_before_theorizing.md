---
name: feedback-validate-before-theorizing
description: "Al debuggear, validar el instrumento/stack antes de construir una teoría sobre su lectura"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: eef56af2-c098-41d0-9955-84bd370002b6
---

Cuando un resultado de diagnóstico es raro, o cuando un fix viene de afuera (otra IA, doc, Stack Overflow), **validar primero el supuesto** antes de construir sobre él.

**Why:** en la sesión 2026-06-19 hubo dos resbalones del mismo tipo —
(1) armé una teoría de "dos zonas DNS" basada en un `nslookup` local que mentía (caché/PoP viejo); al cross-checkear con DoH la teoría se cayó.
(2) casi aplico el fix de Gemini que asumía Next.js/Vercel cuando el stack real era Express.

**How to apply:** ante un resultado extraño, cross-checkear con una fuente/herramienta independiente antes de teorizar (ej. DoH vs nslookup — ver [[reference-andyfreelancer-infra]]). Ante un fix externo, verificar que los supuestos (stack, framework, host) coincidan con el proyecto real antes de copiarlo.

Caso extendido (06-25, Kuma): cuando dependo del **estado de un servicio externo que no puedo ver** (un Google Form publicado o no, el editor de Apps Script con error de `authuser`, una URL que el usuario tipeó), **NO teorizar sobre ese estado** — pedirle al usuario que **confirme el estado o pegue la URL/ID exacta desde la fuente PRIMERO**, antes de gastar turnos adivinando. Ver [[feedback_live_dns_danger]].

Aplica también a **backups/sincronizaciones**: cuando un script declara "respaldado/sincronizado", verificar que el DESTINO realmente tiene los archivos (ej. `git ls-files` / contar archivos en el repo remoto), no asumir que corrió bien. Un sync con un bug silencioso (slug mal derivado) puede respaldar CERO durante semanas sin avisar — pasó el 06-25 con claude-continuity. Ver [[feedback_always_backup_github]].
