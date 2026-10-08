---
name: ui-ux-pro-max
description: "UI/UX design intelligence for web and mobile. Searchable local database with 84 styles, 192 color palettes, 74 font pairings, 192 product types, 98 UX guidelines, 104 icon entries, 16 GSAP motion presets, and 25 chart types across 22 stacks (React, Next.js, Vue, Nuxt, Svelte, Astro, SwiftUI, React Native, Flutter, Tailwind, shadcn/ui, Jetpack Compose, Angular, Laravel, JavaFX, WPF, WinUI, Avalonia, Uno Platform, UWP, Three.js, and HTML/CSS). Use when designing, building, or reviewing UI: pages, components, color schemes, typography, layout, accessibility, animation, or data visualization."
license: MIT. See LICENSE.txt.
---

# UI/UX Pro Max - Design Intelligence

When loaded from Requirement Workbench, resolve `<ui-ux-pro-max-skill-dir>` to this skill's actual installed directory and keep the command working directory at the user's project. On Windows, prefer `python -X utf8`; on other platforms use an available Python 3 command.

Searchable database of UI/UX design rules with priority-based recommendations: 84 styles, 192 color palettes, 74 font pairings, 192 product types with reasoning rules, 98 UX guidelines, 104 icon entries, 16 GSAP motion presets, and 25 chart types across 22 technology stacks.

When this skill contributes to a user-visible artifact, read `../requirement-workbench/references/delivery-copy-filter.md` and apply its delivery-copy and traceless-change checks before final output and after every revision. Keep design reasoning in the companion response, not in product copy.

## Embedded direction-review mode

## When to Apply

Use this Skill when the task involves **UI structure, visual design decisions, interaction patterns, or user experience quality control**: designing new pages, creating/refactoring UI components, choosing color/typography/spacing/layout systems, reviewing UI for UX/accessibility/consistency, implementing navigation/animation/responsive behavior, or improving perceived quality and usability.

Skip it for pure backend logic, API/database design, non-visual performance work, infrastructure/DevOps, or non-visual scripts — unless the task changes how something **looks, feels, moves, or is interacted with**.

## Rule Categories by Priority

*Follow priority 1→10 to decide which category to focus on first; use `--domain <Domain>` to query full details. The full rule text for every category lives in `references/quick-reference.md` — read it on demand rather than loading it every time.*

| Priority | Category | Impact | Domain | Key Checks (Must Have) | Anti-Patterns (Avoid) |
|----------|----------|--------|--------|------------------------|------------------------|
| 1 | Accessibility | CRITICAL | `ux` | Contrast 4.5:1, Alt text, Keyboard nav, Aria-labels | Removing focus rings, Icon-only buttons without labels |
| 2 | Touch & Interaction | CRITICAL | `ux` | Min size 44×44px, 8px+ spacing, Loading feedback | Reliance on hover only, Instant state changes (0ms) |
| 3 | Performance | HIGH | `ux` | WebP/AVIF, Lazy loading, Reserve space (CLS &lt; 0.1) | Layout thrashing, Cumulative Layout Shift |
| 4 | Style Selection | HIGH | `style`, `product` | Match product type, Consistency, SVG icons (no emoji) | Mixing flat & skeuomorphic randomly, Emoji as icons |
| 5 | Layout & Responsive | HIGH | `ux` | Mobile-first breakpoints, Viewport meta, No horizontal scroll | Horizontal scroll, Fixed px container widths, Disable zoom |
| 6 | Typography & Color | MEDIUM | `typography`, `color` | Base 16px, Line-height 1.5, Semantic color tokens | Text &lt; 12px body, Gray-on-gray, Raw hex in components |
| 7 | Animation | MEDIUM | `ux`, `gsap` | Duration 150–300ms, Motion conveys meaning, Spatial continuity | Decorative-only animation, Animating width/height, No reduced-motion |
| 8 | Forms & Feedback | MEDIUM | `ux` | Visible labels, Error near field, Helper text, Progressive disclosure | Placeholder-only label, Errors only at top, Overwhelm upfront |
| 9 | Navigation Patterns | HIGH | `ux` | Predictable back, Bottom nav ≤5, Deep linking | Overloaded nav, Broken back behavior, No deep links |
| 10 | Charts & Data | LOW | `chart` | Legends, Tooltips, Accessible colors | Relying on color alone to convey meaning |

For the full rule list per category (all ~98 UX guidelines with rationale), read `references/quick-reference.md`. For app-specific polish rules (icons, touch feedback, dark mode contrast, safe areas) and the canonical pre-delivery checklist, read `references/pro-rules.md`.

---

## Running the search tool

The search script lives inside this skill's own directory, not the project directory. Resolve the loaded skill directory and invoke the script by its full path; do not assume a particular working directory:

```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "<query>" --domain <domain>
```

If `python` is not found, try `python3`, then `py -3`. Requires Python 3.x, no external dependencies (see README for install instructions if Python is missing).

