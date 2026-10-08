# PRD And Prototype Review Rubric

## Classify Finding Nature Before Review Category

Use one nature first:

| Nature | Meaning |
|---|---|
| Product defect | The requirement, business flow, role, object, state, permission, data result, or acceptance path is wrong or incomplete. |
| Design-contract conflict | The artifact conflicts with an approved root `DESIGN.md`. |
| UI quality problem | A demonstrated usability, accessibility, responsive, interaction, or readable-state failure exists, or an exact applicable criterion is violated. |
| UI improvement suggestion | A UI skill's general practice, research option, anti-pattern warning, or taste preference could improve quality but has no mandatory project authority. |
| Evidence gap | The supplied evidence cannot support a material conclusion. |
| Owner decision | An authorized choice is genuinely required and exceeds the current PM's authority. |

Then place it in the release-oriented category below. Nature explains what the finding is; category explains how it affects the current review target.

## Classify The Finding Before Assigning Severity

Place every finding in one category:

| Category | Meaning |
|---|---|
| Current-release defect | A target-release requirement, flow, data result, permission, or acceptance path is wrong or incomplete. |
| Historical evidence gap | Earlier-version source material is absent or insufficient; this limits historical conclusions but does not automatically block the current release. |
| Conditional risk | Severity depends on an unverified implementation fact, such as server authorization or external-system mapping. |
| Pre-release verification | The design is plausible but requires integration, performance, compatibility, security, or acceptance evidence before release. |
| Owner scope decision | Materials conflict or include an unapproved capability; the owner must decide the official boundary. |

Do not convert a historical evidence gap or conditional risk into a confirmed current-release P0 without evidence.

## Severity

| Severity | Meaning | Typical action |
|---|---|---|
| P0 | Blocks submission approval or release because a current core story cannot be completed, produces materially wrong results, violates a safety/compliance boundary, or exposes an actual critical permission/data risk. | Do not recommend submission; repair or redesign and review again. |
| P1 | Important current-release gap that creates implementation ambiguity, delivery rework, acceptance risk, material usability failure, or an unclosed integration/security concern. | Fix before development commitment or release, depending on stage. |
| P2 | Improves clarity, consistency, usability, maintainability, or documentation quality without blocking the core outcome. | Fix when practical or add to backlog. |

Use `条件性P0` only when a specific unverified fact would become P0 if true. State the condition and the evidence required to resolve it.

For UI findings:

- A UI specialist's severity is advisory; re-grade it here.
- A design-contract conflict is P0/P1/P2 according to demonstrated impact, not automatically because the contract was violated.
- A general UI practice, anti-slop rule, design option, or taste preference is normally P2 or an ungraded suggestion. It cannot independently create P0/P1.
- An accessibility or other external-standard finding becomes mandatory only after the exact criterion and its applicability are verified. Not every standards violation is P0.
- A static screenshot or source observation cannot prove interactive failure, production performance, server authorization, integration, or release readiness.
- When code complies with `DESIGN.md` and the reviewer only prefers another design, keep the item ungraded or P2 and optional. Ask product whether to modify `DESIGN.md` only if adopting the proposal changes a reusable project-wide rule. An authorized local adjustment may proceed when it does not redefine the reusable system.

## P0 Veto Rules

Mark a finding P0 when it applies to the current review target and at least one is true:

- A core user story cannot complete its main success flow.
- The delivered feature can be exercised, but the original core user blocker remains unresolved and the acceptance criteria do not test the intended business outcome.
- The system shows materially wrong data that can mislead an operational or management decision.
- The core role or responsibility model is wrong or absent such that the product cannot be implemented coherently.
- A high-risk normal flow lacks mandatory approval, permit, guardian, double-person confirmation, safety measure, or field confirmation.
- Incompatible responsibilities are combined in a way that creates unsafe authority or destroys accountability.
- A real authorization bypass, sensitive-data exposure, unsafe command path, or audit-integrity failure is demonstrated.
- A high-risk flow claims completion, safety, stopping, approval, or recovery without the mandatory authoritative acknowledgement or evidence.
- Acceptance criteria for a core outcome are impossible to test.
- Domain reality evidence shows the proposed flow cannot legally, safely, or practically be executed.

Do not automatically mark P0 merely because:

- A historical version has no PRD or explicit role.
- A design-stage external contract is incomplete but the product boundary is sound and no unsafe behavior is demonstrated.
- A prototype uses static data while clearly serving as a design artifact.
- A low-risk exception state is not interactively mocked.
- A risk depends on a server-side or production fact that has not been inspected.

Do not infer a core workflow, sole entry point, operational permission, or safety consequence merely from a visible status label or button. Name the missing source needed to establish that context before raising severity.

## Review Dimensions

### Business Goal And Boundary

