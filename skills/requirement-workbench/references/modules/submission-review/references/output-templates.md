# Output Templates

Select the template that matches the user's requested mode. Do not repeat the same analysis across sections.

When the target reader is a customer leader or has not followed the project, put this standalone block before the detailed analysis. Keep each line short and leave unsupported cost, schedule, or capability claims as `待确认` rather than guessing.

```markdown
## 给零背景客户领导的30秒说明

- 材料性质：产品经理提交前自评，不代表负责人已批准。
- 这是做什么（想法/方案/原型/试点/已上线）：
- 现在的问题：
- 谁受影响、他们的工作怎么变（相比今天）：
- 建议怎么改：
- 主要风险或还没确认的事：
- 需要决定的事项（由有权负责人确认）：
```

This block must answer all six questions in `zero-context-executive-and-human-tone.md` section 1. Leave a line as `待确认` instead of guessing, but do not delete the affected-people or change-from-today line.

## Explain Mode

Use when the reader has not opened the PRD or prototype, asks what each version solves, or wants the user stories explained.

```markdown
# 零背景需求说明

## 给零背景客户领导的30秒说明
- 材料性质：产品经理提交前自评，不代表负责人已批准。
- 这是做什么（想法/方案/原型/试点/已上线）：
- 现在的问题：
- 谁受影响、他们的工作怎么变（相比今天）：
- 建议怎么改：
- 主要风险或还没确认的事：
- 需要决定的事项（由有权负责人确认）：

## 1. 证据边界
- 哪些版本有PRD、原型、需求说明和验收标准。
- 哪些内容是材料明确、原型验证、业务推导或材料缺失。

## 2. 这个产品到底在干什么
- 管理对象、主要角色、完整工作链路和产品边界。

## 3. 版本路线图
| 版本 | 正式主题 | 用户原来的阻碍 | 这版希望改变什么 | 证据状态 |
|---|---|---|---|---|

## 4. 逐版本用户故事
对每条核心需求说明：谁、在做什么、卡在哪里、怎么解决、价值、原型证明了什么、还不能证明什么。

## 5. 完整用户旅程
把不同版本串成一条真实工作路径。

## 6. 当前问题
- PRD问题。
- 原型实际问题。
- 术语、对象、责任、状态和页面语言问题。
- 历史证据缺口。

## 7. 判断
- 必须改。
- 可以保留。
- 仍需查证。
- 需有权负责人确认。
```

Do not lead Explain mode with P0/P1 terminology. Explain the work first, then introduce severity when it helps the reader understand the consequence.

## Gate Mode: Pre-Submission Self-Assessment

Use by default for submission readiness. This is the PM's self-assessment, not an owner approval or rejection.

The default Gate output has exactly five sections. Run every check in the skill workflow, but report only what changes the reader's decision. Do not restate the same finding in more than one section.