## Workflow

### Step 1: Analyze User Requirements

Extract from the user request:
- **Product type**: SaaS, e-commerce, portfolio, dashboard, entertainment, tool, productivity, or hybrid
- **Target audience & context**: age group, usage context (commute, leisure, work)
- **Style keywords**: playful, vibrant, minimal, dark mode, content-first, immersive, etc.
- **Stack**: detect from the project — check `package.json` deps (react/next/vue/svelte/nuxt/@angular), `pubspec.yaml` (Flutter), `*.xcodeproj`/`Package.swift` (SwiftUI), `composer.json` (Laravel), or React Native markers (`app.json` + `react-native` dep). If nothing is detectable, ask the user or default to `html-tailwind`. **Never assume a stack** — a hardcoded default silently misroutes every recommendation.

### Step 2: Generate Design System (REQUIRED for new pages/projects)

Always start with `--design-system` to get comprehensive recommendations with reasoning:

```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "<product_type> <industry> <keywords>" --design-system [-p "Project Name"]
```

This searches product/style/color/landing/typography domains in parallel, applies reasoning rules from `ui-reasoning.csv`, and returns pattern, style, colors, typography, effects, and anti-patterns to avoid.

**Example:**
```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "beauty spa wellness service" --design-system -p "Serenity Spa"
```

### Step 2b: Persist Research Output (Master + Overrides Pattern)

To save the design system for retrieval across sessions, add `--persist` **and always pass `--output-dir` pointed at the project root** — without it, files are written relative to whatever directory the tool happens to run from:

```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "<query>" --design-system --persist -p "Project Name" --output-dir "<project-root>"
```

This creates:
- `design-system/<project-slug>/MASTER.md` — this skill's research master: recommendations, alternatives, and page overrides
- `design-system/<project-slug>/pages/` — Folder for page-specific overrides

`MASTER.md` is not the cross-skill project contract. When the project has a root `DESIGN.md`, that file is the normative source of truth and wins every conflict. Treat `MASTER.md` as research evidence used to prepare or revise that contract. Never let implementation alternate between both files as competing authorities.

With a page-specific override, add `--page "dashboard"` to also create `design-system/<project-slug>/pages/dashboard.md`.

If `design-system/<project-slug>/MASTER.md` already exists, `--persist` **skips writing and leaves it untouched** unless you also pass `--force` — check whether it exists first (and read it) before regenerating, so you don't silently discard prior decisions the user or a teammate made.

**Retrieval when building a specific page:**
1. Read `design-system/<project-slug>/MASTER.md`
2. Check if `design-system/<project-slug>/pages/<page-name>.md` exists — if so, its rules override Master
3. Otherwise use Master rules exclusively

The retrieval order above applies only while researching within this skill. During implementation, read the approved root `DESIGN.md` instead.

### Step 2c: Design Dials (optional)

Three optional 1-10 sliders that tune `--design-system` output without changing your query. Add any combination of them to the same command:

```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "<query>" --design-system --variance <1-10> --motion <1-10> --density <1-10>
```

| Dial | Low (1-3) | Mid (4-7) | High (8-10) |
|------|-----------|-----------|-------------|
| `--variance` | Centered / minimal (biases toward Minimalism-style categories) | Balanced / modern | Bold / asymmetric (biases toward Brutalism, Bento Grids) |
| `--motion` | Subtle micro-interactions | Standard scroll/stagger motion | Complex choreography (pin, Flip, SplitText) |
| `--density` | Spacious (24-96px spacing scale) | Standard (16-64px, current default) | Dense/dashboard (8-32px spacing scale) |

