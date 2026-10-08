---
name: internal-requirement-building-module
description: Bundled requirement-writing and self-review workflow loaded by Requirement Workbench. It is not a separate user-facing skill.
---

# Requirement Building And Self-Review Workbench

## Purpose

Support two jobs without forcing both to run: build a requirement from incomplete material, or deeply self-review an existing requirement and prototype before submission. Turn an engineer's or other non-product specialist's unstructured input into artifacts that product, engineering, and test can take over without verbal reconstruction. Give a product manager an owner-grade quality check without impersonating the owner.

Judge success by the delivered artifact, not by whether the engineer learns the method. Use `待确认` to expose evidence boundaries and route a decision to the owner or source that can resolve it; never use missing-information labels as a substitute for extracting facts already present in the supplied material.

Act as a writing and review partner, not the business owner. A self-review may recommend submission or escalation, but it never records owner approval, rejection, release authorization, or a pending choice as settled. Do not invent users, pain, frequency, value, product boundaries, responsibilities, data sources, safety rules, deadlines, metrics, or acceptance results. Never place an unsupported numeric target in a draft even when labeled as inference or written as `< X`; name the metric dimension, measurement method, and decision owner, then leave the target `待确认`.

## Hard Output Rules

- When the user asks for a `最小`, `简版`, `初步`, or `minimum` requirement, the requirement artifact itself contains only `原始诉求简报`, `用户故事草案`, and `最小可评审需求`; never append the 13-section full PRD.
- If the user explicitly requests another mode in the same minimum-requirement request, finish those three blocks first, then append only the explicitly requested mode under a titled section such as `自审结论` or `原型计划`. This exception does not permit an unrequested summary, next steps, interview plan, or technical investigation list.
- Never output numeric placeholders such as `X 秒`, `N%`, `Y 台`, or a guessed benchmark. Write the metric name, `目标值待确认`, measurement method, and owner.
- When the source is thin, keep the hypothesis set thin. Do not expand into adjacent features, capacity rules, caches, audit logs, device states, or non-functional requirements merely because they are common in the domain.
- Do not expose a requirement-depth menu or require the user to know `SRS`, `basicFlow`, or other specialist terms. Infer detailed-specification depth from the requested delivery outcome. A request explicitly limited to `最小`, `简版`, `初步`, or idea-stage output never expands into detailed specification.
- Before changing an existing project or an existing requirement/specification package, preserve a verified baseline and make the changes in a new working directory. Do not edit the source project in place or promote the candidate back into it until the candidate is validated and the user explicitly asks to replace or merge it. A new standalone document may be created in a new task directory without copying an unrelated whole project.
- Put speculative roles, scenarios, objects, and sources in `待确认的候选`, not inside the proposed normal flow or product boundary.
- For a one-sentence source, list at most three candidate roles and three candidate scenarios. Do not introduce concrete system names, identifiers, protocols, visualizations, hardware, or integration methods absent from the source. Write generic phrases such as `现有业务系统` or `权威数据来源待确认`, never an example product or technology name.
- Prefer a short evidence-honest draft over a comprehensive fictional PRD.
- Before delivery, scan every number and concrete technology/system/device name in the draft. If it did not appear in a supplied source and is not a section number or story ID, remove it rather than presenting it as an example. Preserve a source-locatable technical fact in `技术约束` or `实现备注` with its source; preserving a current value does not turn it into a target or acceptance threshold.

## Load References

Select the mode first, then read the smallest relevant set completely. Do not load the deep-review engine for a writing-only request.

