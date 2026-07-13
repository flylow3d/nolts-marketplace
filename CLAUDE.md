# Nolt's Marketplace — Website Proof of Concept

> **⚠️ This site was the first of many. Building a NEW client site, or working
> on the web business? Read the playbook first:**
> `C:\Users\flylo\Documents\Website Business\PLAYBOOK-building-client-sites.md`
> (full pipeline, quality bar, business rules, known pitfalls, site registry).

## What this project is

A demonstration that a complete, beautiful business website can be built for a
local business **using only publicly available information** — no input from
the business itself. The pitch: walk into the store, show them what their web
presence *could* be, and wow them.

**The business:** Nolt's Marketplace, 10370 Leo Rd, Fort Wayne, IN 46825
(Leo Crossing Shopping Center) · (260) 471-0377. A small family-owned Amish
deli, bakery, and specialty market run by Doug and Sheri Nolt since
September 2012. They currently have **no website** — only a Facebook page and
third-party listings (Yelp, TripAdvisor, Grubhub, Uber Eats).

## What the research found (sources: Yelp, TripAdvisor, Restaurantji, Allmenus, InNorthwestNews, BusinessYab)

- "Small family owned specialty Amish Deli/Bakery" with **70+ Amish meats and cheeses**
- Full deli counter: sandwiches, paninis, wraps, in-house salads
- Bakery fresh daily: donuts (cinnamon caramel donuts reportedly featured on
  Buzzfeed), pies, fried pies, cinnamon rolls, cookies, breads
- **Smoker schedule Wed–Sat:** Wed smoked chicken halves, Thu pulled pork,
  Fri baby-back ribs (famously sell out), Sat jumbo smoked wings
- Bulk candies (cinnamon licorice — "only place in town"), baking supplies,
  jams, homemade pasta, large gluten-free section, Guggisberg Swiss
- **Catering:** weddings (brisket praised), graduations, corporate lunches (40+ served)
- Hours: Mon–Fri 7:00 AM–6:30 PM, Sat 7:30 AM–4:00 PM, Sun closed
- Marketing claim: "Voted Fort Wayne's #1 Deli" · 4.8–5.0 stars everywhere
- Community: Leo Rd corridor toward Leo-Cedarville/Grabill (Amish country)

## Site structure

Static multi-page site, no build step, deployed to GitHub Pages:

```
index.html        Home — hero, story, smoker schedule, highlights, reviews
menu.html         Sample deli menu (sandwiches, paninis, salads, BBQ, bakery)
catering.html     Catering — packages, occasions, inquiry form (demo)
about.html        The Nolt family story, Amish roots, values
visit.html        Hours, map, directions, contact
css/style.css     Single shared stylesheet
assets/           Gemini-generated imagery (see below)
tools/gen_image.mjs   Image generator (Node port of fluxandthread workflow)
```

## Design language

- **Warm country market with a deli-café feel.** Their real in-store sandwich
  menu has a red-and-white checkered border — that checkered gingham motif is
  the signature element (used as borders/accents, done in CSS).
- Palette: cream/wheat backgrounds, barn red primary, walnut brown text,
  forest green accent. Serif display headings (hand-crafted feel), humanist
  sans body.
- **Sandwiches & salads use REAL prices from the hanging in-store menu boards**
  (photos from Sarah, July 2026, Drive "Nolts" folder — these superseded the
  older printed menu's $4.99–6.99 prices): Specialty — Reuben/PA Hometown/
  Italian $8, Smoked Brisket Panini $9, BLT $7, Grilled Cheese $6. Build-your-
  own — Roast Beef $8, Turkey Bacon Club/Cajun Turkey/Off the Bone Ham $7,
  Veggie Wrap/Chicken Salad $6; sourdough +$2; side-salad upgrade +$1.50, cup
  of soup (seasonal) $3.99. Salads all $10. Boards also list breads/wraps/
  cheeses/toppings/sauces/dressings and 8 side salads — all on menu.html.
  Slogan from the salad board: "Adding value to your family… one bite at a
  time!" (script-tagline on menu page). Weekly smoker specials (Wed chicken
  half & Thu pulled pork $5.99, Fri ribs "call", Sat wings "prices vary")
  are from the older July 2026 printed menu — no newer data.
  Bakery/deli-case prices remain representative samples.
- **Catering page uses REAL prices** transcribed from Nolt's printed catering
  trifold (photos from Sarah, July 2026, in Google Drive "Nolts" folder):
  smoked meats ($8.99–22.99/lb, ribs $22/slab), warm & cold sides by the lb,
  deli/appetizer/slider/veggie/fruit/wrap trays, boxed lunches $12 (min 15).
  The old fictional per-person packages were removed.
- **Pamphlet branding pulled into the site** (per Sarah): `--stamp: #d94a3a`
  (the trifold's brighter red), `.stamp-h` chunky all-caps headings
  (Luckiest Guy) on catering menu sections, `.script-tagline` red Caveat
  script ("making your food dreams come true" — exact wording confirmed from
  the trifold's front panel, "catering front" photo in Drive; front panel
  also says a separate on-site catering menu exists for weddings/corporate/
  community events — mentioned in the catering page's helpful-note tip), and a
  `.blessed` band at the bottom of the homepage — **"Have a blessed day!"** —
  because that's how every visit to the store ends.
- **REAL logo in use** (`assets/logo-nolts.png`, from owner via Drive "Nolts"
  folder, July 2026): black plaque, red varsity letters, "EST 2012" /
  "FAMILY OWNED", wagon wheel. The original is on solid black; transparent
  variants were generated by un-compositing from black (alpha = maxCh/175,
  smooth edges — script pattern in scratchpad `logo-knockout.mjs`, pngjs):
  `logo-nolts-light.png` (white details recolored walnut, used in header on
  cream) and `logo-nolts-dark.png` (details cream, used in footer on walnut).
  Favicon (`assets/favicon.png`) keeps the black tile. Replaced the made-up
  checkered "N" monogram (CSS `.brand-mark` kept but unused).
- **Catering inquiry form is HIDDEN** (`#inquiry` has `display:none`,
  July 2026): owners haven't asked for web ordering. Code kept in place;
  catering CTAs point at `tel:` instead. Re-enable only if the Nolts want
  orders through a form.

## Image generation (Gemini "Nano Banana")

Ported from `C:\Users\flylo\Documents\fluxandthread` (Python) to Node because
this machine has Node 24 but no Python.

```bash
node tools/gen_image.mjs "prompt..." --out assets/hero.png --ar 16:9
node tools/gen_image.mjs "edit..." --ref assets/hero.png --out assets/hero-v2.png
```

- Key: `GEMINI_API_KEY` in `.env` (gitignored; copied from fluxandthread repo)
- Default model `gemini-3.1-flash-image-preview` (free ~500/day);
  `--pro` → `gemini-3-pro-image-preview` for precise text
- Each PNG gets a `.prompt.txt` sidecar recording model + prompt
- Style anchor: warm, appetizing, natural light, rustic wood/butcher-paper
  props, red-and-white checkered accents where it fits

## Deployment

- Public repo: `flylow3d/nolts-marketplace` on GitHub
- GitHub Pages serves from `main` branch root
- Live at: https://flylow3d.github.io/nolts-marketplace/
- All internal links are **relative** so the site works under the
  `/nolts-marketplace/` subpath

## Ground rules

- Only public info; nothing presented as official. Footer carries a
  "concept site" disclaimer until/unless the Nolts adopt it.
- `.env` never committed. Real phone/address/hours are public record and OK
  to display.