```markdown
# 提交前自评摘要

## 给零背景客户领导的30秒说明
- 材料性质：产品经理提交前自评，不代表负责人已批准。
- 这是做什么（想法/方案/原型/试点/已上线）：
- 现在的问题：
- 谁受影响、他们的工作怎么变（相比今天）：
- 建议怎么改：
- 主要风险或还没确认的事：
- 需要决定的事项（由有权负责人确认）：

## 1. 自评结论与下一步
自评结论：可以提交 / 补齐后提交 / 修复并复查后提交 / 需负责人确认后提交 / 需要重构，暂不建议提交

一句话判断：

判定要求：按 `review-rubric.md` 的有序规则选择下一步。未决定的核心前提进入负责人决策包；已写定且命中结构性触发条件的错误核心模型才判“需要重构”；可保留目标和主流程的有限修改判“修复并复查”。负责人决策不得掩盖产品经理应补的规则、建议和验收口径。

下一步：直接提交 / 产品经理补齐后提交 / 查证后提交 / 带决策包请负责人确认 / 组织专项评审 / 暂不提交并重构

领域与动作级别：一句话说明涉及领域、动作级别（只读/改业务数据/流程审批/操作控制），以及是否触及安全或合规红线。红线不适用时明确写“不适用”。

### 审核依据与引用
- 直接列出本次实际使用的文件、版本、章节或行号。
- 原型结论写明页面/状态，以及是静态观察还是实际测试；实际测试必须写路径和结果。
- 外部标准或 UI Skill 规则写明精确条款以及为什么适用。
- 缺少材料时写明缺什么，以及它限制了什么判断。

不要编造 `[需求-01]`、`[设计-01]` 之类的编号。Skill 名称本身不是充分依据。

## 2. 必须改与可以保留
| 结论性质 | 位置/测试路径 | 观察与证据标签 | 判定依据/适用性 | 大白话问题、角色与后果 | 级别/处理归属 | 修改与验收 |
|---|---|---|---|---|---|---|

可以保留：已成立的产品方向、故事、边界和设计，一到三条即可。

## 3. 仍需查证
| 待查事实 | 为什么影响判断 | 去哪里或找谁查 | 查证后更新什么 |
|---|---|---|---|

## 4. 需有权负责人确认
| 决策 | 有权决定的人 | 为什么现在要定 | 选项与后果 | 产品经理建议、依据与不确定性 | 不决定会卡住什么 | 是否阻塞提交 |
|---|---|---|---|---|---|---|
```

The default output ends at section 4. Add a `## 5. 附件` section only when at least one appendix trigger below fires, and list only the triggered appendices under it. Never emit an empty appendix heading.

Every row in section 2 carries its finding nature, observation, evidence label, judgment basis, applicability, severity, and handling owner, so the evidence boundary survives compression. Never let an appendix be the only place a P0 or P1 appears: put the finding in section 2 and use the appendix only for the supporting detail.

### Gate Appendices

Output an appendix only when its trigger fires. Keep each one to the rows that carry new information.

| Appendix | Trigger | Table |
|---|---|---|
| A. 领域现实性 | The material involves a professional, field, safety, production-control, device, or regulated workflow, or any action above read-only. | `检查项 / 结论` for 涉及领域与动作级别、使用依据、适用红线、现场或专家确认。 |
| B. 原型与证据 | A prototype, screenshot, or source artifact was inspected and the visible-versus-tested boundary or coverage gap affects more than one finding. | `核心故事 / PRD意图 / 原型可见 / 实际验证 / 缺口` |
| C. 对象、状态与责任一致性 | Two or more artifacts exist and a term, object granularity, state meaning, or responsibility conflict was found, or a core flow cannot be judged without ruling one out. | `概念或状态或动作 / PRD / 原型 / 源码或接口 / 谁负责 / 问题与标准口径` |
| D. 页面语言 | User-facing copy was reviewed and at least one delete, move, or rewrite is recommended. | `页面原话 / 谁会误解 / 实际风险 / 删除或迁移或改写或保留 / 推荐大白话` |
| E. 原始需求与业务闭环 | A core source need cannot be traced to the story, flow, product rule, or business-outcome acceptance; or the end-to-end flow contains a dead end, premature closure, loop, or contradiction. | `原始需求 / 当前阻碍 / PRD对应内容 / 断点或矛盾 / 应补规则 / 验收` |
| F. 集成与版本兼容 | The outcome crosses systems, products, devices, deployments, or versions and propagation, ownership, failure, migration, or compatibility affects a material finding. | `组合或变更 / 权威来源与方向 / 预期行为 / 失败或冲突处理 / 兼容或迁移规则 / 验收` |
| G. UI专项审查 | Frontend code exists, technical quality is in scope, and an available frontend-audit capability was run. | `触发原因 / 审查范围 / 覆盖状态 / 未覆盖内容 / 关键发现` |

When code already follows `DESIGN.md`, keep a pure preference optional. Ask product whether to modify `DESIGN.md` only when the proposal changes a reusable project-wide rule; name the affected section or token. A local authorized adjustment may proceed when it does not redefine the reusable system.

When appendix A's trigger fires, the appendix is required; the one-line domain statement in section 1 does not replace it. When the trigger does not fire, the one-line statement is the whole domain output.

