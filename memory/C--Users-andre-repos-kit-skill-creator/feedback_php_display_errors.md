---
name: feedback-php-display-errors
description: PHP display_errors=On corrupts JSON API responses — always suppress at endpoint level with ini_set
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 8a3b1a0e-a5e5-4e55-b765-fbaf89097087
---

En PHP, si `display_errors=On` en php.ini, cualquier warning/error se inyecta como HTML en el body de la respuesta ANTES del JSON. El JS recibe contenido no-JSON y falla con "Unexpected end of JSON input" o "Unexpected token '<'".

**Regla:** Agregar `ini_set('display_errors', 0)` al top de CADA archivo PHP que devuelva JSON.

```php
<?php
ini_set('display_errors', 0);  // ← primera línea después de <?php
// ...rest of endpoint
header('Content-Type: application/json; charset=utf-8');
```

**Why:** En kit-estimador-servicios, `send-quote.php` y `admin-save.php` produjeron "Unexpected end of JSON input" porque Laragon tiene `display_errors=On` por defecto en php.ini (`output_buffering=4096` hace que el HTML se acumule antes del JSON). La suppressión por `ini_set` tiene prioridad sobre php.ini en runtime.

**How to apply:** Al generar cualquier PHP endpoint que haga `echo json_encode(...)`, agregar `ini_set('display_errors', 0)` como primera línea sin excepción. Aplica también a endpoints de admin, webhooks, y cualquier archivo que sea consumido por JS via fetch/XHR.

Relacionado: [[feedback-php-namespaces]]