- `--motion` attaches a ready-to-use GSAP snippet (with framework notes, Do/Don't, and performance notes) pulled from `--domain gsap`, matched to the resolved tier (Subtle/Standard/Complex).
- `--density` overrides the `--space-*` CSS variable table in the ASCII/markdown/MASTER.md output — use it for dashboards (high) vs. marketing pages (low) without hand-editing tokens.
- Leaving a dial unset keeps that part of the output exactly as it was before (no behavior change).

### Step 2d: Hand research to the project contract

Use this step when UI/UX Pro Max is combined with external brand `DESIGN.md` samples, Impeccable, or Taste.

1. Keep raw brand files in the research phase only. Record their path or URL, capture date, scope, evidence level, and license note. Missing provenance stays `unknown`; do not guess.
2. Select references by a specific design question. Do not blend every available brand into one direction.
3. Write `<project>/_analysis/design-research/<run-id>/REFERENCE-BRIEF.md` using `references/reference-brief.md`.
4. Separate facts, inferences, adopted decisions, rejected directions, and unresolved decisions. A material unresolved decision blocks contract generation.
5. De-brand adopted principles. Do not carry exact external palettes, proprietary font names, logos, copy, images, or unique component names into the approved brief.
6. Move the brief through `draft` -> `user-approved` -> `consumed` -> `superseded`. Only `user-approved` briefs may seed a root `DESIGN.md`.
7. After approval, hand the brief to the contract author. Do not write production UI from the raw brand files or from `MASTER.md`.

**Example:**
```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "internal analytics dashboard" --design-system --variance 8 --motion 7 --density 8 -p "Ops Console"
```

### Step 3: Supplement with Detailed Searches (as needed)

```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "<keyword>" --domain <domain> [-n <max_results>]
```

| Need | Domain | Example |
|------|--------|---------|
| Product type patterns | `product` | `--domain product "entertainment social"` |
| More style options | `style` | `--domain style "glassmorphism dark"` |
| Color palettes | `color` | `--domain color "entertainment vibrant"` |
| Font pairings | `typography` | `--domain typography "playful modern"` |
| Individual Google Fonts | `google-fonts` | `--domain google-fonts "sans serif popular variable"` |
| Chart recommendations | `chart` | `--domain chart "real-time dashboard"` |
| UX best practices | `ux` | `--domain ux "animation accessibility"` |
| Landing page structure | `landing` | `--domain landing "hero social-proof"` |
| Icon recommendations | `icons` | `--domain icons "navigation outline"` |
| GSAP animation presets | `gsap` | `--domain gsap "scroll reveal stagger"` |
| React/Next.js performance | `react` | `--domain react "rerender memo list"` |
| App/native interface guidelines | `web` | `--domain web "accessibilityLabel touch safe-areas"` |

Domain is auto-detected from the query if `--domain` is omitted — but auto-detection can misroute overlapping terms (e.g. "font" matches both `typography` and `google-fonts`). If results look off-topic, pass `--domain` explicitly.

### Step 4: Stack Guidelines

```bash
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "<keyword>" --stack <stack>
```

**Available stacks:** `react`, `nextjs`, `vue`, `svelte`, `astro`, `nuxtjs`, `nuxt-ui`, `angular`, `laravel`, `swiftui`, `react-native`, `flutter`, `jetpack-compose`, `html-tailwind`, `shadcn`, `threejs`, `javafx`, `wpf`, `winui`, `avalonia`, `uno`, `uwp`. Use the stack detected in Step 1.

---

## If a search returns 0 results

Do not fabricate output. Instead:
1. Retry once with broader or differently-worded keywords (try product + style separately rather than combined).
2. If still empty, fall back to the priority table above and say explicitly to the user that this recommendation came from the built-in defaults, not a database match (e.g. "no palette match for X, using general SaaS defaults").
3. Never present a 0-result search as if it returned data.

## Example Workflow

**User request:** "Make an AI search homepage." (stack detected as Next.js from `package.json`)

```bash
# Step 2: design system
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "AI search tool modern minimal" --design-system -p "AI Search"

# Step 3: supplement
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "search loading animation" --domain ux

# Step 4: stack guidelines
python "<ui-ux-pro-max-skill-dir>/scripts/search.py" "suspense streaming bundle" --stack nextjs
```

Then synthesize the design system + detailed searches and implement.

## Output Formats

`--design-system` supports `-f ascii` (default, terminal display), `-f markdown` (documentation), and `--json` (machine-readable, includes the raw design system dict plus persistence status).

## Tips for Better Results

- Use **multi-dimensional keywords** — combine product + industry + tone + density: `"entertainment social vibrant content-dense"`, not just `"app"`
- Try different phrasings for the same need: `"playful neon"` → `"vibrant dark"` → `"content-first minimal"`
- Use `--design-system` first for full recommendations, then `--domain` to deep-dive any dimension you're unsure about
- Pass the detected stack explicitly for implementation-specific guidance

| Problem | What to Do |
|---------|------------|
| Can't decide on style/color | Re-run `--design-system` with different keywords |
| Dark mode contrast issues | `references/quick-reference.md` §6: `color-dark-mode` + `color-accessible-pairs` |
| Animations feel unnatural | `references/quick-reference.md` §7: `spring-physics` + `easing` + `exit-faster-than-enter` |
| Form UX is poor | `references/quick-reference.md` §8: `inline-validation` + `error-clarity` + `focus-management` |
| Navigation feels confusing | `references/quick-reference.md` §9: `nav-hierarchy` + `bottom-nav-limit` + `back-behavior` |
| Layout breaks on small screens | `references/quick-reference.md` §5: `mobile-first` + `breakpoint-consistency` |
| Performance / jank | `references/quick-reference.md` §3: `virtualize-lists` + `main-thread-budget` + `debounce-throttle` |

## Before Delivering App UI

Read `references/pro-rules.md` and run through its canonical Pre-Delivery Checklist. It covers icon/visual-element discipline, interaction feedback, light/dark contrast, safe-area layout, and accessibility — scoped to native/mobile app UI (iOS/Android/React Native/Flutter).

