---
name: feedback-planmode-exitplan-timing
description: "En plan mode, no llamar ExitPlanMode mientras el usuario está en medio de conseguir datos externos. Esperar confirmación."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 7b9bf6db-bab7-4dac-88c2-d4fc7cb8011f
---

## Plan Mode — ExitPlanMode Timing

**Anti-patrón:** Llamar `ExitPlanMode` tan pronto como el plan está escrito, aunque el usuario esté activamente recopilando información externa (URLs, credenciales, configuraciones de terceros).

**Síntoma:** ExitPlanMode rechazado en cadena (2+ veces) porque el usuario estaba mid-process consiguiendo datos.

**Patrón correcto:** Cuando un plan requiere datos externos que el usuario necesita obtener (ej: URL de PayPal, link de Wise, credenciales de API), esperar a que el usuario confirme que tiene todos los datos antes de intentar ExitPlanMode.

**Señal de "usuario todavía recopilando":**
- Usuario pregunta cómo conseguir algo ("¿dónde consigo la URL?")
- Usuario comparte screenshots de páginas externas
- Usuario dice "me están pidiendo X" (verificación, formulario)

**Cuándo SÍ llamar ExitPlanMode:**
- Usuario confirma que tiene todos los datos ("ya tengo el link")
- Usuario pega las URLs/credenciales directamente en el chat
- Usuario dice "listo" o "ya quedó"

**Why:** Intentar cerrar el plan antes de que el usuario esté ready interrumpe su flujo y no agrega valor. El plan ya está escrito — esperar unos mensajes más no cuesta nada.