- Identify the user or management pain and expected business outcome.
- Distinguish proven field-work reconstruction from an unvalidated product idea.
- State what is explicitly in and out of scope.
- Detect scope added by the prototype but absent from the PRD.
- For upgrades, map existing capability to keep/change/add/retire and detect duplicate systems, duplicate authoritative data, or shadow workflows.
- Trace real pain, repeated scenario, current-solution insufficiency, supported decision/action, and reusable value before calling a polished proposal a real product demand.
- Trace each material original need through its story, rule, end-to-end flow, product surface or contract, and business-outcome acceptance. Detect when a requested solution replaces or obscures the underlying need.

### Role, Responsibility, And Page

- Identify who uses each page and their real work pattern.
- State what the role needs to see, why, and what decisions follow.
- Define allowed and forbidden actions.
- Detect duplicate pages, mixed responsibilities, or broken responsibility handoffs.
- Separate requester, configurer, approver, dispatcher, assignee, acceptor, actual executor, accountable owner, handover receiver, and escalation owner when they differ.
- Verify material actions bind to authenticated actors/devices and cannot silently impersonate another role.

### Terminology, Object, And Action Consistency

- Build the core object tree and ensure every state and action belongs to one object.
- Map PRD terms, user stories, UI labels, code fields/enums, authoritative source, and ownership.
- Detect one concept with multiple names and one name used for different concepts.
- Test inheritance, override, constraint, fallback, and mixed combinations; do not pass a flow by removing required scope.
- Verify each button changes the object implied by its label.

### User Story

Each current-release core story should cover:

- Role, trigger, goal, and business value.
- Preconditions and authoritative data objects.
- Main success flow and meaningful exception branches.
- Permissions, masking, audit, and forbidden actions.
- Testable acceptance criteria.
- Traceability to the source problem and to the end-to-end business outcome, not only feature presence or interface success.

For historical stories, grade the completeness of evidence separately from the current release.

### Prototype

- Verify entry points and navigation.
- Check default, loading, empty, error, risk, no-permission, and success states proportionately.
- Distinguish visible controls, simulated feedback, and working state changes.
- Compare all views that claim to show the same data.
- Test return context, filter combinations, no-result behavior, and boundary values for core flows.
- Separate design coverage from production implementation.
- Inspect user-facing wording, dynamic text, empty/error states, dialogs, Toasts, accessibility labels, and hidden demo/test controls.
- Remove or relocate architecture narration, review rationale, implementation notes, future promises, mock instructions, and test controls that do not help the target user act.
- Role-play the primary operator, accountable owner, implementation recipient, and zero-background customer leader when relevant.

### Decision Comprehension And Human Tone

- Test whether a reader who has not followed the project can state what is proposed, the current problem, who works differently, the main risk or unknown, and the requested decision.
- Fail insider-only explanations that depend on unexplained abbreviations, omitted subjects or objects, hidden product history, architecture jargon, or noun piles.
- Distinguish isolated awkward phrasing from wording that changes the perceived object, state, responsibility, risk, current capability, or requested decision.
- Detect AI-like patterns by context and density: narrator voice, empty significance claims, repeated binary contrasts, generic three-part structures, business-jargon chains, translation-style stacking, vague authority, and empty conclusions.
- Do not use banned-word matching as the review method. Run paragraph-job, product-substitution, subject-action-result, evidence-pressure, and fresh-reader teach-back tests; use suspicious phrases only as prompts for those tests.
- Preserve facts, numbers, terms, responsibility, evidence status, and uncertainty before simplifying language. Do not make professional content childish or falsely casual.
- For customer-facing or owner-decision material, treat dependence on verbal translation as P1. Treat isolated AI-like wording as P2. Use P0 only when wording causes a demonstrated unsafe or materially wrong decision.

### Data And State

- Identify the authoritative data source and ownership.
- Distinguish draft, effective, suspended, deleted, and historical states.
- Define versioning, change reason, correction, and audit trail when relevant.
- Clarify import/export ownership and external-system contracts.
- For cross-system changes, define producer, consumer, authoritative ownership, stable identity, direction, acknowledgement semantics, propagation scope, conflict precedence, idempotency, ordering, retry or compensation, reconciliation, and audit as applicable.
- Verify server authorization for sensitive or cross-system paths before claiming security closure.
- Trace completion, qualification, approval, acceptance, safety, and recovery claims to authoritative responses or auditable evidence.
- Keep request, acknowledgement, action, evidence quality, business result, and downstream closure distinct.
- Compare shared facts across list, detail, statistics, reports, notifications, and handover.

### Delivery And Migration

