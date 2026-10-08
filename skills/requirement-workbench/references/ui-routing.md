# UI routing inside Requirement Workbench

Use this reference only after the current task requests a prototype, UI direction, DESIGN.md, frontend implementation, or frontend review.

## Available bundled roles

- `ui-ux-pro-max`: research styles, interaction patterns, palettes, typography, charts, stack guidance, and unresolved visual direction.
- `design-taste-frontend`: own persuasion, conversion, brand, campaign, editorial, portfolio, and marketing routes.
- `impeccable`: own task-completion product UI such as dashboards, workbenches, settings, forms, administration, onboarding, and data tools; also document an existing visual system and audit frontend code.
- `emil-design-eng`: a full read-only specialist for motion decisions, animation timing/easing, direct manipulation, transition continuity, perceived performance, and microinteractions after a prototype or frontend exists. It is not a second code owner.

The bundled skills are siblings of `requirement-workbench`. Read the selected skill's `SKILL.md` completely before using it:

- `../ui-ux-pro-max/SKILL.md`
- `../design-taste-frontend/SKILL.md`
- `../impeccable/SKILL.md`
- `../emil-design-eng/SKILL.md`

If a component cannot be read or its required runtime is unavailable, report only the degraded stage and continue any independent requirement/review work.

## Inspect before routing

Determine:

1. requested job: acceptance planning, prototype generation, visual research, DESIGN.md, implementation, review, or authorized correction;
2. available artifact: reviewed requirement, prototype, screenshot, external design reference, root DESIGN.md, or frontend code;
3. primary surface goal: persuade or help the user complete a task;
4. authority: advice/read-only or file changes;
5. current code owner, if code already exists.

Do not ask the user to choose a UI skill. If ownership is genuinely unclear and changes implementation, ask one question: is this route primarily meant to persuade the user or help the user complete a task?

## Routes

| Scene | Route | Output |
|---|---|---|
| Generate a prototype from requirements | Requirement review only if product behavior is materially incomplete; then Taste or Impeccable | Three to five acceptance checks when needed, followed by a working review prototype |
| Compare styles, patterns, palettes, typography, charts, or UX rules | UI/UX Pro Max | Evidence-backed direction options |
| External DESIGN.md or brand/site references | UI/UX Pro Max, then Impeccable `document` when a reusable project contract is needed | De-branded Reference Brief and project root DESIGN.md |
| Landing page, campaign, portfolio, brand, editorial, or conversion route | Taste | Taste owns design and implementation |
| Dashboard, admin, workbench, settings, form, data UI, onboarding, or task workflow | Impeccable | Impeccable owns design and implementation |
| Existing frontend needs accessibility, responsive, state, performance, UX-copy, or polish review | Impeccable | Verified findings or authorized fixes |
| Existing prototype/frontend has material animation, transition, hover/focus, drag, gesture, or microinteraction behavior | Current UI owner plus Emil review | Before/After/Why findings; current owner applies authorized fixes |
| Taste-owned route needs technical QA | Impeccable reviews read-only; Taste applies authorized fixes | Technical findings while ownership stays stable |
| Existing code needs its visual system recorded | Impeccable `document` | Root DESIGN.md extracted from verified implementation |

For mixed pages, choose one owner by the route's primary user goal. Never split one route between Taste and Impeccable.

Do not load Emil for static layouts or ordinary visual audits. When triggered, read `../emil-design-eng/SKILL.md` completely and preserve the selected code owner.

## Requirement to prototype

Do not create a separate prototype-generation contract.

If primary user, goal, main flow, important states, responsibility, and acceptance are clear, route directly to the UI owner. If a material gap would force the UI owner to invent behavior, produce only three to five acceptance checks that state the necessary page/state, user action, visible result, important exception, and source or unresolved decision.

An unsettled number can remain visibly `待确认` when it does not change the main flow. Pause only for a product boundary, accountable owner, source of truth, safety boundary, main flow, or implementation-owner decision.

When fidelity is not specified, create a working interactive prototype for review and state that it is not production evidence.

## Design direction and contract

Use UI/UX Pro Max only when direction is genuinely unresolved, design references must be compared, or a reusable project-wide direction is needed. Do not restart research for every local change.

When external brand references are supplied:

1. inspect product context and existing visual rules;
2. extract transferable principles and conflicts;
3. remove proprietary brand identifiers and unapproved assets;
4. create an evidence-backed Reference Brief;
5. ask only for a material direction decision that cannot be inferred;
6. after approval, use Impeccable `document` to create or update root DESIGN.md.

Implementation reads the approved root DESIGN.md and project code. It must not keep reopening raw brand references to chase resemblance.

## Existing code and review classification

Before changing code, classify every material finding:

1. `实现偏差`: code conflicts with an approved requirement or DESIGN.md; preserve the rule and fix code.
2. `设计系统变更`: proposed change affects reusable tokens, components, layout, or interaction; present evidence and impact, then ask product to confirm the contract change before code.
3. `功能或可用性缺陷`: a task, state, accessibility, responsive, permission, comprehension, or safety failure was demonstrated; handle according to edit authority.
4. `审美建议`: the UI works and the suggestion is a preference; keep it optional.

For each material finding state location/tested path, observed fact, observation method, exact basis, type, user impact, proposed action, and verification.

## Final cross-check

After prototype or code work, compare:

```text
original need
-> explicit user story
-> requirement rule and flow
-> prototype page/state/action
-> implemented behavior
-> acceptance evidence
```

Check normal, empty, loading, failure, no-permission, conflict, degraded, recovery, and return-context states in proportion to the risk. Separate what is visible, what was interactively tested, what works against simulated data, and what is proven in production.

Advice-only requests remain read-only. Building or fixing requires explicit authorization. Verify artifacts and runtime behavior rather than trusting a `Done` message.
