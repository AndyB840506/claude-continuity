---
name: feedback_avast_connection_reset
description: Avast bloquea conexiones SSL a dominios nuevos — ondigitalocean.app y huggingface.co confirmados
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 99603a47-a605-4c8c-a8bd-2bb44d054bac
---

Avast bloquea conexiones SSL/HTTPS a dominios que considera nuevos o sospechosos. Dominios confirmados:
- `ondigitalocean.app` — marcado como "Technical Support Scam" (URL:Agent-W [ScamT])
- `huggingface.co` — bloqueado al descargar modelos ML, causa `SSLCertVerificationError`

**Why:** Avast inyecta su propio certificado CA y/o aborta conexiones a URLs desconocidas. El error aparece como `ERR_CONNECTION_RESET`, `SSLCertVerificationError`, o `ssl.SSLError: certificate verify failed`.

**How to apply:**
- Conexión a sitio web (DO, HF, etc.) falla con SSL o connection reset → pausar Avast Web Shield 10 min antes de debuggear el servidor o el código.
- Para descargas de modelos ML (HuggingFace): pausar Avast durante la descarga inicial; una vez cacheado el modelo no vuelve a necesitar conexión.
- Fix permanente: agregar el dominio a exclusiones de Avast → Configuración → Exclusiones → URLs.
- **Vercel CLI + Avast** → error `unable to verify the first certificate` al hacer `vercel --prod`. Fix: `$env:NODE_OPTIONS="--use-system-ca"; vercel --prod`. No requiere pausar Avast.