- Separate new-project behavior from legacy maintenance paths.
- Decide which customizations become product capability and which remain delivery-specific.
- Identify old-data or old-workflow migration needs.
- Build a compatibility matrix for meaningful current/legacy, legacy/current, mixed-rollout, disconnected, and third-party combinations when the workflow crosses versions or products.
- Define capability negotiation, unsupported behavior, rolling upgrade, rollback, reconciliation, and who owns the compatibility promise.
- Keep designed, implemented, integrated, accepted, and released states distinct.

## Submission-Readiness Conclusions

When this skill is used directly by a product manager, use exactly one self-assessment conclusion:

- **可以提交**: No P0/P1 gaps; only optional polish remains.
- **补齐后提交**: No P0; limited and clear P1 fixes do not change the product structure.
- **修复并复查后提交**: A localized P0 blocks the current submission, but the product model remains valid; repair the defect and re-run the affected review and acceptance paths before submission.
- **需负责人确认后提交**: The material is otherwise coherent, but an authorized owner must decide a scope, responsibility, completion, safety, cost, dependency, or main-flow premise before it can be treated as settled.
- **需要重构，暂不建议提交**: Direction may be valid, but roles, page boundaries, user stories, data model, workflow structure, or a major product/domain premise requires redesign.

Choose the conclusion by the next blocking action, not by how long or alarming the issue list looks. First classify PM-fixable defects, discoverable facts, and owner decisions separately.

Do not convert missing context into an owner decision:

- If the artifact does not state a page's role, workflow position, responsibility meaning, current behavior, or source rule, mark it as `材料缺失` and identify the source or ask the current PM for context. Missing information is not proof that an authorized choice exists.
- A model-generated list of possible designs does not create an owner decision. Escalate only when the supplied material or verified context establishes a real unresolved choice that changes scope, authority, accountability, cost, safety, dependency, object boundary, completion, or the main flow and exceeds the PM's decision authority.
- When the missing item is a draft detail inside an already agreed product boundary, the PM should propose and document it. Use `仍需查证` when a named source can settle the fact; use `需有权负责人确认` only for the remaining authorized choice.

Before calling an issue structural, distinguish an **undecided premise** from an **invalid committed model**:

- If a core object, authoritative source, responsibility, main-flow premise, scope, cost, or dependency is still undecided and the remaining material is coherent enough for a decision, route it to `需负责人确认后提交`. The absence of a decision is not by itself a reason to claim that the product must be rebuilt.
- Use `需要重构，暂不建议提交` only when the current material has already committed to a contradicted, mutually incompatible, or demonstrated-unworkable core model and correcting it requires redesign rather than completing a decision package.

For `需要重构，暂不建议提交`, name at least one structural trigger and its affected stories or views:

1. **Core object or authoritative-source replacement**: the correction changes the identity, granularity, ownership, or authoritative source of a core object and invalidates existing completion, statistics, audit, or handoff rules across multiple core stories or views.
2. **Main-flow or core-role replacement**: the correction adds, removes, or reorders main success-flow steps or a class of core actors, rather than adding fields, validation, permissions, evidence, or exception handling to an otherwise stable flow.
3. **Core premises cannot coexist**: two settled core definitions are mutually exclusive, or the correction rewrites most of the core object, role, and workflow model together, so existing core stories and acceptance rules cannot remain valid.

Do not use `需要重构` merely because the problem concerns an important role, field, rule, page, or because the first draft of a repair list is incomplete. An incomplete repair list may mean missing evidence or an owner decision. If a bounded change set, affected scope, and focused re-test path can preserve the product goal and main workflow, use `修复并复查后提交` for a P0 and write that change set and re-test path explicitly.

Then apply this order:

1. Confirmed invalid committed model matching a structural trigger -> `需要重构，暂不建议提交`.
2. Otherwise, localized P0 -> `修复并复查后提交`. A missing formula, threshold, completion rule, responsibility rule, or acceptance rule for a core outcome is still a current PRD defect even when an authorized owner must confirm the proposed value. The PM must draft the rule, options, recommendation, and test method; owner confirmation does not turn the PM's required work into `无需修改`.
3. Otherwise, unresolved authorized-owner decision that blocks submission -> `需负责人确认后提交`. Keep any PM-fixable P1/P2 items visible; the owner decision does not erase them or change their severity.
4. Otherwise, no P0 but limited and clear P1 work remains -> `补齐后提交`.
5. No P0/P1 or blocking owner decision remains -> `可以提交`.

An owner decision never changes the severity of a product defect. When a structural or localized P0 and an owner decision coexist, use the P0-based conclusion above and list the owner decision separately with its options, consequences, recommendation, and blocker status. Several severe-looking findings do not by themselves prove that restructuring is required.

Do not use `需负责人确认后提交` for discoverable facts or reversible details the PM can resolve.

These are readiness recommendations, not approval records. If another explicitly invoked owner-decision skill embeds this rubric, that host skill owns its final approval vocabulary and output contract.
