# Detailed Functional Specification

Use this reference to deepen a supported requirement into an unambiguous product contract for engineering, test, and later traceability. It is not a technical-design template and does not authorize invented database schemas, endpoints, frameworks, classes, deployment choices, or numeric targets.

## Select This Depth By Delivery Intent

Enter detailed-specification depth when the user asks for any of these outcomes, even without saying `SRS`:

- A formal or complete functional specification.
- A requirement directly usable for engineering and test handoff.
- Complete fields, object states, stepwise flows, exceptions, interfaces, rules, or acceptance mappings.
- Traceability from the original need through implementation or prototype evidence.
- A local change to an existing specification with impact and consistency checking.

Do not enter this depth for an explicit `最小`, `简版`, `初步`, idea-stage, or one-sentence request. Do not ask the user whether to upgrade; infer the requested outcome.

For a complete implementation-handoff PRD, use `full-prd-template.md` as the document frame and use this reference inside its material functional sections. Do not produce a separate duplicate SRS after the PRD.

## Establish The Specification Boundary

Before writing, identify:

- Source material and what each source proves.
- Original-need and user-story IDs.
- Product boundary, target scope, and explicit non-goals.
- Core actors, accountable owners, and permission boundaries.
- Core business objects and their authoritative data sources.
- Completion definition and the evidence that proves it.

Inspect supplied material, existing product evidence, code, APIs, and prior decisions inside the authorized scope before asking the user.

If a missing answer changes the product boundary, object granularity, core actor, accountable owner, authoritative data, completion definition, safety boundary, or main flow, ask one highest-parent question:

```markdown
## 需要确认的父决策
- 需要决定：
- 为什么现在必须决定：
- 会影响：对象 / 状态 / 责任 / 主流程 / 验收 / 其他
- 可选方案及后果：
- 推荐方案：
- 推荐依据与不确定性：
- 谁或什么证据可以确认：
```

The recommendation is a proposal, not approval. Continue every safe branch. Record lower-level gaps, field details, secondary exceptions, and unconfirmed targets as `待确认` or `待实测`; do not question the user field by field.

## Default Deliverable

Produce human-readable Markdown by default. Use YAML, JSON, or JS only when the user explicitly requests a machine-readable artifact or an existing tool contract requires it. A machine-readable appendix supplements the Markdown contract; it does not replace evidence explanations and owner decisions.

Use only the sections relevant to the requirement. A detailed specification is complete when the business contract is unambiguous, not when every possible table is filled.

### 1. Specification Identity And Evidence

```markdown
# 详细功能规格：<名称>

- 规格 ID：FS-xxx
- 生命周期：草稿 / 已确认需求 / 待评审 / 其他有证据的状态
- 来源：文档、会议、问题单或用户明确指令
- 对应原始诉求：ON-xxx
- 对应用户故事：US-xxx
- 本次范围：
- 明确不做：
- 证据边界：材料明确 / 实际验证 / 业务推导 / 材料缺失
```

Do not label a draft `approved`, `implemented`, `tested`, or `released` without evidence.

### 2. Terms, Objects, And Relationships

Use `object-responsibility-model.md` for object, state, responsibility, rule-combination, and authoritative-data details.

```markdown
## 领域对象
| Object ID | 业务对象 | 业务含义 | 唯一业务标识 | 权威来源 | 所有者 | 与其他对象的关系 | 证据/待确认 |
|---|---|---|---|---|---|---|---|
```

Name relationship meaning and direction. Do not infer cardinality, ownership, cascade, or lifecycle from a UI layout.

### 3. Field Contract

Use a field table only for fields that affect business behavior, validation, permission, responsibility, integration, acceptance, or user decisions.

```markdown
| Field ID | 所属对象 | 业务字段 | 含义 | 来源/权威方 | 类型或取值 | 必填条件 | 校验/冲突规则 | 读写角色 | 敏感性/审计 | 待确认 |
|---|---|---|---|---|---|---|---|---|---|---|
```

`类型或取值` describes product meaning, not guessed database DDL. Include sensitivity or audit only when material to the domain. Separate current source-backed technical constraints from unconfirmed target behavior.

### 4. Roles, Permissions, Responsibility, And States

Record permission separately from actual execution and accountability. Define state transitions for material objects:

```markdown
| Transition ID | 对象 | From | 触发/动作 | 允许执行者 | 责任人 | 权威证据/响应 | To | 失败或纠正 | 下一责任人 |
|---|---|---|---|---|---|---|---|---|---|
```

Never let `request accepted`, `submitted`, `toast shown`, or `API success` silently become business completion.

### 5. Functional Contract

Create one functional contract per independently triggered and accepted business capability. Split when the actor, trigger, business outcome, object lifecycle, permission boundary, or independent acceptance changes; do not split merely by page or button.

