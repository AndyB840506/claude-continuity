---
name: feedback-php-json-header-order
description: PHP JSON endpoints must set headers and display_errors BEFORE any require_once
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c489a420-1e04-41e3-aa7e-47244ad589dd
---

Every PHP file that returns JSON must start with these lines — before ANY require_once or include:

```php
ini_set('display_errors', 0);
header('Content-Type: application/json; charset=utf-8');
// other headers...
if (!file_exists(__DIR__ . '/vendor/autoload.php')) {
    http_response_code(500);
    echo json_encode(['error' => 'PHPMailer not installed.']);
    exit;
}
require_once __DIR__ . '/vendor/autoload.php';
```

**Why:** If a require_once fails (file missing, parse error), PHP outputs an HTML error page before the header() call. The browser receives HTML wrapped in the expected JSON slot → `Unexpected end of JSON input`. display_errors=0 prevents that HTML from leaking.

**How to apply:** Any time I write or review a PHP file that echoes JSON, check header order first. This is rule #1.