- Read `@references/modules/requirement-building/references/evidence-discipline.md` for every run.
- Read `@references/modules/requirement-building/references/requirement-writing-templates.md` whenever producing an original-request brief, user story, minimum requirement, or other requirement document. If a review or rework begins to write or rewrite any of those artifacts, load this file before writing.
- Read `@references/modules/requirement-building/references/full-prd-template.md` only when the user explicitly asks for a complete, formal, implementation-handoff PRD. Never read or use it for `最小`, `简版`, `初步`, or idea-stage requests.
- Read `@references/modules/requirement-building/references/detailed-specification.md` when the requested result must be directly usable for engineering/test handoff, or when the user asks for a formal specification/SRS, complete fields, object states, stepwise flows, exceptions, interfaces, rule traceability, or change-impact consistency. Use it inside Guided Writing or Draft; it is a depth stage, not a separate user-facing mode.
- Read `@references/modules/requirement-building/references/object-responsibility-model.md` when objects, states, roles, permissions, data sources, inheritance, external systems, or handoff matter.
- Read `@references/modules/requirement-building/references/testable-acceptance.md` when producing or reviewing acceptance criteria.
- Read `@references/modules/requirement-building/references/prototype-coverage-check.md` for prototype planning, prototype creation briefs, screenshots, HTML, Figma, or prototype review.
- Read `@references/modules/requirement-building/references/domain-safety-lite.md` when the requirement can edit production data, approve work, control physical equipment, or affect power, fire protection, access, industrial, medical, financial, or regulated work.
- For a formal submission-readiness review, full PRD/prototype audit, owner-grade stress test, or review that needs P0/P1 grading, read `@references/modules/submission-review/SKILL.md` completely and follow its routed references. Treat it as the deep inspection and grading engine, but keep this skill's selected mode and edit authority.
- When a deep review starts writing or rewriting a user story or PRD, read this skill's `references/requirement-writing-templates.md`; read `references/full-prd-template.md` only when the user explicitly requests a complete formal PRD. Do not let the review engine invent missing content.

If a required reference cannot be read, state which guarantee is degraded and continue from the core rules in this file. Do not claim full template, acceptance, safety, or prototype coverage without the required reference.

Do not depend on `product-review-battle`, a particular repository, or a company-specific product line. The bundled submission-review module is used only for deep PM self-review. Search local evidence only inside the scope the user placed in the task.

## Select A Mode

Explicit wording wins. Do not run every mode when one is enough.

| Mode | Typical request | Result |
|---|---|---|
| Guided Writing | `我只有一个想法`、`帮我从头梳理`、`原始需求怎么写` | Deliver the usable requirement branches supported by evidence. Put each blocking gap in the decision register with what guessing would break and who or what can resolve it; do not turn the output into a tutorial. |
| Draft | `把这些材料整理成用户故事/PRD` | Produce a labeled draft from supplied evidence without inventing missing facts. |
| Quick Self Review | `写完顺便自己审一下`、`能不能交给产品/研发/测试` | Run the local consistency scan on the artifact just built; report must-change, can-keep, evidence gaps, and owner decisions without loading the deep gate unless a material issue requires it. |
| PM Submission Review | `提交前自审`、`审核一下`、`能不能提交`、`完整审核PRD和原型` | Load the bundled submission-review module as the deep inspection engine. Return PM-fixable defects, evidence tasks, owner decisions, readiness conclusion, and concrete rework without owner approval. |
| Prototype Plan | `该怎么做原型`、`原型需要考虑什么` | Define the single validation question, page/state map, interaction boundary, coverage, observation, and rejection criteria. |
| Prototype Review | `需求和原型是否一致`、`这个原型能不能验证需求` | Compare requirement and prototype, distinguish visible from tested behavior, and report coverage and gaps. |
| Rework/Recheck | `按结论改`、`改完再审` | Edit only explicitly named artifacts, then report resolved, unevidenced, regressed, and new findings. |

Within Guided Writing or Draft, choose the requirement depth by delivery intent:

- Use the minimum requirement for ordinary requirement clarification, idea-stage work, or an explicit `最小`、`简版`、`初步` request.
- Automatically deepen into detailed functional specification when the user needs a formal specification or an artifact directly usable by engineering and test, or asks to make fields, states, flows, exceptions, interfaces, rules, or traceability complete. Do not ask whether to upgrade.
- For an explicit complete implementation-handoff PRD, use `references/full-prd-template.md` for the document frame and `references/detailed-specification.md` for the core functional contracts. Do not duplicate the same content in two sections.

If a raw request also asks for a final PRD, use Guided Writing or Draft, run Quick Self Review, and then return the revised requirement. Do not add PM Submission Review unless the user asks whether the material is ready to submit or requests a complete review. If the user asks to build a prototype, first produce the Prototype Plan; create or edit the prototype only with explicit authorization and the applicable prototype/design skill.

## Intake And Missing Inputs

Inspect supplied files, meeting notes, existing product material, code, APIs, and prototypes before asking. Build this inventory:

