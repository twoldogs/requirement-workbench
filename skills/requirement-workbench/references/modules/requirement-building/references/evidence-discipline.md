# Evidence And Intake Discipline

## Evidence Labels

| Label | Meaning | Allowed use |
|---|---|---|
| 材料明确 | Directly stated in a requirement, meeting decision, manual, released rule, or supplied source | State as a fact and name the source. |
| 实际验证 | Observed by navigating, clicking, querying, testing, or inspecting the actual artifact | State only the tested path and result. |
| 业务推导 | A reasonable interpretation needed to continue | Explain the basis and keep it open to correction. |
| 材料缺失 | Available evidence cannot answer the question | State what is unknown and who or what can resolve it. |

Do not silently upgrade `业务推导` to a source fact. Do not downgrade a source conflict into stylistic wording.

## Minimum Evidence For A Demand

Test this chain:

```text
real pain -> repeated scenario -> current method insufficient
-> proposed change supports a decision or action -> reusable value
```

Missing evidence does not automatically make a demand fake. It limits confidence and tells the author what to verify.

For a solution-first request such as `add a dashboard`, recover:

- Who experiences the problem.
- What triggers it and how often it recurs.
- What the person does now.
- Where the current action fails or costs effort.
- What decision or action the new capability should enable.
- What evidence would show the problem is reduced.

Never invent the requester's motive, customer count, priority, ROI, deadline, or success metric. An unsupported number remains invented even when marked `推测`, `示例`, or `< X`.

## Existing-Product Baseline

Before creating a new module, object, workflow, report, or data source, inspect relevant material inside the user-authorized scope.

| Existing capability | Keep | Change | Add | Retire | Evidence/unknown |
|---|---|---|---|---|---|

If the scope or repository is not available, state `现有能力未核实`. Do not ask a new engineer to prove the entire platform lacks a feature, and do not let the AI search unrelated disks.

## State Claims Require Evidence

For every material claim such as `完成`, `合格`, `已批准`, `已接收`, `安全`, `已同步`, or `已闭环`, identify:

- The object whose state changed.
- The actor or device that produced the source fact.
- The authoritative response or evidence.
- The validation rule.
- Time, scope, reason, and audit identity.
- The next responsible party.

Keep the chain separate:

```text
request -> acknowledgement -> execution -> evidence captured
-> evidence validated -> business conclusion -> downstream closure
```

A button, checkbox, sample row, client variable, mock callback, or success toast proves only what happened in that artifact. It does not prove external execution or production state.

## Lifecycle Accuracy

Label the current stage: raw idea, requirement draft, approved requirement, design, prototype, tested path, implementation, integration, acceptance, release, or production behavior.

Use one simple rule: do not write an idea or design as if it has already been implemented. Avoid repeatedly policing the phrase `设计完成`; correct the underlying lifecycle claim instead.

## Missing Inputs

Continue when a reversible partial result is possible. Ask only when a missing answer changes:

- Product boundary or core user.
- Accountable owner or permission.
- Authoritative data source.
- Safety/compliance boundary.
- Main flow or completion rule.

Ask one highest-dependency question. Put all other gaps in a decision register:

| Question | Why it matters | Evidence or owner needed | Affected sections |
|---|---|---|---|

## Requirement Versus Technical Design

Product requirement depth:

- Business object and stable meaning, not table DDL.
- User/business action and observable result, not class design.
- Integration responsibility and business response, not invented HTTP methods.
- Permission and audit outcome, not implementation middleware.
- Performance or availability target only when the baseline or owner decision exists.

Technical constraints explicitly supplied by engineering remain valid facts. Do not delete them; place them under constraints or implementation notes and keep them separate from the user need. Apply the source-locatable technical-fact rule in `SKILL.md` Hard Output Rules: a current value remains a current fact, not a target or acceptance threshold.
