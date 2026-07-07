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
- Menu prices are **realistic samples** based on third-party listings — this
  is a demo; the owner supplies real prices later. (Owner's photographed
  in-store menu may replace them — check assets/ for menu photo.)

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
