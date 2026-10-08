# Prototype Content Hygiene And Plain-Language Review

## When To Read

Read this reference when reviewing screenshots, HTML, interactive prototypes, UI copy, review/demo artifacts, process debris, unexplained technical wording, or whether a page can be understood without a designer standing beside it.

## Goal

Keep product UI focused on the user's business object, current state, evidence, decision, and next action. Move design rationale, review narration, implementation notes, and test controls to PRDs, annotations, development notes, or test tooling.

## 1. Start With The Page Role And Job

For each page state, identify:

- The primary user.
- The job they are trying to finish.
- The business object they are acting on.
- What they must know before acting.
- The allowed action and forbidden action.
- What happens after the action.

Mark inferred roles as inference. Do not invent a role merely to justify existing content.

## 2. Apply The Four-Question Readability Test

The page as a whole must let the target user answer:

1. What happened or what is the current state?
2. What does it affect?
3. What should I do next?
4. Who is responsible now?

Not every sentence must answer all four questions. A persistent banner, error, risk state, or action prompt should answer the relevant questions without requiring architecture knowledge.

## 3. Detect Process And Review Debris

Treat the following as candidates for removal or relocation when they do not help the target user act:

### Architecture Narration

- `不是独立系统`、`复用某底座`、`统一主账`、`唯一事实源`.
- Internal ownership descriptions such as `由某业务服务维护`.
- Data-model words such as `投影`、`解析`、`快照`、`适配层` when no plain explanation is provided.

### Review Narration

- `本页用于评审`、`给领导看`、`体现某能力`、`方案 A/B`.
- `待负责人确认` shown as normal product content instead of an annotation.
- Permanent cards that explain why the design was chosen.

### Implementation And Future Notes

- `后续接入`、`正式版再做`、`待开发确认`、`目标设计`、`本次范围`.
- TODO/TBD, placeholders, mock credentials, raw permission codes, or debug values.

### Demo And Test Controls

- `点击这里模拟`、`模拟成功/拒绝/超时`、`能力演示导航`.
- Test-only role switches or state injectors mixed with business actions.
- Sample success messages that look like real external-system completion.

## 4. Keep Real Operational Information

Do not remove information merely because it sounds technical. Keep and clarify:

- No permission, stale data, loading failure, service degradation, or missing authoritative data.
- Safety state, device acknowledgement, access restriction, and audit consequence.
- Why an action is blocked and who can unblock it.
- Version or historical behavior when it materially changes the user's decision.
- Stable IDs needed for support, audit, or field work.

Place this information beside the affected object or action. Give a clear next step.

## 5. Run Four Role Reads

When relevant, read the same page as:

- The frontline operator: Can I tell what to do now without learning the data model?
- The accountable owner: Can I tell whether the work is safe, complete, late, or ownerless?
- The implementation/handoff recipient: Can I map the label to one object, state, permission, and action target?
- The zero-background customer leader, when the page or summary is intended for a decision: Can I explain what this is, why it is needed, what changes, the main risk, and what I must decide without asking the author to translate it?

Record a wording problem as a product-model problem when different roles infer different objects, responsibility, safety state, or action.

Do not lower the technical standard for the customer leader. Put the decision explanation first, define necessary terms once, and place the object model, state rules, and integration details after it.

## 6. Review The Entire Visible-Copy Surface

Inspect:

- Browser title, page title, subtitle, breadcrumbs, tabs, and navigation.
- KPI names, table headers, filters, labels, help text, and placeholders.
- Buttons, confirmation dialogs, warning banners, empty/error/no-permission states, and Toasts.
- Drawers, tooltips, accessibility labels, hidden demo panels, and test role/state controls.
- Text generated dynamically in JavaScript, not only static HTML.

For a local frontend, use any available copy-search capability as a candidate finder, then inspect the rendered states in a real browser when possible. Exact-word scanning cannot prove that a page is understandable.

## 7. Choose One Treatment

For each flagged phrase, choose exactly one:

- **Delete**: It adds no user value.
- **Move**: Put it in PRD, annotation, development note, or test tooling.
- **Rewrite**: State the actual object, condition, impact, action, and owner.
- **Keep**: Explain the user decision or safety need that justifies it.

Example:

```text
Bad: 静态资格通过，动态就绪待解析。
Better: 已获准执行正式任务；当前因梯控故障暂不可派发。
```

## 8. Severity Guidance

- Use P2 for isolated awkward wording with no decision or action risk.
- Use P1 when wording materially confuses state, responsibility, permission, next action, or implementation handoff.
- Use P0 only when the current core flow becomes unsafe, produces materially wrong decisions, destroys accountability, or proves false completion/security behavior.
- Use conditional P0 when the danger depends on an unverified production or server-side fact.

## Final Check

Before approval, confirm:

- A zero-context user can state what the page is for in one sentence.
- A zero-background decision maker can retell the problem, proposed change, main risk, and requested decision from the standalone summary.
- Every important state tells the user its impact and next action.
- Abbreviations and technical names are explained on first use.
- One concept has one stable user-facing name.
- Review, architecture, implementation, demo, and test narration is absent from normal product UI.
- The review report itself uses plain language and quotes technical terms only when necessary.
- AI-like wording is judged by context and density; a single phrase hit is not treated as proof or an automatic defect.
