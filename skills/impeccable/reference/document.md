Generate a `DESIGN.md` file at the project root that captures the approved intended system or the current implemented visual system, so humans and AI agents share one enforceable design contract.

DESIGN.md follows the [official DESIGN.md format spec](https://raw.githubusercontent.com/google-labs-code/design.md/main/docs/spec.md): optional YAML frontmatter carrying machine-readable design tokens, followed by a markdown body with eight canonical sections. **Tokens are normative; prose provides context for how to apply them.** Sections may be omitted when not relevant, but sections that are present follow the canonical order. Use the canonical names or the aliases explicitly accepted by the current spec. Unknown headings are preserved by official consumers, but keep project contracts on the canonical eight unless the user has a real extension need.

## The frontmatter: token schema

The YAML frontmatter is the machine-readable layer. It's what Stitch's linter validates and what the live panel renders tiles from. Keep it tight; every entry should correspond to a token the project actually uses.

```yaml
---
version: alpha
name: <project title>
description: <one-line tagline>
colors:
  primary: "#b8422e"
  neutral-bg: "#faf7f2"
  # ...one entry per extracted color; key = descriptive slug
typography:
  display:
    fontFamily: "Cormorant Garamond, Georgia, serif"
    fontSize: "clamp(2.5rem, 7vw, 4.5rem)"
    fontWeight: 300
    lineHeight: 1
    letterSpacing: "normal"
  body:
    # ...
rounded:
  sm: "4px"
  md: "8px"
spacing:
  sm: "8px"
  md: "16px"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.neutral-bg}"
    rounded: "{rounded.sm}"
    padding: "16px 48px"
  button-primary-hover:
    backgroundColor: "{colors.primary-deep}"
---
```

Rules that matter:

- **`version: alpha` is the DESIGN.md format version**, not a project semantic version or approval state. Keep project lifecycle metadata in the approved Reference Brief, Git history, or the sidecar.
- **Token refs** use `{path.to.token}` (e.g. `{colors.primary}`, `{rounded.md}`). Components may reference primitives; primitives may not reference each other.
- **Official DESIGN.md accepts valid CSS color strings** and recommends hex for broad tooling compatibility. Preserve the project's canonical value when the current official linter accepts it; never maintain competing token values in frontmatter and prose.
- **Component sub-tokens** are limited to 8 props: `backgroundColor`, `textColor`, `typography`, `rounded`, `padding`, `size`, `height`, `width`. Shadows, motion, focus rings, backdrop-filter: none of those fit. Carry them in the sidecar (Step 4b).
- **Scale keys are open-ended.** Use whatever names the project already uses (`oxblood-deep`, `surface-container-low`). Don't rename to Material defaults.
- **Variants are naming convention, not schema.** `button-primary` / `button-primary-hover` / `button-primary-active` as sibling keys.

## The markdown body: canonical sections

1. `## Overview`
2. `## Colors`
3. `## Typography`
4. `## Layout`
5. `## Elevation & Depth`
6. `## Shapes`
7. `## Components`
8. `## Do's and Don'ts`

Sections may be omitted when genuinely irrelevant; use frontmatter `omitted` with a reason when an omission would otherwise be ambiguous. Keep present sections in the order above. `Brand & Style`, `Layout & Spacing`, and `Elevation` are accepted aliases, but generate the canonical headings by default. Put motion and responsive rules in Layout, Elevation & Depth, Components, or the sidecar rather than inventing competing token groups.

## When to run

- The user just ran `$impeccable init` and needs the visual side documented.
- The skill noticed no `DESIGN.md` exists and nudged the user to create one.
- An existing `DESIGN.md` is stale (the design has drifted).
- Before a large redesign, to capture the current state as a reference.

If a `DESIGN.md` already exists, **do not silently overwrite it**. Show the user the existing file and STOP and use Codex's structured user-input/question tool when available; if unavailable, ask directly in chat to clarify what you cannot infer. whether to refresh, overwrite, or merge.

## Three input paths

- **Scan mode** (default): the project has design tokens, components, or rendered output. Extract, then confirm descriptive language. Use when there's code to analyze.
- **Approved-brief mode**: the project has a `REFERENCE-BRIEF.md` whose status is `user-approved`. Convert its de-branded decisions into the project contract before implementation.
- **Seed mode**: the project is pre-implementation (fresh init, nothing built yet). Interview for five high-level answers, write a minimal DESIGN.md marked `<!-- SEED -->`. Re-run in scan mode once there's code.

Check for an approved Reference Brief first, then scan the project. If the brief exists, use it as decision evidence and use code only to resolve actual tokens or verify feasibility. If no approved brief exists and the scan finds no tokens, no component files, and no rendered site, offer seed mode; don't silently switch. If the user explicitly requests seed mode, follow it conversationally; do not invent CLI flags or parameterized commands.

### Approved Reference Brief rules

- Expected location: `<project>/_analysis/design-research/<run-id>/REFERENCE-BRIEF.md`.
- Accept only `status: user-approved`. `draft`, `consumed`, and `superseded` are not fresh approval.
- Contract generation may read the approved brief and project code. It must not reopen raw external brand files named in `sources`.
- Map task constraints and adopted principles to Overview; material choices to Colors, Typography, Layout, Elevation & Depth, Shapes, and Components; rejected directions to Do's and Don'ts.
- Exact external brand colors, proprietary fonts, logos, copy, images, and unique component names are prohibited inputs. If they survived into the brief, stop and de-brand it before writing the contract.
- Any unresolved item marked `material` blocks contract generation. Ask for that decision instead of filling the gap.

## Scan mode (approach C: auto-extract, then confirm descriptive language)

### Step 1: Find the design assets

Search the codebase in priority order:

1. **Approved Reference Brief**: look under `_analysis/design-research/*/REFERENCE-BRIEF.md`. Use only a brief with `status: user-approved`; do not follow its source paths into raw external brand material.
2. **CSS custom properties**: grep for `--color-`, `--font-`, `--spacing-`, `--radius-`, `--shadow-`, `--ease-`, `--duration-` declarations in CSS files (usually `src/styles/`, `public/css/`, `app/globals.css`, etc.). Record name, value, and the file it's defined in.
3. **Tailwind config**: if `tailwind.config.{js,ts,mjs}` exists, read the `theme.extend` block for colors, fontFamily, spacing, borderRadius, boxShadow.
4. **CSS-in-JS theme files**: styled-components, emotion, vanilla-extract, stitches; look for `theme.ts`, `tokens.ts`, or equivalent.
5. **Design token files**: `tokens.json`, `design-tokens.json`, Style Dictionary output, W3C token community group format.
6. **Component library**: scan the main button, card, input, navigation, dialog components. Note their variant APIs and default styles.
7. **Global stylesheet**: the root CSS file usually has the base typography and color assignments.
8. **Visible rendered output**: if browser automation tools are available, load the live site and sample computed styles from key elements (body, h1, a, button, .card). This catches values that tokens miss.

### Step 2: Auto-extract what can be auto-extracted

Build a structured draft from the discovered tokens. For each token class:

- **Colors**: Group into Primary / Secondary / Tertiary / Neutral (the Material-derived roles Stitch uses). If the project only has one accent, express it as Primary + Neutral; omit Secondary and Tertiary rather than inventing them.
- **Typography**: Map observed sizes and weights to the Material hierarchy (display / headline / title / body / label). Note font-family stacks and the scale ratio.
- **Layout**: Capture grid/container strategy, spacing rhythm, breakpoints, density, and responsive behavior. The official spec has a Layout section.
- **Elevation & Depth**: Catalogue the shadow vocabulary. If the project is flat and uses tonal layering instead, that's a valid answer; state it explicitly.
- **Shapes**: Capture corner-radius scales, sharp/soft/pill roles, and shape consistency. Do not bury the rounded system inside Components.
- **Components**: For each common component (button, card, input, chip, list item, tooltip, nav), extract shape (radius), color assignment, hover/focus treatment, internal padding.

### Step 2b: Stage the frontmatter

From the auto-extracted tokens, draft the YAML frontmatter now (you'll write it at the top of DESIGN.md in Step 4). This is the machine-readable layer: what the live panel and Stitch's linter consume.

- **Colors**: one entry per extracted color. Key = descriptive slug (`oxblood-deep`, `editorial-magenta`, not `blue-800`). Value = whichever format the project treats as canonical (OKLCH or hex; see the frontmatter rules above). Don't split the source of truth: one format in the frontmatter, don't redefine the same token in prose with a different value.
- **Typography**: one entry per role (`display`, `headline`, `title`, `body`, `label`). Typography is an object; include only the props that are real for the project (`fontFamily`, `fontSize`, `fontWeight`, `lineHeight`, `letterSpacing`, `fontFeature`, `fontVariation`).
- **Rounded / Spacing**: whatever scale steps the project actually uses, keyed by whatever scale name the project uses (`sm` / `md` / `lg`, or `surface-sm`, or numeric steps).
- **Components**: one entry per variant (`button-primary`, `button-primary-hover`, `button-ghost`). Reference primitives via `{colors.X}`, `{rounded.Y}`. If a variant needs a property Stitch's 8-prop set doesn't cover (shadow, focus ring, backdrop-filter), carry the full snippet in the sidecar instead.

Skip anything the project doesn't have. Empty scale keys or fabricated tokens pollute the spec.

### Step 3: Ask the user for qualitative language

The following require creative input that cannot be auto-extracted. Group them into one `AskUserQuestion` interaction:

- **Creative North Star**: a single named metaphor for the whole system ("The Editorial Sanctuary", "The Golden State Curator", "The Lab Notebook"). Offer 2-3 options that honor PRODUCT.md's brand personality.
- **Overview voice**: mood adjectives, aesthetic philosophy in 2-3 sentences, anti-references (what the system should not feel like).
- **Color character** (for auto-extracted colors): descriptive names ("Deep Muted Teal-Navy", not "blue-800"). Suggest 2-3 options per key color based on hue/saturation.
- **Elevation philosophy**: flat/layered/lifted. If shadows exist, is their role ambient or structural?
- **Component philosophy**: the feel of buttons, cards, inputs in one phrase ("tactile and confident" vs. "refined and restrained").

Quote a line from PRODUCT.md when possible so the user sees their own strategic language carry forward.

In approved-brief mode, do not ask the user to reconfirm decisions already marked adopted. Ask only for material unresolved items or qualitative language that is absent and necessary to make the contract implementable.

### Step 4: Write DESIGN.md

The file opens with the YAML frontmatter staged in Step 2b (schema documented at the top of this reference), then the markdown body using the structure below. Headers must match character-for-character. Optional evocative subtitles (e.g. `## 2. Colors: The Coastal Palette`) are allowed.

```markdown
---
version: alpha
name: [Project Title]
description: [one-line tagline]
colors:
  # ... staged frontmatter from Step 2b
---

# Design System: [Project Title]

## 1. Overview

**Creative North Star: "[Named metaphor in quotes]"**

[2-3 paragraph holistic description: personality, density, aesthetic philosophy. Start from the North Star and work outward. State what this system explicitly rejects (pulled from PRODUCT.md's anti-references). End with a short **Key Characteristics:** bullet list.]

## 2. Colors

[Describe the palette character in one sentence.]

### Primary
- **[Descriptive Name]** (#HEX / oklch(...)): [Where and why this color is used. Be specific about context, not just role.]

### Secondary (optional; omit if the project has only one accent)
- **[Descriptive Name]** (#HEX): [Role.]

### Tertiary (optional)
- **[Descriptive Name]** (#HEX): [Role.]

### Neutral
- **[Descriptive Name]** (#HEX): [Text / background / border / divider role.]
- [...]

### Named Rules (optional, powerful)
**The [Rule Name] Rule.** [Short, forceful prohibition or doctrine, e.g. "The One Voice Rule. The primary accent is used on ≤10% of any given screen. Its rarity is the point."]

## 3. Typography

**Display Font:** [Family] (with [fallback])
**Body Font:** [Family] (with [fallback])
**Label/Mono Font:** [Family, if distinct]

**Character:** [1-2 sentence personality description of the pairing.]

### Hierarchy
- **Display** ([weight], [size/clamp], [line-height]): [Purpose; where it appears.]
- **Headline** ([weight], [size], [line-height]): [Purpose.]
- **Title** ([weight], [size], [line-height]): [Purpose.]
- **Body** ([weight], [size], [line-height]): [Purpose. Include max line length like 65–75ch if relevant.]
- **Label** ([weight], [size], [letter-spacing], [case if uppercase]): [Purpose.]

### Named Rules (optional)
**The [Rule Name] Rule.** [Short doctrine about type use.]

## 4. Layout

[Describe the grid or container model, spacing rhythm, density, breakpoints, and mobile collapse strategy. Use the frontmatter spacing tokens rather than inventing a second scale in prose.]

### Responsive Rules
- **[Rule name]:** [Exact behavior and breakpoint when the project has one.]

### Named Rules (optional)
**The [Rule Name] Rule.** [Short doctrine about layout, spacing, or responsive behavior.]

## 5. Elevation & Depth

[One paragraph: does this system use shadows, tonal layering, or a hybrid? If "no shadows", say so explicitly and describe how depth is conveyed instead.]

### Shadow Vocabulary (if applicable)
- **[Role name]** (`box-shadow: [exact value]`): [When to use it.]
- [...]

### Named Rules (optional)
**The [Rule Name] Rule.** [e.g. "The Flat-By-Default Rule. Surfaces are flat at rest. Shadows appear only as a response to state (hover, elevation, focus)."]

## 6. Shapes

[Describe the shape language and how rounded tokens map to containers, controls, pills, and exceptional cases.]

### Shape Roles
- **Containers:** [shape and exact radius token/value]
- **Controls:** [shape and exact radius token/value]
- **Pills / Tags:** [when full radius is allowed]

### Named Rules (optional)
**The [Rule Name] Rule.** [Short doctrine about shape consistency.]

## 7. Components

For each component, lead with a short character line, then specify shape, color assignment, states, and any distinctive behavior.

### Buttons
- **Shape:** [radius described, exact value in parens]
- **Primary:** [color assignment + padding, in semantic + exact terms]
- **Hover / Focus:** [transitions, treatments]
- **Secondary / Ghost / Tertiary (if applicable):** [brief description]

### Chips (if used)
- **Style:** [background, text color, border treatment]
- **State:** [selected / unselected, filter / action variants]

### Cards / Containers
- **Corner Style:** [radius]
- **Background:** [colors used]
- **Shadow Strategy:** [reference Elevation section]
- **Border:** [if any]
- **Internal Padding:** [scale]

### Inputs / Fields
- **Style:** [stroke, background, radius]
- **Focus:** [treatment, e.g. glow, border shift, etc.]
- **Error / Disabled:** [if applicable]

### Navigation
- **Style, typography, default/hover/active states, mobile treatment.**

### [Signature Component] (optional; if the project has a distinctive custom component worth documenting)
[Description.]

## 8. Do's and Don'ts

Concrete, forceful guardrails. Lead each with "Do" or "Don't". Be specific: include exact colors, pixel values, and named anti-patterns the user mentioned in PRODUCT.md. **Every anti-reference in PRODUCT.md should show up here as a "Don't" with the same language**, so the visual spec carries the strategic line through. Quote PRODUCT.md directly where possible: if PRODUCT.md says *"avoid dark mode with purple gradients, neon accents, glassmorphism"*, the Don'ts here should repeat that by name.

### Do:
- **Do** [specific prescription with exact values / named rule].
- **Do** [...]

### Don't:
- **Don't** [specific prohibition, e.g. "use border-left greater than 1px as a colored stripe"].
- **Don't** [...]
- **Don't** [...]
```

### Step 4b: Write .impeccable/design.json sidecar (extensions only)

The frontmatter owns token primitives (colors, typography, rounded, spacing, components). The sidecar at `.impeccable/design.json` carries **what Stitch's schema can't hold**: tonal ramps per color, shadow/elevation tokens, motion tokens, breakpoints, full component HTML/CSS snippets (the panel renders these into a shadow DOM), and narrative (north star, rules, do's/don'ts). It extends the frontmatter, it doesn't duplicate it.

Regenerate the sidecar whenever you regenerate root `DESIGN.md`. If the user only asks to refresh the sidecar (e.g., from the live panel's stale-hint), preserve `DESIGN.md` and write only `.impeccable/design.json`.

#### Schema

```json
{
  "schemaVersion": 2,
  "generatedAt": "ISO-8601 string",
  "title": "Design System: [Project Title]",
  "extensions": {
    "colorMeta": {
      "primary":        { "role": "primary",  "displayName": "Editorial Magenta", "canonical": "oklch(60% 0.25 350)", "tonalRamp": ["...", "...", "..."] },
      "cool-paper": { "role": "neutral",  "displayName": "Cool Paper",    "canonical": "oklch(96% 0.005 230)", "tonalRamp": ["...", "...", "..."] }
    },
    "typographyMeta": {
      "display": { "displayName": "Display", "purpose": "Hero headlines only." }
    },
    "shadows": [
      { "name": "ambient-low", "value": "0 4px 24px rgba(0,0,0,0.12)", "purpose": "Diffuse hover glow under accent elements." }
    ],
    "motion": [
      { "name": "ease-standard", "value": "cubic-bezier(0.4, 0, 0.2, 1)", "purpose": "Default easing for state transitions." }
    ],
    "breakpoints": [
      { "name": "sm", "value": "640px" }
    ]
  },
  "components": [
    {
      "name": "Primary Button",
      "kind": "button | input | nav | chip | card | custom",
      "refersTo": "button-primary",
      "description": "One-line what and when.",
      "html": "<button class=\"ds-btn-primary\">GET STARTED</button>",
      "css": ".ds-btn-primary { background: #191c1d; color: #fff; padding: 16px 48px; letter-spacing: 0.05em; text-transform: uppercase; font-weight: 500; border: none; border-radius: 0; transition: background 0.2s, transform 0.2s; } .ds-btn-primary:hover { background: oklch(60% 0.25 350); transform: translateY(-2px); }"
    }
  ],
  "narrative": {
    "northStar": "The Editorial Sanctuary",
    "overview": "2-3 paragraphs of the philosophy, pulled from DESIGN.md Overview section.",
    "keyCharacteristics": ["...", "..."],
    "rules": [{ "name": "The One Voice Rule", "body": "...", "section": "colors|typography|elevation" }],
    "dos":   ["Do use ..."],
    "donts": ["Don't use ..."]
  }
}
```

**What changed from schemaVersion 1.** The old sidecar carried token primitive arrays (`tokens.colors[]`, `tokens.typography[]`, etc.). Those values now live in the frontmatter. The sidecar only carries metadata that can't live in the frontmatter (tonal ramps, canonical OKLCH when the hex is an approximation, display names, role hints), keyed by the frontmatter token name (`colorMeta.<token-name>`, `typographyMeta.<token-name>`). Components still carry full HTML/CSS because Stitch's 8-prop set can't hold them.

#### Component translation rules

The `html` and `css` fields must be **self-contained, drop-in snippets** that render correctly when injected into a shadow DOM. The panel applies them directly: no post-processing, no framework runtime.

1. **Tailwind expansion.** If the source uses Tailwind (className="bg-primary text-white rounded-lg px-6 py-3"), expand every utility to literal CSS properties in the `css` string. Do **not** reference Tailwind classes; do **not** assume a Tailwind CSS bundle is loaded. Each component is self-contained.
2. **Token resolution.** If the project exposes tokens as CSS custom properties on `:root` (e.g. `--color-primary`, `--radius-md`), reference them via `var(--color-primary)`; they inherit through the shadow DOM and stay live-bound. If tokens live only in JS theme objects (styled-components, CSS-in-JS), resolve to literal values at generation time.
3. **Icons.** Inline as SVG. Do not reference Lucide/Heroicons packages, icon fonts, or `<img src="...">`. A typical icon is 16-24px; copy the SVG path data directly.
4. **States.** Include `:hover`, `:focus-visible`, and (if meaningful) `:active` rules inline. A static default-only snapshot makes the panel feel dead. Hover + focus rules in the CSS make it feel alive.
5. **Reset bloat.** Extract only the component's *distinctive* CSS (background, color, padding, border-radius, typography, transition). Skip universal resets (`box-sizing: border-box`, `line-height: inherit`, `-webkit-font-smoothing`). The panel already has a neutral canvas; don't re-ship resets.
6. **Scoped class names.** Prefix every class with `ds-` (e.g. `ds-btn-primary`, `ds-input-search`) so component CSS doesn't collide with other components' CSS in the same shadow DOM.

#### What to include

Aim for a tight set of **5-10 components** that best represent the visual system:

- **Canonical primitives (always include if the project has them):** button (each variant as a separate component entry), input/text field, navigation, chip/tag, card.
- **Signature components (include if distinctive):** hero CTA, featured card, filter pill, any custom pattern the user mentioned as important in PRODUCT.md.
- **Skip the rest.** Utility components, form building blocks, wrapper layouts: not worth documenting unless visually distinctive.

If the project has **no component library yet** (bare landing page, new project), synthesize canonical primitives from the tokens using best-practice defaults consistent with the DESIGN.md's rules. Every `.impeccable/design.json` has *something* to render, even on day zero.

#### Tonal ramps

For each color token, generate an 8-step `tonalRamp` array: dark to light, same hue and chroma, stepped lightness from ~15% to ~95%. The panel renders this as a strip under the swatch. If the project already defines a tonal scale (Material `surface-container-low` family, Tailwind-style `blue-50..blue-900`), use those values. Otherwise synthesize in OKLCH.

#### Narrative mapping

Pull directly from the DESIGN.md you just wrote:

- `narrative.northStar` → the `**Creative North Star: "..."**` line from Overview
- `narrative.overview` → the philosophy paragraphs from Overview
- `narrative.keyCharacteristics` → the bulleted `**Key Characteristics:**` list
- `narrative.rules` → every `**The [Name] Rule.** [body]` across all sections, tagged with `section`
- `narrative.dos` / `narrative.donts` → the bullet lists from Do's and Don'ts verbatim

Do not reword. The panel shows these as secondary collapsible context; the same voice that's in the Markdown carries through.

### Step 5: Confirm and refine

1. Run the official linter. On Windows use `npx.cmd --yes --package '@google/design.md' designmd lint <project-root>\DESIGN.md`; on other platforms use the equivalent `npx` invocation. Errors must be zero. Review warnings in context rather than forcing a meaningless zero-warning target.
2. If a prior contract existed, run the official `designmd diff <before> <after>` and summarize normative changes separately from narrative clarification.
3. Show the user the full DESIGN.md you wrote. Briefly highlight non-obvious creative choices and any reviewed warnings.
4. Mention that `.impeccable/design.json` was also written alongside when scan mode produced it.
5. Treat an exact user instruction as approval only for the exact requested normative change. Ask for confirmation when the value or consequence was ambiguous. A Git commit alone is not user approval.
6. After the contract is accepted, change the source Reference Brief from `user-approved` to `consumed`. Preserve it as research evidence; do not delete it.
7. Offer to refine any section: "Want me to revise a section, add component patterns I missed, or adjust the atmosphere language?"

For later changes:

- Narrative clarification: patch DESIGN.md and lint.
- Normative token or component change: change DESIGN.md first, lint and diff, obtain approval when needed, then change code.
- Breaking redesign: return to research and produce a new approved Reference Brief.
- Code drift: fix code to match DESIGN.md by default. If the contract is infeasible, pause implementation and amend the contract instead of silently treating code as truth.

Your own write is the freshest source; subsequent commands in this session don't need a reload.

## Seed mode

For projects with no visual system to extract yet. Produces a minimal scaffold, not a full spec.

### Step 1: Confirm seed mode

Before interviewing: "There's no existing visual system to scan. I'll ask five quick questions to seed a starter DESIGN.md. You can re-run `$impeccable document` once there's code, to capture the real tokens and components. OK?"

If the user prefers to skip, stop. No file.

### Step 2: Five questions

Group into one `AskUserQuestion` interaction. Options must be concrete.

1. **Color strategy.** Pick one:
   - Restrained: tinted neutrals + one accent ≤10%
   - Committed: one saturated color carries 30–60% of the surface
   - Full palette: 3–4 named color roles, each deliberate
   - Drenched: the surface IS the color
   
   Then: one hue family or anchor reference ("deep teal", "mustard", "Klim #ff4500 orange").

2. **Typography direction.** Pick one (specific fonts come later):
   - Serif display + sans body
   - Single sans (warm / technical / geometric / humanist; pick a feel)
   - Display + mono
   - Mono-forward
   - Editorial script + sans

3. **Motion energy.** Pick one:
   - Restrained: state changes only
   - Responsive: feedback + transitions, no choreography
   - Choreographed: orchestrated entrances, scroll-driven sequences

4. **Three named references.** Brands, products, printed objects. Not adjectives.

5. **One anti-reference.** What it should NOT feel like. Also named.

### Step 3: Write seed DESIGN.md

Use the canonical eight-section order from Scan mode. Populate only what the interview answers support; omit irrelevant sections honestly. The seed is a scaffold, not a fabricated spec.

Lead the file with:

```markdown
<!-- SEED: re-run $impeccable document once there's code to capture the actual tokens and components. -->
```

Per-section guidance in seed mode:

- **Overview**: Creative North Star and philosophy phrased from the answers (color strategy + motion energy + references). Reference the user's anti-reference directly.
- **Colors**: Color strategy as a Named Rule (e.g. *"The Drenched Rule. The surface IS the color."*). Hue family or anchor reference. No hex values; mark as `[to be resolved during implementation]`.
- **Typography**: the direction the user picked (e.g. "Serif display + sans body"). No font names yet: `[font pairing to be chosen at implementation]`.
- **Layout**: capture the intended density and broad responsive posture; do not invent breakpoints.
- **Elevation & Depth**: inferred from motion energy. Restrained/Responsive -> flat by default; Choreographed -> layered. One sentence.
- **Shapes**: state the intended sharp/soft/pill language only if answered; otherwise omit with a reason.
- **Components**: omit entirely; no components exist yet.
- **Do's and Don'ts**: carry PRODUCT.md's anti-references directly plus the anti-reference named in Q5.

Seed mode writes minimal frontmatter with `version: alpha`, `name`, `description`, and `omitted` entries for unsupported token groups or sections. Do not fabricate colors, typography, rounded, spacing, or components. Real tokens land on the next Scan-mode run. Skip the `.impeccable/design.json` sidecar in seed mode for the same reason: nothing to render.

### Step 4: Confirm

1. Show the seed DESIGN.md. Call out that it is a seed (the marker is the literal commitment).
2. Tell the user: "Re-run `$impeccable document` once you have some code. That pass will extract real tokens and generate the sidecar."

Your own write is the freshest source; no reload needed.

## Style guidelines

- **Frontmatter first, prose second.** Tokens go in the YAML frontmatter; prose contextualizes them. Don't redefine a token value in two places; the frontmatter is normative.
- **Cite PRODUCT.md anti-references by name** in the Do's and Don'ts section. If PRODUCT.md lists "SaaS landing-page clichés" or "generic AI tool marketing" as anti-references, the DESIGN.md Don'ts should repeat those phrases verbatim so the visual spec enforces the strategic line.
- **Use the canonical section model.** Prefer Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, and Do's and Don'ts in that order. Omit irrelevant sections honestly. Put motion and responsive guidance in Layout, Elevation & Depth, Components, or the sidecar.
- **Descriptive > technical**: "Gently curved edges (8px radius)" > "rounded-lg". Include the technical value in parens, lead with the description.
- **Functional > decorative**: for each token, explain WHERE and WHY it's used, not just WHAT it is.
- **Exact values in parens**: hex codes, px/rem values, font weights; always the number in parens alongside the description.
- **Use Named Rules**: `**The [Name] Rule.** [short doctrine]`. These are memorable, citable, and much stickier for AI consumers than bullet lists. Stitch's own outputs use them heavily ("The No-Line Rule", "The Ghost Border Fallback"). Aim for 1-3 per section.
- **Be forceful**. The voice of a design director. "Prohibited", "forbidden", "never", "always", not "consider", "might", "prefer". Match PRODUCT.md's tone.
- **Concrete anti-pattern tests**. Stitch writes things like *"If it looks like a 2014 app, the shadow is too dark and the blur is too small."* A one-sentence audit test beats a paragraph of principle.
- **Reference PRODUCT.md**. The anti-references section of PRODUCT.md should directly inform the Do's and Don'ts section here. Quote or paraphrase.
- **Group colors by role**, not by hex-order or hue-order. Primary / Secondary / Tertiary / Neutral is the spec ordering.

## Pitfalls

- Don't paste raw CSS class names. Translate to descriptive language.
- Don't extract every token. Stop at what's actually reused; one-offs pollute the system.
- Don't invent components that don't exist. If the project only has buttons and cards, only document those.
- Don't overwrite an existing DESIGN.md without asking.
- Don't duplicate content from PRODUCT.md. DESIGN.md is strictly visual.
- Don't invent a separate "Motion" or "Responsive Behavior" top-level section when the rule belongs in Layout, Elevation & Depth, Components, or the sidecar.
- Don't casually rename canonical sections. The official aliases are `Brand & Style`, `Layout & Spacing`, and `Elevation`; generate canonical names by default.
- Don't duplicate token values between frontmatter and prose. If a color is in `colors.primary` as hex, the prose can name it and describe its role but should not reassert a different hex. The frontmatter is normative.
- Don't invent frontmatter token groups outside the official schema (no `motion:`, `breakpoints:`, `shadows:` at the top level). Use `version`, `name`, `description`, `omitted`, `colors`, `typography`, `rounded`, `spacing`, and `components`; extensions belong in the sidecar.
