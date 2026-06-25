---
name: feedback-antivirus-smtp-ssl
description: "SMTP SSL errors on Windows often caused by antivirus, not PHP config. Add Laragon exception + SMTPOptions bypass."
metadata: 
  node_type: memory
  type: feedback
  originSessionId: c489a420-1e04-41e3-aa7e-47244ad589dd
---

On Windows with antivirus active, SMTP connections through PHPMailer may fail with SSL/TLS errors (error 60, certificate verify failed) even with correct credentials.

**Fix pattern:**
1. Add Laragon (or XAMPP) to antivirus exceptions
2. Add SMTPOptions bypass in PHPMailer config:

```php
$mail->SMTPOptions = ['ssl' => [
    'verify_peer'       => false,
    'verify_peer_name'  => false,
    'allow_self_signed' => true,
]];
```

**Why:** Antivirus intercepts the SSL handshake and presents its own certificate, which PHPMailer rejects. The bypass lets PHPMailer ignore certificate verification for local dev. Do NOT use this pattern in production.

**How to apply:** Any time SMTP fails on a Windows dev machine with "SSL" or "certificate" in the error, suggest antivirus exception FIRST, then add SMTPOptions as the code-side bypass.
