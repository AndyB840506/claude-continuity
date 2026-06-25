---
name: feedback-composer-windows
description: "Antes de enviar comandos composer en Windows/Laragon, verificar instalación y antivirus"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: beb2fec8-8c1e-436b-b3ef-718a56a44479
---

Antes de enviar cualquier comando `composer install` o `composer require` en este entorno Windows:

1. **Verificar que Composer está instalado y actualizado:** correr `composer --version` primero
2. **Si no está instalado:** descargar desde https://getcomposer.org/download/
3. **Si hay error SSL (`curl error 60`):** el antivirus puede estar bloqueando — preguntar al usuario si lo tiene activo y si puede deshabilitarlo temporalmente
4. **En Windows + antivirus activo:** fue necesario deshabilitar el antivirus para instalar/correr Composer correctamente

**Why:** El usuario tuvo que seguir un video para instalar Composer y deshabilitar el antivirus manualmente antes de que funcionara. El error SSL de Composer en este entorno no se resuelve solo con `cafile` config — el antivirus intercepta las conexiones HTTPS.

**How to apply:** Antes de cualquier sesión que requiera `composer install`, preguntar: "¿Tienes Composer instalado? ¿Puedo verificar con `composer --version`?" Si hay error SSL, preguntar sobre el antivirus antes de sugerir más comandos.
