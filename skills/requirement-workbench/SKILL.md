---
name: requirement-workbench
description: Automatically handle the end-to-end product requirement and UI delivery workflow from a vague idea, meeting note, defect, change request, existing PRD, prototype, DESIGN.md reference, or frontend project through evidence review, one-question-at-a-time clarification, user stories, requirements, detailed engineering/test specifications, acceptance, submission review, authorized revision, prototype routing, design direction, implementation review, and final requirement-prototype-code recheck. Use whenever the user asks to clarify, write, complete, modify, review, prototype, design, implement, or verify a product requirement or related UI, including `帮我梳理需求`, `把需求改完整`, `整理成开发测试能直接用的文档`, `审一下这个PRD`, `根据需求生成原型`, `参考这些DESIGN.md`, `这个页面设计不对`, and `按审核意见修改`. The user never needs to name this skill, choose a sub-skill, or know the term SRS.
license: See references/licenses/THIRD_PARTY_LICENSES.md and bundled component license files
metadata:
  category: product-delivery
  version: "2.3.0"
  tags: requirements, PRD, SRS, review, prototype, UI, diagrams, interaction, acceptance
---

# Requirement Workbench

## Purpose

Give engineers, implementation staff, presales staff, product managers, and UI/frontend contributors one natural-language entrance from raw demand to a reviewed requirement and, when requested, a verified prototype or frontend revision.

Do the work. Do not show a skill menu, ask the user to choose a mode, or require them to learn the internal workflow.

```text
raw request or existing material
-> evidence and current capability
-> focused clarification when a core decision is missing
-> user stories and requirement
-> detailed functional specification when handoff requires it
-> acceptance and submission review
-> delivery diagrams when relationships are clearer visually
-> prototype/design route when requested
-> implementation or frontend audit when requested
-> requirement - prototype - code - acceptance recheck
-> authorized revision and recheck
```

## Route By Outcome

Use the smallest route that completes the user's requested outcome. Do not run every stage by default.

| Current situation | Automatic route |
|---|---|
| Vague idea, customer sentence, issue, meeting note, or partial draft | Clarify only material blockers, then produce the smallest useful requirement |
| Existing notes or PRD need organizing or rewriting | Evidence-bounded user stories and requirement draft |
| Engineering and test need to implement directly | Detailed functional specification with fields, states, rules, flows, exceptions, interfaces, traceability, and acceptance |
| User asks whether a PRD or prototype can be submitted | Deep product self-review, correction advice, evidence tasks, owner decisions, and readiness |
| User asks to revise after review | Modify only authorized artifacts in a working copy, then recheck |
| User asks what a prototype should contain | Define three to five material prototype acceptance checks when needed, then select the UI owner |
| User asks to create a prototype or page | Route by surface goal: persuasion/brand or task completion/product UI |
| User supplies external DESIGN.md files or visual references | Research and de-brand reusable principles; propose the project's own design direction |
| A complex flow, state lifecycle, responsibility handoff, system relationship, timeline, or data relationship is clearer visually | Preserve the textual requirement, then create a purpose-fit delivery diagram |
| Existing frontend code needs review or improvement | Product-correctness check plus technical UI audit; preserve one code owner |
| User asks whether the final result still matches the requirement | Recheck source need, PRD, prototype, DESIGN.md, code behavior, and acceptance evidence |

For requirement writing or revision, read `@references/modules/requirement-building/SKILL.md` completely and follow its routed references. For submission readiness, deep audit, or high-impact cross-system/version/safety risk, also read `@references/modules/submission-review/SKILL.md` completely.

When prototype, DESIGN.md, visual direction, UI implementation, or frontend audit is requested, read `@references/ui-routing.md` completely before selecting a bundled UI skill.

When a visual relationship would materially improve handoff or the user asks for a diagram, read `@references/delivery-diagrams.md` completely before selecting the bundled `diagram-design` skill. Do not draw a diagram merely because a document has several sections.

## Start From Evidence

