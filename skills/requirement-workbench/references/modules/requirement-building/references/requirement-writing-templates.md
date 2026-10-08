# Raw Request, User Story, And Minimum Requirement

## Default To The Minimum Artifact

Use this file for idea-stage, minimum, brief, preliminary, or evidence-thin requests. Do not produce a full PRD unless the user explicitly asks for one and enough business decisions are available.

For a one-sentence source:

- Keep the raw words unchanged.
- List no more than three candidate roles and three candidate scenarios.
- Do not name a particular system, identifier, protocol, visualization, device, integration, performance target, or adjacent feature unless the source names it. Use `现有业务系统` and `权威数据来源待确认` instead of example technology names.
- Do not design a normal flow around a guessed role or data source.
- Do not output numeric examples or placeholders.

## Raw Request Brief

```markdown
# 原始诉求

## 用户原话或触发来源
- 原话/会议/问题单：
- 来源和时间：

## 已知问题
- 材料明确：
- 待确认的角色候选（最多三个）：
- 待确认的场景候选（最多三个）：
- 当前做法和具体卡点：材料缺失 / 已知内容

## 初步目标
- 希望用户能够完成的动作或判断：
- 本次明确不解决：待确认

## 关键缺口
- 哪个缺口会改变核心用户、边界、责任、数据或主流程：
```

Do not translate a customer sentence directly into a feature. Preserve the raw statement and record product interpretation separately.

## User Story

Primary sentence:

```text
作为【具体角色】，当【可观察的触发场景】发生时，
我需要【完成某个动作或判断】，从而【获得业务结果】。
```

When role, trigger, or outcome is not sourced, keep the slot `待确认`; do not fill it with the most common domain example.

Complete story:

```markdown
### US-001 标题
- 证据状态：材料明确 / 业务推导 / 材料缺失
- 角色：
- 触发：
- 当前动作与阻碍：
- 希望完成的动作或判断：
- 预期结果（无来源时不得填写数字目标）：
- 前置条件：
- 权限与禁止动作：
- 正常流程：
- 异常、无数据、无权限、失败、交接和纠错：
- 验收与证据：
- 待确认：
```

Bad story:

> 作为用户，我想要一个大屏，以便提高效率。

It lacks a real role, trigger, current blocker, decision, evidence, and observable outcome.

## Minimum Reviewable Requirement

```markdown
# 需求名称

## 1. 问题与证据
- 用户原话：
- 谁在什么场景遇到什么问题：待确认 / 材料明确
- 现在怎么处理，为什么不够：待确认 / 材料明确
- 证据边界：材料明确 / 业务推导 / 材料缺失

## 2. 目标与边界
- 希望改变的用户动作或结果：
- 本次不做：待确认
- 适用范围：待确认

## 3. 核心用户故事

## 4. 关键规则和异常
- 只写材料支持或会改变核心流程的规则。
- 其余进入待确认，不扩展相邻功能。

## 5. 验收方向
- 可观察结果：
- 指标维度：
- 目标值：待确认
- 测量方法和确认人：待确认

## 6. 待拍板事项
| 决策 | 为什么影响方案 | 建议的确认方式 | 谁或什么证据可确认 |
|---|---|---|---|
```

Stop here for the minimum-requirement artifact. It has exactly three top-level blocks: `原始诉求简报`, `用户故事草案`, and `最小可评审需求`. Only when the user explicitly requests another mode in the same request, append that mode under a titled section as allowed by `SKILL.md` Hard Output Rules. Do not otherwise append the full PRD, a technical design, a possible-feature inventory, summary, interview count, generic next steps, or technical investigation list.

## Writing Boundaries

- Do not force every small requirement to fill every table.
- Do not hide unresolved decisions inside a mockup default.
- Do not make engineering or testing guess missing business rules.
- Do not put a guessed time, percentage, accuracy, coverage, concurrency, volume, or benefit in a story. Write the metric dimension and leave the target `待确认`.
- Do not write `例如目标为...` followed by an invented number.
- Keep detailed technical design after the product contract, not inside the raw user story.
- Do not claim the draft followed every rule; let evidence labels and brevity demonstrate it.
- Run a final source-difference scan. Remove every number and concrete system, identifier, protocol, visualization, device, and integration name that is absent from the source, except section numbers and story IDs.
