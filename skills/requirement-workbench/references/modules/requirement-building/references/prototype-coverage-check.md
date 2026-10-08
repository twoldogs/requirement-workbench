# Prototype Planning And Coverage

## Start With One Validation Question

Write:

```markdown
## 原型验证问题
- 目标用户和任务：
- 当前不确定性：
- 这次只验证：
- 观察到什么算支持当前方案：
- 观察到什么会推翻当前方案：
- 原型不能证明：
```

Do not use one prototype to answer every business, usability, technical, and production question.

## Choose Prototype Fidelity

| Question | Minimum useful prototype |
|---|---|
| Object, rule, or state coherence | Flow/state diagram or annotated wireframe |
| Information hierarchy or comprehension | Static screens with realistic content |
| Navigation, conflict handling, or return context | Clickable interaction |
| Data/API feasibility | Technical spike or API test, not a polished UI |
| Production safety or performance | Controlled implementation test, not a design prototype |

Use the cheapest artifact that can reject a wrong design.

## Page And State Map

```text
entry -> context/selection -> action -> confirmation
-> success or failure -> return context -> correction/handover
```

For each page or dialog specify:

- Target role and task.
- Business object shown or changed.
- Entry and return path.
- Required data and permissions.
- Primary action and forbidden actions.
- Normal, loading, empty, conflict, failure, no-permission, degraded, and correction states as relevant.
- Next responsible party.

## Interaction Versus Static Content

Must be interactive when the question depends on:

- State transition.
- Rule conflict choice.
- Permission outcome.
- Validation and error recovery.
- Navigation or return context.
- Handover, cancellation, retry, or correction.

May be static when the question concerns:

- Information priority.
- Terminology comprehension.
- Layout comparison.
- A clearly labeled future or unsupported state.

Architecture narration, reviewer instructions, fake controls, and test notes do not belong in normal product UI.

## Coverage Table

| Story/acceptance | Page/state | Visible | Must interact | Observation | Missing/unsupported |
|---|---|---|---|---|---|

Do not count a story as covered because its noun appears on a screen. The user must be able to reach the relevant decision or result.

## Prototype Review

Record each tested flow:

- Starting page and state.
- User action.
- Expected result from the requirement.
- Actual visible result.
- Actual interaction/state change.
- Evidence type: visual-only, interactive, source-supported, or production-confirmed.
- Untested branches.

Check:

- Entry and navigation.
- Success, empty, failure, no-permission, degradation, correction, and return context.
- Same fact across list, detail, statistics, report, notification, and handover.
- Role, object, state, permission, responsibility, and evidence consistency.
- Lifecycle language: proposed, simulated, tested, implemented, or released.
- Unapproved features, objects, default decisions, or responsibilities introduced by the prototype.

Do not turn an evidence requirement into an invented UI mechanism. If the source says `保留设备回执`, report whether the receipt source, display, linkage, and retention are shown or missing; do not require a manual upload field unless the source says humans provide it. Do not impose an order among approval, acknowledgement, evidence, and closure unless the requirement defines that order. Show unordered constraints as separate unknowns and ask the owner when sequencing changes the model.

## Four Questions For User-Facing States

For every material state or message, a target user should understand:

1. What happened?
2. What object or work is affected?
3. What should I do next?
4. Who is now responsible?

Place real permission, failure, data-age, safety, and audit information beside the affected object and provide a next action.

## Prototype Conclusion

Return:

```markdown
## 验证结论
已回答 / 部分回答 / 未回答原验证问题

## 已覆盖

## 缺失状态或交互

## 需求外新增内容

## 原型不能证明的事项

## 下一轮最小验证动作
```

A polished static page is not proof of working integration, correct data, authorization, safety, or production readiness.