1. Inspect only the files, notes, current product material, code, APIs, and prototypes placed in scope.
2. Separate `材料明确`, `实际验证`, `业务推导`, and `材料缺失`.
3. Record current capability as `keep / change / add / retire / unknown`. No accessible evidence means `现有能力未核实`, not `系统没有`.
4. Preserve `source -> original need -> user story -> requirement/rule -> prototype state -> code behavior -> acceptance -> finding -> revision`.
5. Never invent users, value, frequency, responsibility, boundaries, authoritative sources, targets, deadlines, integrations, compatibility, or acceptance results.

## Clarify Without Turning The User Into The Process Owner

Ask only when the answer changes the product boundary, primary user, accountable owner, authoritative data, safety boundary, main flow, or UI implementation owner.

When a blocking decision is missing:

1. State the current understanding in one or two lines.
2. Ask exactly one highest-parent question.
3. Give a recommended answer with its basis and uncertainty.
4. Explain what it protects and what changes under another answer.
5. Continue every branch that does not depend on the answer.

Record lower-level gaps as `待确认` with the person or evidence source that can resolve them. Never send a questionnaire.

## Separate Decision Authority

Keep these three queues distinct:

- `使用者可处理`: wording, document organization, supported clarification, and changes already within the user's stated authority.
- `仍需查证`: current interfaces, existing code behavior, deployed versions, data quality, standards, and other facts that can be verified.
- `需有权负责人确认`: product boundary, accountable responsibility, source of truth, safety boundary, promised compatibility, release scope, and business completion rules.

In conversation with the current user, ask one question at a time. When the product manager must ask a superior or another accountable owner, generate one dependency-ordered decision package instead of forcing that person through a serial interview. Each decision must include context, viable options, the product manager's recommendation, evidence, impact, uncertainty, decider, and deadline only when a real deadline exists.

A product manager may self-review and recommend; the skill must never record owner approval, rejection, release authorization, or a pending choice as settled.

## Trigger Deep Business Checks Only When Relevant

If a workflow crosses roles, products, systems, tenants, deployments, devices, or versions, automatically examine:

- authoritative source, write direction, allowed editor, and business completion definition;
- effects of create, rename, move, disable, delete, restore, and rule changes;
- upstream/downstream propagation, loop prevention, duplicate or late delivery, partial success, retry, rollback, reconciliation, and user-visible status;
- current/current, current/old, old/current, mixed upgrade, offline reconnect, rollback, and third-party combinations;
- distinction among request received, accepted, executed, evidence qualified, business concluded, and downstream work closed.

Translate engineering terms into observable product behavior the first time they appear. Do not load monitoring-platform terminology for an ordinary standalone requirement.

## Automatic Focus Presentation

The user does not need to say `i-have-adhd`.

Read `@references/modules/focus-mode.md` and apply it as a presentation layer when the user asks for step-by-step or one-question-at-a-time work, says the information is too much or hard to track, asks for only the next action, or enters a multi-round clarification where one visible decision at a time reduces confusion.

Never diagnose the user. Implicit activation lasts for the current workflow only. It changes the chat shape, not the artifact: formal requirements, decisions, evidence, findings, traceability, and acceptance remain complete.

## Protect Existing Work

Before modifying an existing project, requirement package, prototype, DESIGN.md, or frontend:

1. Resolve the exact source path.
2. Preserve a recoverable baseline and verify important files or entrypoints.
3. Create a separate working directory.
4. Modify and validate only the working copy.
5. Keep the source untouched until the user explicitly asks to replace or merge it.

A new standalone document may be created in a new task directory without copying an unrelated repository. Read-only review never authorizes edits.

## Build And Review Requirements