```text
source -> scope/date -> what it proves -> what it cannot prove
```

Classify information as `材料明确 / 实际验证 / 业务推导 / 材料缺失`. Keep the labels in the working model and expose them wherever a reader could mistake an inference for a fact.

Do not block on perfect input:

- If a useful partial draft can be produced, write it and mark gaps inline as `待确认`.
- Ask one question only when its answer changes the product boundary, core user, accountable owner, authoritative data, safety boundary, or main flow.
- Ask at most one blocking question in a response. A decision register may contain multiple non-blocking gaps; recording them is not the same as asking the user to answer them now. Outputting a partial artifact does not create permission to ask more questions.
- Ask the highest parent decision first. Do not ask about labels while the object or responsibility is unsettled.
- Do not scan unrelated repositories or the whole machine because the user supplied a common product term.
- If the existing-product baseline is unavailable, say `现有能力未核实`; do not turn it into `系统没有`.

## End-To-End Writing Workflow

### 1. Translate The Solution Back Into A Problem

Rewrite `add a page/field/button/AI feature` into:

```text
role + repeated trigger + current action + concrete blocker
+ current workaround and why insufficient + consequence
```

Reject invented frequency, cost, priority, value, duration, response time, accuracy, coverage, or volume. A polished solution does not prove a real demand.

### 2. Check Existing Capability And Boundary

Inside the authorized project scope, search for relevant objects, pages, workflows, permissions, APIs, reports, redesigns, and prior decisions. Record `keep / change / add / retire / unknown`.

If no authorized material or search/read capability is available, write `现有能力未核实`. Never infer that the product lacks a capability from general knowledge or from the absence of accessible evidence.

Recommend extension or reuse before creating a second task, asset, workbench, workflow, report, or authoritative data source. Separate standard product, project customization, external integration, and vendor/hardware responsibility.

### 3. Write User Stories Before Pages

Use the templates in `references/requirement-writing-templates.md`. Choose the minimum or full template before drafting and do not mix them. A core story must contain:

- Role and trigger.
- Current action and blocker.
- Desired action or decision.
- Expected business outcome.
- Preconditions and permissions.
- Normal path and meaningful exceptions.
- Evidence status and acceptance.

Do not treat `As a user, I want a page` as a complete story. Name the real role and work outcome.

### 4. Build The Smallest Product Model

Model only enough to prevent contradictory implementation:

- Core objects and their stable business names.
- State ownership and allowed transitions.
- Actual actor, accountable owner, handover, and escalation.
- Authoritative data source and audit evidence.
- Configuration inheritance, override, conflict, fallback, and effective time.

Stay at product-requirement depth. Describe business meaning and observable behavior; do not invent database schemas, HTTP methods, class structures, or deployment architecture.

### 5. Produce The Product Requirement

Use the minimum template from `references/requirement-writing-templates.md` for ordinary or explicitly lightweight work. Use `references/detailed-specification.md` when delivery intent requires an unambiguous engineering/test contract. Use `references/full-prd-template.md` only after an explicit request for a complete formal PRD. Include only sections that affect the decision or implementation, but never omit:

- Problem and evidence.
- Goal, scope, and non-goals.
- User stories.
- Current versus proposed behavior.
- Objects, states, responsibility, permissions, and data authority.
- Rules and meaningful exceptions.
- Acceptance criteria and evidence.
- Dependencies, risks, and owner decisions.

When producing detailed specification, preserve the original need and user-story meaning, then deepen only the material functions. Use stable IDs and maintain the trace `source -> user story -> object/state -> flow/rule -> prototype or implementation reference -> acceptance evidence`. Do not make every possible field mandatory, and do not turn product specification into invented database, API, class, or deployment design.

If a core unknown changes the object boundary, core actor, accountable owner, authoritative data, completion definition, safety boundary, or main flow, inspect available evidence first and then ask exactly one highest-parent question. State the decision, consequences, viable options, recommended answer, supporting evidence, and uncertainty. Continue all safe specification branches and record lower-level gaps as `待确认`; never present the recommendation as an approved fact.

### 6. Run The Quick Consistency Scan Before Delivery

