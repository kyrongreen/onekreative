# One Kreative — Project Handoff

## Who You're Helping
**Kyron Green** — owner of **One Kreative**, a creative agency based in the Austin TX suburbs (Dripping Springs area). He's not a developer, so keep things clear and practical.

---

## What This Project Is

**One Kreative** runs a **CO-OP EDDM mailer program** — local businesses share ad space on a 9×12 postcard mailed via USPS to ~2,500 homes every two weeks. One Kreative handles design; businesses pay per mailer drop. One business per category per mailer (exclusivity is a key selling point).

**The goal:** Get the One Kreative landing page live on the web with a working payment system.

---

## Current State

A fully designed, single-file landing page (`eddm-landing-page.html`) has been built. It includes:

- **Nav** with anchor links
- **Hero** — postcard visual with floating testimonial cards
- **Exclusivity banner** ("One business per category")
- **Stats bar** (2,500 homes, bi-weekly, 9×12, 10 slots)
- **How It Works** — 3 steps
- **Why EDDM** — 6 feature points
- **Pricing section** — two tabs (Business Layout / Community Layout)
  - Business: $175 (Small 2.75×3.5"), $325 (Medium 5.68×3.5"), $499 (Large 8.59×3.5")
  - Community: $150/slot or $1,000 for a full side
- **Visual mailer layout** — interactive tabs showing front/back of both layouts
- **Reviews** — 3 testimonial cards (placeholder names)
- **CTA section** — currently links to `mailto:hello@onekreative.com`
- **Footer**

**Design style:** Warm editorial — cream/gold palette, Playfair Display + Inter fonts. Inspired by tatumhamernik.com.

**Contact email:** hello@onekreative.com

---

## What Still Needs to Be Done

### 1. Stripe Integration
The "Reserve Your Ad Spot" buttons and CTA currently go to a mailto link. They need to trigger a payment flow.

**Recommended approach:** Stripe Payment Links (simplest, no backend needed)
- Create 4 Stripe Payment Links:
  - Small Spot — $175
  - Medium Spot — $325
  - Large Spot — $499
  - Community Single — $150
- Update the `href` on each pricing card's "Reserve This Spot" button and the CTA section to point to the appropriate Stripe link
- Optionally collect business name + category via Stripe's "collect customer info" setting

**Alternative:** Embedded Stripe Checkout (requires a small serverless function on Netlify)

### 2. GitHub Repo
- Create a new GitHub repo: `onekreative-site` (or similar)
- The site is a single HTML file — no build step needed
- Push `eddm-landing-page.html` renamed to `index.html`
- Also include `mailer-layout.html` (standalone mailer layout diagram)

### 3. Netlify Deployment
- Connect the GitHub repo to Netlify
- No build command needed — it's static HTML
- Publish directory: `/` (root)
- Eventually connect a custom domain (Kyron may have `onekreative.com` — confirm with him)

### 4. Contact Form (Optional Upgrade)
The CTA currently goes to mailto. A better UX would be a Netlify Form or Typeform embedded on the page so inquiries are captured without opening an email client. Low priority, can do after launch.

---

## File Reference

| File | Description |
|------|-------------|
| `eddm-landing-page.html` | Full landing page — this is the main deliverable |
| `mailer-layout.html` | Standalone visual diagram of the 9×12 postcard layout |
| `README.md` | Project overview and pricing reference |

---

## Pricing Quick Reference

### Business Layout (9×12 Postcard)
| Plan | Price | Ad Size | Slots |
|------|-------|---------|-------|
| Small Spot | $175/drop | 2.75" × 3.5" | 6 (3 per side) |
| Medium Spot | $325/drop | 5.68" × 3.5" | 2 (1 per side) |
| Large Spot | $499/drop | 8.59" × 3.5" | 2 (1 per side) |

### Community Layout (9×12 Postcard — all equal slots)
| Plan | Price | Ad Size | Slots |
|------|-------|---------|-------|
| Single Spot | $150/drop | 2.75" × 3.5" | 16 (8 per side) |
| Full Side | $1,000/drop | Own entire side | — |

---

## Key Decisions Still Needed from Kyron
- **Does he have a domain?** (e.g. `onekreative.com`) — needed for Netlify custom domain
- **Stripe approach** — Payment Links (easy) vs. Embedded Checkout (fancier)?
- **Phone number** — the footer CTA has `href="tel:+1"` (placeholder). Does he want a number there?
- **Community layout pricing** — the page notes it's a placeholder. Confirm actual rates.

---

## Tone / How to Work With Kyron
- He's technically competent enough to follow instructions but isn't a developer
- Give clear step-by-step guidance when tasks involve dashboards (Stripe, Netlify, GitHub)
- He values clean execution over excessive explanation
- He'll log in to services himself — just tell him exactly what to do and what to paste where

---

## Repo / Deployment Plan Summary

```
GitHub: onekreative-site
  └── index.html         (renamed from eddm-landing-page.html)
  └── mailer-layout.html

Netlify:
  └── Connected to GitHub repo
  └── Auto-deploys on push to main
  └── Custom domain: TBD (confirm with Kyron)

Stripe:
  └── 4 Payment Links (one per ad size)
  └── Embedded in index.html button hrefs
```

---

*Last updated: 2026-05-17 by Kashe (OpenClaw)*
