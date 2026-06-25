---
name: feedback-google-api-debug
description: "Google API 'File not found' / 'Entity not found' → verificar IDs desde URL primero, antes de revisar sharing o credenciales."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 896d78d2-2cae-488d-bcf8-0538242ec057
---

Cuando una integración con Google Sheets o Drive devuelve estos errores:
- `appendLead error: Requested entity was not found`
- `createOrderFolder error: File not found: {ID}`

**Debugging order (más probable → menos probable):**
1. **Verificar IDs desde la URL del browser** — Abrir el recurso real, copiar el ID de la barra de direcciones, comparar con el env var. Un solo carácter incorrecto causa estos errores.
2. **Verificar sharing** — El service account (`xxx@yyy.iam.gserviceaccount.com`) debe aparecer como Editor en Share dialog.
3. **Verificar el JSON del service account** — Confirmar que `GOOGLE_SERVICE_ACCOUNT_JSON` en DO es JSON válido y completo (no truncado).

**Why:** En la sesión de The Freelancer CRM, los errores apuntaban a sharing/auth, pero la causa real eran typos en los IDs: `1YuCrsN8j...` (incorrecto) vs `1YuCrsNBj...` (correcto), y `1aKJQOV8...` vs `1aKjJQOV8...`. Se perdió tiempo re-compartiendo recursos antes de verificar los IDs.

**How to apply:** Ante cualquier "not found" en Google APIs, pedir al usuario que abra el recurso y copie el ID de la URL antes de hacer cualquier otra cosa.