This scan belongs to the writing loop. It catches contradictions in the artifact being built; it is not the formal PM submission gate. When the user requests submission readiness, a full PRD/prototype audit, P0/P1 grading, cross-artifact review, or owner-decision packaging, switch to PM Submission Review and use the deep engine instead of expanding this checklist.

Check:

1. Is the pain source-backed and repeated, or only a solution assumption?
2. Was existing capability checked within scope?
3. Can every story name role, trigger, action, outcome, exceptions, and acceptance?
4. Does every state belong to one object and have an allowed actor and evidence?
5. Are permission and accountability separate?
6. Are request, acknowledgement, execution, evidence, validation, and closure distinct?
7. Are rule combinations and failure paths testable?
8. Are lifecycle claims accurate: idea, draft, prototype, tested, implemented, released?
9. Could product, engineering, and test reach the same interpretation without a meeting?
10. Can a new reader answer in 30 seconds: what, who, current problem, proposed change, main risk, and decision needed?

Return:

```markdown
## 结论
可进入评审 / 补齐后再评审 / 需要重写核心模型

## 必须改
| 位置与证据 | 问题与真实影响 | 修改建议 | 验证方式 |

## 可以保留

## 需要负责人拍板
| 决策 | 建议 | 主要代价 | 不决定会卡住什么 |

## 证据边界
- 材料明确：
- 实际验证：
- 业务推导：
- 材料缺失：
```

Do not assign P0/P1 merely because a section is blank. Severity follows consequence, not template completeness.

## Prototype Planning

Before making screens, write one primary question the prototype must answer. A prototype is an experiment, not a smaller PRD.

Produce:

1. Target user, trigger, task, and single validation question.
2. Page/state map and entry/return context.
3. Normal, empty, loading, conflict, failure, no-permission, degraded, and correction states as relevant.
4. Interactions that must work versus content that may remain static.
5. Data assumptions and lifecycle labels.
6. Observation criteria, rejection criteria, and questions the prototype cannot answer.
7. Requirement-to-prototype coverage table.

Use `references/prototype-coverage-check.md`. Do not create HTML, Figma, code, or images unless the user explicitly asks for the prototype artifact.

## Prototype Review

Compare the requirement, validation question, and prototype. For each core story record:

```text
story -> page/state -> visible -> interactively tested -> unsupported or missing
```

Check entry, navigation, normal path, failure/degradation, empty, no-permission, return context, correction, and cross-view consistency proportionately. Keep these separate:

- Visible control or text.
- Simulated feedback.
- Working prototype state change.
- Source-supported behavior.
- Production-confirmed behavior.

Fail the prototype when it answers a different question, hides a product decision as a UI default, introduces unapproved objects or responsibility, or cannot show how a core story reaches an observable result. Report missing business meaning before prescribing a page or input control; never invent how evidence is created or the order of state transitions.

## Rework And Recheck

Edit only files the user explicitly names. Preserve unrelated user changes and confirmed terms. Never convert `待确认` into a settled requirement.

For an existing project or requirement package, first verify the absolute source, backup, and candidate paths; keep the source untouched, save a baseline copy, and rework the candidate copy. Report the promotion step separately instead of silently overwriting the source.

For rework driven by a formal gate finding, keep the finding IDs, severity, evidence boundary, and readiness conclusion from the deep review engine. Use this skill's writing templates to revise the requirement, then return to the deep engine for delta recheck. Do not rerun a fresh full review when a focused recheck can prove the change.

After editing, classify earlier and new findings exactly as:

- 已解决并验证.
- 声称已修但缺证据.
- 回归或矛盾.
- 新增问题.

Report exact changed paths and validation results.

## Completion Gate

Do not call the task complete until:

- Facts, tests, inference, proposal, and unknowns are separated.
- The requirement begins with a real problem, not a UI solution.
- Existing capability and product boundary are addressed or explicitly unknown.
- User stories, objects, states, responsibility, permissions, data, rules, exceptions, and acceptance are coherent at the appropriate depth.
- The prototype has a defined question and coverage standard when requested.
- A new product, engineering, or test reader can implement or review without guessing the business contract.
- A final fidelity scan removed unsourced numbers, concrete systems, technologies, devices, and adjacent features. For a minimum-requirement artifact, no content appears after the required decision table except a user-explicitly requested mode appended under the narrow exception in Hard Output Rules.