```markdown
## FS-xxx 功能名称

### Purpose And Trace
- 对应原始诉求：ON-xxx
- 对应用户故事：US-xxx
- 影响对象/状态：OBJ-xxx / ST-xxx
- 概述：
- 前置条件：
- 后置条件：
- 权限与责任：

### Basic Flow
| Step | 执行类型 | 谁/什么执行 | 动作或系统行为 | 对象/状态变化 | 适用规则 | 可观察证据 |
|---|---|---|---|---|---|---|

### Alternative And Exception Flows
| Flow ID | 从哪一步分支 | 条件 | 系统/人员行为 | 对象和状态结果 | 恢复/补偿/下一责任人 | 验收 ID |
|---|---|---|---|---|---|---|

### Inputs And Outputs
| IO ID | 输入/输出 | 对象或字段 | 来源/目标 | 必填条件 | 约束/失败处理 | 权威证据 |
|---|---|---|---|---|---|---|

### Business Rules
| Rule ID | 规则 | 作用范围 | 优先级/覆盖/冲突 | 生效时间或版本 | 证据/负责人 | 状态 |
|---|---|---|---|---|---|---|

### Acceptance
| AC ID | 对应故事/流程/规则 | 场景与前置状态 | 操作 | 预期对象/状态变化 | 用户可见结果 | 可核查证据 | 不应发生 |
|---|---|---|---|---|---|---|---|
```

Use stable IDs only when the artifact is large enough to need traceability. Keep actor actions and system behavior distinguishable. Put step-local rules beside the relevant step and cross-step rules in the business-rule table.

Cover the normal path and meaningful empty, no-permission, conflict, failure, timeout, duplicate, retry, cancellation, correction, degradation, and handover paths proportionately. Do not manufacture branches that the evidence does not support; record material gaps.

### 6. Cross-System Contract When Relevant

Add this only when the business outcome crosses systems, services, devices, tenants, or deployed versions:

```markdown
| Contract ID | Producer | Consumer | Business object/fact | Direction | Trigger | Request/response meaning | Authoritative acknowledgement | Duplicate/order/retry | Partial failure/compensation | Compatibility/migration | Owner/unknown |
|---|---|---|---|---|---|---|---|---|---|---|---|
```

Specify business meaning and responsibility. Do not invent URLs, methods, payloads, message queues, retry counts, or timeouts. Preserve supplied technical constraints under implementation constraints with their sources.

### 7. Non-Functional And Implementation Constraints

Include only material, source-backed dimensions such as security, privacy, accessibility, audit, compatibility, recovery, performance, or capacity.

For an unconfirmed target write:

```text
metric -> current baseline known/unknown -> target待确认
-> measurement method -> observation period -> exclusion -> decision owner
```

Never use invented placeholders such as `X 秒`, `N%`, or a guessed benchmark.

### 8. UI, Prototype, And Implementation Mapping

Map a requirement to an existing artifact without treating the artifact as proof of production behavior:

```markdown
| Trace ID | Requirement/Flow/Rule | 页面、原型状态或实现位置 | Visible | Interactively tested | Source-supported | Production-confirmed | Gap |
|---|---|---|---|---|---|---|---|
```

If no UI or implementation exists, omit this table or mark the mapping unavailable. Do not invent screens to make the specification look complete.

### 9. Traceability

```markdown
| Original need | User story | Object/state | Flow/rule | Prototype/implementation | Acceptance | Evidence/owner | Status |
|---|---|---|---|---|---|---|---|
```

Every material original need must reach at least one observable acceptance path or remain explicitly unresolved. Every material rule and state transition should have a source, decision owner, or `待确认` status.

### 10. Risks And Open Decisions

```markdown
| Decision/gap | Why it matters | Affected IDs/sections | Options and consequences | Recommendation | Evidence or authorized owner | Blocking/non-blocking |
|---|---|---|---|---|---|---|
```

## Diagrams

Generate a diagram only when it makes a real relationship easier to review:

- Domain relationship diagram for three or more interacting objects.
- State diagram for a meaningful lifecycle with branches or recovery.
- Flow or swimlane diagram for multi-role, multi-system, or exception-heavy behavior.

Use Mermaid in Markdown unless the user specifies another format. Derive it from the authoritative object, transition, and flow tables. The diagram is a view of the specification, not a second source of truth. Do not embed arbitrary inline SVG or add a frontend viewer to the requirement Skill.

## Update An Existing Specification

Do not rewrite the entire document for a local change.

1. Locate the source statement and affected stable IDs.
2. Compare the requested change with current objects, fields, states, responsibility, flow steps, rules, interfaces, and acceptance.
3. If the change conflicts with a core completion or ownership decision, ask one highest-parent question before settling it.
4. Update every affected reference while preserving unrelated confirmed content.
5. Return a change-impact table:

```markdown
| Change | Source | Affected IDs | Updated sections | Acceptance impact | Traceability status | Remaining decision |
|---|---|---|---|---|---|---|
```

6. Run a delta consistency check. Classify results as `已解决并验证`, `声称已修但缺证据`, `回归或矛盾`, or `新增问题`.

## Completion Check

Before delivery verify:

- The original need and evidence boundary remain visible.
- Objects, fields, states, actors, responsibility, data authority, flows, and rules use one consistent meaning.
- Normal and material negative paths have observable outcomes and next responsibility.
- Acceptance refers to the same objects, states, rules, and evidence as the functional flow.
- Cross-system acknowledgement is not confused with business completion.
- Unsupported targets, technologies, interfaces, and adjacent features were not invented.
- Core unresolved decisions are not presented as settled scope.
- A new engineering and test team can implement or test the business contract without reconstructing it verbally.
