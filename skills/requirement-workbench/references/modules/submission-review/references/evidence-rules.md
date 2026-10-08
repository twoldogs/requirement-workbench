# Evidence Rules

## Purpose

Keep product explanation and review grounded in the supplied artifacts. Make every important conclusion traceable and prevent plausible inference from being presented as source fact.

## Evidence Labels

Use these labels explicitly when the evidence boundary matters:

| Label | Meaning | Allowed claim |
|---|---|---|
| 材料明确 | Directly stated in a PRD, requirement, user story, official version list, or embedded requirement annotation | State as a source fact and identify the artifact. |
| 原型验证 | Confirmed by actually navigating, clicking, entering data, switching states, or observing resulting behavior | State exactly what worked or failed and the tested path. |
| 业务推导 | Reasonably inferred from page content, actions, domain knowledge, or version context | Explain why it is inferred; never call it the original user story. |
| 材料缺失 | The available artifacts do not support a conclusion | State what cannot be known and what the PM or owner must provide. |

Reading HTML, source code, screenshots, or static text is artifact inspection, not `原型验证`. Use `原型验证` only after the required browser, interaction, rendering, or runtime check was actually performed, and record the tested path. Never claim that a page was opened, clicked, rendered, or visually verified when the available tools did not perform that action.

## Observation, Evidence Label, And Judgment Basis Are Different

Record three separate things for every material finding:

1. **Observation method**: document citation, static artifact inspection, rendered visual inspection, interactive test, or runtime/production evidence.
2. **Evidence label**: `材料明确`、`原型验证`、`业务推导` or `材料缺失`.
3. **Judgment basis**: the exact requirement, acceptance rule, root `DESIGN.md` section, verified applicable external criterion, demonstrated functional risk, or UI-skill general practice used to decide whether the observation is a problem.

Static UI inspection may establish that text, structure, styling, or a control is present in the supplied artifact. It does not establish interaction, integration, production behavior, or user outcome. State the static location and keep the claim narrow.

`原型验证` describes how behavior was observed; it is not by itself a reason that the behavior is wrong. Always identify the judgment basis separately.

## Judgment Authority And Applicability

Use these sources only for what they can govern:

- A formal requirement or acceptance criterion can establish intended product behavior within its stated scope.
- An approved root `DESIGN.md` can establish the project's design contract.
- A law, regulation, or external standard can establish a mandatory issue only after the exact criterion, applicable level, jurisdiction/context, and target surface are verified.
- A demonstrated task, access, comprehension, responsive, data, or safety failure can establish a functional problem even when no visual contract exists.
- A UI skill's general rule, anti-pattern rule, or taste preference is normally advisory. It becomes mandatory only when adopted by the project contract or when the same observation independently causes a demonstrated functional failure.

Do not automatically assign P0/P1 because a UI skill uses words such as `must`, `never`, `critical`, or `banned`. The host review rubric owns final severity.

## Finding Nature

Classify the nature before severity:

| Nature | Required basis |
|---|---|
| Product defect | Requirement, business-flow, responsibility, state, permission, data, or acceptance failure |
| Design-contract conflict | Conflict with an approved root `DESIGN.md` |
| UI quality problem | Demonstrated usability/accessibility/responsive/interaction failure or a verified applicable criterion |
| UI improvement suggestion | General practice, design option, anti-slop guidance, or taste preference without mandatory project authority |
| Evidence gap | A material conclusion cannot be supported by the supplied artifacts or tests |
| Owner decision | A real authorized choice changes scope, authority, accountability, cost, safety, dependency, object boundary, completion, or main flow |

UI improvement suggestions do not block submission by themselves. When code already complies with `DESIGN.md`, keep a preference as optional. Ask product whether to modify `DESIGN.md` only when the proposed change would alter a reusable token, component, layout, interaction rule, or other project-wide direction. An authorized local adjustment may proceed when it does not redefine the reusable system. A design-contract conflict is not automatically P0; grade its actual user, delivery, or acceptance impact.

## Direct Citation

Cite the supporting evidence beside each finding. Name the artifact and section or line, the page state or tested path, the exact applicable criterion, or the missing artifact and what it prevents proving. Do not create manual IDs such as `[需求-01]` or `[设计-01]`.

A skill name alone is not a sufficient basis. Name the specific rule and explain why it applies.

## Evidence Inventory

Before reviewing, inventory evidence by target version or module:

| Version/module | PRD | Prototype and fidelity | Root DESIGN.md | Source stories | Acceptance criteria | Status evidence |
|---|---|---|---|---|---|---|

Do not assume all versions have the same evidence quality. A complete current-release PRD and a historical prototype card require different confidence and severity treatment.

## Evidence Hierarchy And Conflict Handling

Treat sources according to what they can prove:

1. A signed-off PRD or formal source requirement proves intended behavior, not implementation.
2. A version card proves the requirement title, target version, and displayed status only.
3. Embedded annotations prove design intent, not working interaction.
4. A visible page proves layout and visible content, not data correctness or action completion.
5. A tested interaction proves only the exercised path and resulting state.
6. Prototype source logic may explain behavior but does not prove production implementation.
7. Production logs, API responses, acceptance records, or released product behavior are required to claim integration, acceptance, or release.

When artifacts conflict, report the conflict. Do not silently select the interpretation that produces the cleanest story.

Also report cross-artifact conflicts in terminology, object granularity, responsibility, state meaning, completion rules, and authoritative data source. A shared label does not prove shared meaning, and different labels do not prove different objects.

## Non-Equivalence Rules

Never equate:

- `设计完成` with developed, integrated, accepted, released, or production-ready.
- A requirement annotation with implemented behavior.
- A button or visual control with a working flow.
- Static charts or sample rows with a connected authoritative data source.
- Client-side hiding with server-side authorization.
- A simulated success message with external-system integration.
- The current prototype's final state with the historical state of an earlier release.
- A requirement title with a complete role, pain point, business value, or acceptance rule.

## State Claims Require Evidence

For every material claim such as `完成`、`合格`、`已批准`、`已接收`、`安全`、`已停稳`、`已恢复` or `已闭环`, identify:

- The object whose state changed.
- The actor or device that produced the source fact.
- The authoritative response or evidence record.
- The validation rule.
- The recorded time, reason, scope, and audit identity.
- The next responsible party.

Treat a click, checkbox, client-side variable, sample row, simulated callback, or submitted request as a declaration or test artifact, not proof that the resulting business or physical state occurred.

Keep these facts separate when they matter:

```text
request sent -> request accepted -> action executed -> evidence captured
-> evidence validated -> business conclusion chosen -> downstream record closed
```

If a human declaration is the legitimate source, require the declaring actor, time, reason, scope, and correction/audit history. Do not demand a machine source when the business rule is legitimately human-attested.

## Minimum-Inference Rule

When only a title or target page exists:

- State the visible user action.
- Infer only the minimum role needed to perform that action.
- Describe the likely blocker as inference, not fact.
- Do not invent why the requirement was prioritized, who requested it, what metric it improves, or what exceptions apply.
- Mark the missing original PRD, user story, and acceptance criteria.

## Prototype Test Record

For every tested core flow, record:

- Starting page and state.
- User action.
- Expected result from the PRD.
- Actual result.
- Evidence type: visual-only, interactive, source-supported, or production-confirmed.
- Untested branches.

For core stories, include at least one negative or degraded branch and compare the same fact across the relevant list, detail, statistic, report, notification, and handover views.

Do not generalize one successful sample path to all permissions, data volumes, asset types, browsers, or failure conditions.