Always give immediate next actions. Use the full Rework tables when the user asks for a correction plan or material gaps need one.

Before delivery, give only the 30-second block to a fresh-context reader when feasible. If the reader cannot retell the proposal and requested decision, rewrite the block before adding more detail.

## Rework Mode: Self-Correction List

Produce when the PM asks how to fix the material or when a full review finds material gaps. Do not present this as an owner instruction.

```markdown
# 产品需求自查整改清单

## 1. 自评结论与未解决阻塞
当前是否建议提交：
阻塞原因：

## 2. P0 必改项
| 编号 | 结论性质 | 位置/测试路径 | 观察证据 | 判定依据与适用性 | 为什么不行 | 应该怎么改 | 验收口径 |
|---|---|---|---|---|---|---|---|

## 3. P1 重要修改项
| 编号 | 结论性质 | 位置/测试路径 | 观察与判定依据 | 问题和后果 | 修改建议 | 验收/确认方式 |
|---|---|---|---|---|---|---|

## 4. PRD需补充
| 章节 | 需补内容 | 责任人/确认人 |
|---|---|---|

## 5. 原型需补充
| 页面 | 交互或状态 | 验收点 |
|---|---|---|

## 6. 用户故事与异常
| 用户故事 | 前置条件 | 正常流程 | 异常/权限 | 验收点 |
|---|---|---|---|---|

## 7. 术语、对象与责任
| 原文/字段 | 对应业务对象 | 标准名称 | 谁执行 | 谁负责到底 | 修改与验收 |
|---|---|---|---|---|---|

When a source-need trace or cross-system/version trigger fires, insert the applicable section below. Do not emit an empty section.

```markdown
## 原始需求与业务闭环
| 原始需求与证据 | 用户当前阻碍 | 对应故事和规则 | 流程断点或矛盾 | 修改建议 | 业务验收 |
|---|---|---|---|---|---|

## 集成、级联与版本兼容
| 系统/版本组合或变更 | 权威来源与同步方向 | 预期行为 | 失败、冲突与恢复 | 兼容、迁移或回滚 | 验收 |
|---|---|---|---|---|---|
```

## 8. 仍需查证
| 待查事实 | 影响 | 证据来源或查证人 | 查证动作 |
|---|---|---|---|

## 9. 需有权负责人确认
| 决策 | 有权决定的人 | 为什么现在要定 | 选项与后果 | 产品经理建议、依据与不确定性 | 不决定会卡住什么 |
|---|---|---|---|---|---|

## 10. 提交材料清单
- 更新后的PRD。
- 更新后的原型。
- 变更差异说明。
- 未采纳意见及理由。
- 已查证事实与证据位置。
- 已确认决策及确认人、时间和原始记录。
- 原始需求到业务验收的追踪结果；涉及多系统或多版本时，附集成拓扑、变更传播规则和兼容性矩阵。
```

## Full Mode

Compose:

1. Explain-mode product and version analysis.
2. A compressed Gate self-assessment using the five default sections; add a Gate appendix only when its trigger fires and the Explain section does not already carry the same table.
3. A proportionate correction plan. Use the full Rework tables only when material gaps exist or the user requests them.

Do not reproduce the full story tables in the Gate section.

## Prototype Acceptance Checks

When a requested prototype would otherwise require invented product behavior, output only three to five checks before any visual implementation begins:

```markdown
原型必须证明：

- 页面/状态：
  用户动作：
  可见结果：
  关键异常或边界：
  依据或待确认项：
```

Use only as many checks as the core flow needs. Do not create a separate contract file, repeat the full PRD, choose a UI implementation skill, or mix these checks with a frontend technical audit.

## Lightweight Reply

When the user explicitly asks for a quick judgment:

```markdown
自评结论：可以提交 / 补齐后提交 / 修复并复查后提交 / 需负责人确认后提交 / 需要重构，暂不建议提交

必须改：

可以保留：

仍需查证：

需有权负责人确认：
```
