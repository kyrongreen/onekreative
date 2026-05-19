# One Kreative — Deployment Guide

Follow these steps in order. Each section links to the right place and tells you exactly what to click or paste.

---

## Step 1 — Create Stripe Payment Links

You need a free [Stripe](https://stripe.com) account. If you don't have one, sign up at stripe.com.

**Create 5 Payment Links** (one per ad size). For each one:

1. Go to **Stripe Dashboard → Payment Links → + New**
2. Click **Add a product → Create a new product**
3. Fill in:

| Link | Product Name | Price |
|------|-------------|-------|
| #1 | Small Spot — EDDM Mailer | $175.00 |
| #2 | Medium Spot — EDDM Mailer | $325.00 |
| #3 | Large Spot — EDDM Mailer | $499.00 |
| #4 | Community Single Spot — EDDM Mailer | $150.00 |
| #5 | Community Full Side — EDDM Mailer | $1,000.00 |

4. (Optional but recommended) Under **"After payment"**, set a confirmation message like: *"Thanks! We'll be in touch within 1 business day to confirm your spot and start on your ad design."*
5. (Optional) Under **"Collect additional information"**, enable **Phone** and a custom field: *"Business name and category"*
6. Click **Create link** — copy the URL (looks like `https://buy.stripe.com/xxxxxxxx`)

**Repeat for all 5.** Keep the URLs handy — you'll paste them into the HTML next.

---

## Step 2 — Add Your Stripe Links to the Landing Page

Open `eddm-landing-page.html` in a text editor (TextEdit works, or VS Code if you have it).

Do a **Find & Replace** for each of these:

| Find this | Replace with your Stripe URL |
|-----------|------------------------------|
| `STRIPE_SMALL_175` | Your Small Spot link |
| `STRIPE_MEDIUM_325` | Your Medium Spot link |
| `STRIPE_LARGE_499` | Your Large Spot link |
| `STRIPE_COMMUNITY_150` | Your Community Single link |
| `STRIPE_FULLSIDE_1000` | Your Full Side link |

Save the file when done.

---

## Step 3 — Create a GitHub Repository

GitHub hosts your code so Netlify can auto-deploy it. Free account is fine.

1. Go to [github.com](https://github.com) and sign in (or create a free account)
2. Click the **+** icon (top right) → **New repository**
3. Name it: `onekreative-site`
4. Set it to **Private** (or Public — your call)
5. Leave everything else as default → click **Create repository**

**Upload your files:**

6. On the new repo page, click **Add file → Upload files**
7. Upload both files:
   - `eddm-landing-page.html` — **rename it to `index.html` before uploading**
   - `mailer-layout.html`
8. At the bottom, click **Commit changes**

---

## Step 4 — Deploy on Netlify

Netlify hosts your site for free and auto-updates every time you push to GitHub.

1. Go to [netlify.com](https://netlify.com) → **Sign up / Log in with GitHub**
2. Click **Add new site → Import an existing project**
3. Choose **GitHub** → find and select `onekreative-site`
4. Configure build settings:
   - **Build command:** *(leave blank)*
   - **Publish directory:** `/` (or just leave it blank — Netlify will find `index.html`)
5. Click **Deploy site**

Your site will be live in about 30 seconds at a URL like `https://charming-marigold-abc123.netlify.app`.

---

## Step 5 — Connect Your Custom Domain

1. In Netlify, go to your site → **Site settings → Domain management → Add a domain**
2. Enter your domain (e.g. `onekreative.com`) → click **Verify**
3. Netlify will show you **DNS records** to add — typically two:
   - An **A record** pointing to Netlify's IP
   - A **CNAME record** for `www`
4. Log into wherever you bought your domain (GoDaddy, Namecheap, Google Domains, etc.)
5. Go to **DNS settings** and add the records Netlify showed you
6. Back in Netlify, click **Verify DNS configuration**

DNS changes can take a few minutes to a few hours to fully propagate. Netlify also enables **free HTTPS/SSL** automatically once your domain is connected.

---

## You're Live ✓

Once everything is connected, the flow looks like this:

```
Customer visits onekreative.com
  → clicks "Reserve This Spot"
  → lands on Stripe checkout (secure, professional)
  → pays and gets a confirmation
  → you get a notification in your Stripe dashboard
```

**To update the site in the future:** just edit `index.html` on GitHub (or re-upload it) and Netlify redeploys automatically within seconds.

---

## Quick Reference — Placeholder Names

If you ever need to find them again in the HTML:

| Placeholder | Ad Size | Price |
|-------------|---------|-------|
| `STRIPE_SMALL_175` | Small Spot | $175 |
| `STRIPE_MEDIUM_325` | Medium Spot | $325 |
| `STRIPE_LARGE_499` | Large Spot | $499 |
| `STRIPE_COMMUNITY_150` | Community Single | $150 |
| `STRIPE_FULLSIDE_1000` | Community Full Side | $1,000 |

---

*Guide prepared for Kyron Green / One Kreative — May 2026*