- Infer document depth from the handoff outcome. Ordinary clarification gets a small honest draft; engineering/test handoff automatically gets detailed specification without asking whether the user wants SRS.
- Write explicit user stories before pages. Each core story must trace to scope, rules, normal and exception flows, responsibility, and business-outcome acceptance.
- Model only enough objects, states, permissions, data authority, inheritance, conflict, fallback, and integration behavior to prevent contradictory implementation.
- Make acceptance observable. Never treat a visible button, HTTP success, queued job, or notification delivery as proof of business completion.
- Run a quick self-review after creating or revising a requirement. Use the deep review module only for submission readiness, full audit, or triggered material risk.
- Review is read-only unless the user explicitly asks to change named artifacts. After revision, re-run traceability, continuity, contradiction, acceptance, integration/version/safety, and multi-role readability checks.

Use readiness wording that tells the product manager what happens next. Keep at least these distinct: ready for the stated handoff; complete missing evidence/details then submit; fix material defects and recheck before submission; restructure when the current requirement model cannot support the goal. A local critical defect does not automatically mean the whole requirement needs restructuring.

## Multi-role Readability

The final or revised PRD must allow each relevant reader to recover what they need without the author translating it verbally:

- frontline user: what happened, what it affects, what to do next, and who is responsible;
- product manager: current problem, scope, rules, gaps, risks, and next decision;
- engineering and test: objects, states, permissions, flows, exceptions, interfaces, observable outcomes, and acceptance evidence;
- zero-background leader: within 30 seconds, what this is, who is affected, what changes, the main risk or unknown, and what decision is requested.

Keep technical terms needed for handoff, but explain their business behavior on first use. Do not simplify away facts, numbers, responsibility, evidence status, or uncertainty.

## UI And DESIGN.md Boundary

Requirements remain the authority for product behavior. A prototype may expose unresolved values as `待确认`, but it must not silently decide business rules.

If a root `DESIGN.md` exists, treat it as the visual implementation contract. External brand/site DESIGN.md files and screenshots are research evidence, not authority. Adopt compatible principles without copying proprietary logos, copy, images, unique component names, exact palettes, or licensed fonts without permission.

When a design suggestion conflicts with the current `DESIGN.md`, distinguish:

- code drift: keep the approved design rule and fix the code;
- design-system change: explain evidence, affected surfaces, and trade-offs, then ask product whether to change DESIGN.md; update it before code after confirmation;
- functional/usability defect: fix or report according to the user's authority;
- aesthetic preference: label optional and let product decide.

One route has one code owner. Do not let multiple UI skills edit the same route concurrently.

## Delivery Artifact Boundary

A diagram explains an already supported relationship; it does not become a second source of product truth. Keep the requirement text, rules, exceptions, acceptance, evidence status, and unresolved owner decisions authoritative.

Use a standalone visual only when it reduces a real reading failure: hidden handoffs, ambiguous states, difficult sequencing, unclear ownership, excessive cross-system explanation, or an audience that needs an overview before detail. Route through `@references/delivery-diagrams.md`; include the artifact copy, source scope, assumptions, and unresolved items alongside the visual.

For an existing interactive prototype or frontend, use the bundled sibling `../emil-design-eng/SKILL.md` only when motion, direct manipulation, transition continuity, hover/focus response, or microinteraction quality is material. Read it completely before review. Emil is a read-only specialist by default; the selected UI code owner applies any authorized changes.

## Completion Standard

Before delivering any user-visible interface, prototype, PDF, PPT, report, screenshot, diagram, or exported file, read `@references/delivery-copy-filter.md` completely and run both its pre-output and final scans. Apply the same filter after every authorized revision. This is mandatory even when a bundled UI or diagram specialist produced the artifact.

The requested workflow is complete only when:

- the requested requirement, review, prototype, design, implementation, or recheck artifact exists at the requested depth;
- files changed are listed with source and working-copy paths;
- applicable document, structural, runtime, visual, interaction, and acceptance checks were actually performed;
- unresolved facts and owner decisions remain explicit;
- the original source is confirmed untouched unless replacement or merge was authorized; and
- one real next action is named when work remains.

Do not call copying, drafting, rendering, a passing command, or a visual screenshot alone completion.
