---
name: project-andyfreelancer-payment
description: "andyfreelancer.com payment links setup — PayPal.me pre-fills amount, Wise is static, env-var-gated pattern"
metadata: 
  node_type: memory
  type: project
  originSessionId: 7b9bf6db-bab7-4dac-88c2-d4fc7cb8011f
---

## andyfreelancer.com — Payment Integration

**PayPal.me:** `https://paypal.me/andy8405`
- Append amount: `${PAYPAL_ME_URL}/${low}` → `https://paypal.me/andy8405/350`
- Pre-fills amount in PayPal UI ✅

**Wise:** `https://wise.com/pay/business/thefreelancer`
- Static link — no amount pre-fill possible
- Client enters amount manually

**Pattern:** Both buttons are conditionally rendered — only appear in email if env vars are set. If not set, email falls back to "reply to this email" CTA. Zero breaking changes.

```js
const paypalUrl = process.env.PAYPAL_ME_URL ? `${process.env.PAYPAL_ME_URL}/${low}` : null;
const wiseUrl = process.env.WISE_URL || null;
// render buttons only if (paypalUrl || wiseUrl)
```

**Env vars:**
- `PAYPAL_ME_URL=https://paypal.me/andy8405`
- `WISE_URL=https://wise.com/pay/business/thefreelancer`
- `PATCH_SECRET=patchsecret_andyf_7kx9m3p2q1`

**Where:** `freelancer/email.js` → `sendQuote()` function

**Why:** PayPal asks for annual income during verification, but the PayPal.me link can be created before completing verification. Don't confuse verification flow with link creation.
