# Full Product Requirement Template

Read this file only for an explicit request for a complete, formal, implementation-handoff PRD. Do not use it for minimum, brief, preliminary, idea-stage, or one-sentence requests.

Before using it, require enough evidence or owner decisions to define the core user, problem, product boundary, responsibility, authoritative data, and main flow. Otherwise return the minimum requirement plus a decision queue.

```markdown
# 产品需求名称

## 1. 摘要
- 需求阶段：
- 目标版本或试点范围：
- 当前需要的决定：

## 2. 问题、场景与证据
- 目标角色：
- 重复场景和触发：
- 当前流程与替代办法：
- 当前办法不足：
- 影响：
- 材料明确 / 实际验证 / 业务推导 / 材料缺失：

## 3. 现有能力与产品边界
| 现有能力 | 保留 | 改造 | 新增 | 退出 | 证据/未知 |
|---|---|---|---|---|---|
- 标准产品与项目定制边界：
- 外部系统、供应商或硬件责任：

## 4. 目标、非目标与成功定义
- 目标：
- 非目标：
- 可观察成功结果：
- 未确认指标的维度、测量方法和负责人：

## 5. 角色、权限与责任
| 角色 | 触发/任务 | 可做 | 不可做 | 最终责任/交接 |
|---|---|---|---|---|

## 6. 核心用户故事

## 7. 对象、状态与数据
| 业务对象 | 唯一业务标识 | 状态 | 谁可改变 | 依据/权威来源 | 下一责任人 |
|---|---|---|---|---|---|

## 8. 规则与组合
- 默认、继承、覆盖、冲突、回退、生效时间：

## 9. 交互、页面或接口要求
- 用户需要看到什么，据此做什么：
- 每个关键动作改变哪个业务对象：
- 数据来源、读写范围和更新时机：
- 与已有页面、流程或接口的关系：

## 10. 异常与降级
- 空数据、无权限、失败、超时、重复、离线、交接、取消、纠错：

## 11. 验收标准

## 12. 依赖、迁移、审计和退出

## 13. 风险与待拍板事项
| 决策/缺口 | 建议 | 影响 | 确认人或证据 |
|---|---|---|---|
```

Do not use the existence of a section as permission to invent content. A formal PRD may still contain explicit `待确认`, but unresolved core decisions must remain outside approved scope.

