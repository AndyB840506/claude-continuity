---
name: feedback-php-namespaces
description: PHP use statements no pueden ir dentro de if/blocks — usar namespace completo siempre en código condicional
metadata: 
  node_type: memory
  type: feedback
  originSessionId: beb2fec8-8c1e-436b-b3ef-718a56a44479
---

En PHP, `use` statements solo pueden ir al nivel raíz del archivo (después de `<?php` y antes de cualquier código). Ponerlos dentro de `if`, `function`, o cualquier bloque causa **fatal parse error** que hace que TODO el archivo falle — incluyendo rutas que no usan la librería.

**Síntoma:** Frontend recibe HTML con `<br />` y `<b>` en vez de JSON. Error: `Unexpected token '<'`.

**Regla:** Cuando una librería externa (PHPMailer, etc.) solo se usa en un bloque condicional, usar el namespace completo en lugar de `use`:

```php
// ❌ Fatal parse error
if ($condition) {
    require_once 'vendor/autoload.php';
    use PHPMailer\PHPMailer\PHPMailer; // PHP no permite esto
    $mail = new PHPMailer(true);
}

// ✅ Correcto
if ($condition) {
    require_once 'vendor/autoload.php';
    $mail = new \PHPMailer\PHPMailer\PHPMailer(true);
    $mail->SMTPSecure = \PHPMailer\PHPMailer\PHPMailer::ENCRYPTION_STARTTLS;
}
```

**Why:** En la sesión de kit-estimador-servicios, `admin-save.php` tuvo este bug 2 veces seguidas: primero el `use` statement, luego las constantes `PHPMailer::ENCRYPTION_SMTPS` sin namespace completo.

**How to apply:** Al generar cualquier archivo PHP que use Composer libraries dentro de bloques condicionales, siempre usar namespace completo `\Vendor\Package\Class` y nunca `use` dentro de bloques.

---

## Trampa en catch clauses con alias de namespace

Cuando el archivo usa `use PHPMailer\PHPMailer\Exception` al top nivel, el bare `Exception` en un `catch` clause resuelve a la clase de PHPMailer — NO a la `\Exception` base de PHP. Los errores PHP (`\Error`, `\TypeError`, etc.) no son catcheados, causando fatal errors con respuesta vacía o corrupta.

**Regla:** En archivos con `use` aliases de librerías externas, siempre usar `catch (\Throwable $e)`:

```php
// ❌ Solo captura PHPMailer\PHPMailer\Exception, no PHP \Error
} catch (Exception $e) {
    echo json_encode(['error' => $mail->ErrorInfo]);
}

// ✅ Captura TODO: PHPMailer exceptions + PHP errors + \Exception
} catch (\Throwable $e) {
    echo json_encode(['error' => $mail->ErrorInfo ?: $e->getMessage()]);
}
```

**Why:** En kit-estimador-servicios, `send-quote.php` tenía `use PHPMailer\PHPMailer\Exception` al top. Un PHP `\Error` quedaba sin catchear → respuesta vacía → "Unexpected end of JSON input" en el frontend.

Relacionado: [[feedback-php-display-errors]]

---

## Trampa de inicialización fuera del try block

Instanciar objetos de librerías externas ANTES del `try` block los deja sin protección.
Si el constructor throws, el error es uncaught → display_errors=0 → respuesta vacía.

**Regla:** Mover TODA inicialización de objetos externos dentro del try block:

```php
// ❌ Constructor fuera del try — uncaught si falla
$mail = new \PHPMailer\PHPMailer\PHPMailer(true);
try {
    $mail->isSMTP();
    ...
} catch (\Throwable $e) {
    echo json_encode(['error' => $mail->ErrorInfo ?: $e->getMessage()]);
}

// ✅ Correcto — constructor dentro del try
$mail = null;
try {
    $mail = new \PHPMailer\PHPMailer\PHPMailer(true);
    $mail->isSMTP();
    ...
} catch (\Throwable $e) {
    echo json_encode(['error' => ($mail && $mail->ErrorInfo) ? $mail->ErrorInfo : $e->getMessage()]);
}
```

**Why:** En admin-save.php, el `$mail = new PHPMailer(true)` estaba fuera del try.
Cualquier error en el constructor era uncaught → respuesta vacía → "Unexpected end of JSON input".

**Patrón:** Inicializar el objeto como `null` antes del try, instanciar dentro.
En el catch, verificar `$mail && $mail->ErrorInfo` antes de usarlo.
