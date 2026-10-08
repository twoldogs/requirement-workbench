# Testable Acceptance

## Acceptance Contract

Each core acceptance scenario should contain:

```markdown
### AC-001 标题
- 对应用户故事：US-xxx
- 场景：
- 前置数据和状态：
- 角色与权限：
- 操作：
- 预期的业务对象变化：
- 用户可见结果：
- 可核查证据：页面状态 / API 响应 / 外部回执 / 审计记录 / 人工确认
- 不应发生：
```

Write observable business outcomes. Do not turn acceptance into unit-test code or internal database assertions unless the user explicitly requests technical test cases.

## Good And Bad Criteria

Bad:

> 提交后系统正确处理，页面体验友好，数据及时同步。

Missing: object, state, source, time boundary, permission, failure behavior, and evidence.

Better:

> 当执行人提交检查点结果和必填证据后，该检查点进入“待验收”；任务仍不得显示“已验收”。只有有验收权限的人员提交结论及原因后，检查点才进入“已验收”。两次操作都记录操作者、时间、对象、结论和审计记录。

The example is valid only when these roles and rules are source-backed.

## Scenario Coverage

Select proportionately:

- Normal success.
- Empty or missing data.
- No permission or expired authorization.
- Validation conflict.
- External timeout, rejection, duplicate, or partial success.
- Offline or degraded mode.
- Retry and idempotency at the business level.
- Cancellation and reversal.
- Handover or reassignment.
- Correction after completion.
- Boundary value or high volume.
- Cross-view consistency: list, detail, statistics, report, notification, and handover.

## State Evidence

Acceptance of `complete`, `safe`, `approved`, `received`, `synchronized`, or `closed` must identify the authoritative evidence. A request-success response may prove acceptance by a service, not physical execution or business closure.

If a human declaration is the valid authority, require actor, time, reason, scope, and correction/audit history. Do not demand a machine signal when the business legitimately relies on human attestation.

## Rule Combinations

Convert configuration rules into a table before writing individual criteria:

| Combination | Expected result | User explanation | Allowed action | Evidence |
|---|---|---|---|---|

Include conflicts and forbidden fallbacks. An undefined combination is an owner decision, not a tester's job to guess.

## Non-Functional Requirements

Do not invent response time, availability, accuracy, volume, staffing, cost, or ROI targets.

When a target is needed but not confirmed, do not write `< X 秒`, `约 N%`, or a guessed benchmark. Write:

```text
metric -> current baseline unknown/known -> target待确认 -> source/owner
-> measurement method -> observation period -> exclusion
```

Security, privacy, audit, compatibility, accessibility, performance, and recovery requirements should be included when the scenario makes them material.

## Acceptance Review

Fail or return for confirmation when:

- The core outcome cannot be observed.
- The test depends on an undefined business object or state.
- Two roles can interpret the same action differently.
- Success depends on an unconfirmed external integration.
- A high-risk state has no authoritative acknowledgement.
- A target has no baseline, owner, or measurement method.
- The criterion only says `correct`, `friendly`, `fast`, `normal`, or `as expected`.

## Traceability

Maintain:

| Requirement | User story | Rule | Prototype page/state | Acceptance | Evidence/owner |
|---|---|---|---|---|---|

Every core story needs at least one success criterion and one meaningful negative or degraded criterion when applicable.
