# Terminology, Model, Responsibility, And Handoff

## When To Read

Read this reference when the review involves object relationships, configuration inheritance, fields, enums, states, permissions, responsibility, data sources, PRD/prototype/code consistency, or whether a new team can implement the design without verbal explanation.

## Goal

Determine whether the same product is being described consistently from business requirement through implementation. Do not approve a design whose terms look polished but point to different objects, actors, states, or data sources.

## 1. Establish The Object Tree

Write the smallest hierarchy that can explain the work. A common pattern is:

```text
policy or standard
  -> recurring plan
    -> generated task/instance
      -> point or work item
        -> assignment
          -> execution attempt
            -> evidence and item result
      -> final task result and downstream records
```

Adapt names to the domain. Do not force this exact hierarchy when the source materials support a different one.

For every object state:

- Name the object that owns the state.
- Name who or what may change it.
- Name the authoritative data source.
- Name the event or evidence that permits the transition.
- Name what the transition must not change.

Flag actions whose target is unclear. A button labelled `完成` is not reviewable until the object being completed and the completion rule are known.

## 2. Build The Cross-Artifact Term Map

Use this table when at least two artifacts exist:

| Concept | PRD term | User-story term | UI label | Code field/enum | Standard business name | Meaning/owner problem |
|---|---|---|---|---|---|---|

Check both directions:

- One concept has many names, causing duplicate fields or objects.
- One name is reused for different concepts, causing wrong state, permission, or responsibility.

Do not force raw code names into the UI. The UI may use plain business language while the implementation keeps a stable technical identifier, as long as the mapping is explicit.

## 3. Separate Similar-Looking Concepts

Keep these distinctions explicit when relevant:

- Plan versus generated task.
- Point/work item versus the individual checks inside it.
- Assignment versus execution attempt.
- Actual executor versus accountable person or organization.
- Current handler versus final accountable owner.
- Request versus acceptance versus execution versus confirmation.
- Evidence quality versus business result.
- Business abnormality versus execution failure versus integration/device failure.
- Configuration version versus deployment version versus task-time rule version.

Do not approve labels such as `责任`、`执行`、`状态` or `版本` when the page or data model does not say whose responsibility, which execution, which object state, or which version.

## 4. Test Multi-Level Rules With A Combination Table

For inheritance, overrides, constraints, fallback, or multi-level configuration, list the meaningful combinations:

| Parent/default | Plan choice | Item constraint | Runtime condition | Expected result | Reason | Publish/run outcome |
|---|---|---|---|---|---|---|

Include at least:

- Normal inherited behavior.
- Explicit override.
- Mixed items within one task.
- Empty intersection or direct conflict.
- Missing capability or permission.
- Runtime degradation.
- Allowed and forbidden fallback.
- Change after a task has already been generated.

Reject a design that makes a scenario appear valid by removing required items or hiding conflicts from completion statistics.

## 5. Build The Responsibility Continuity Matrix

Use only the roles relevant to the workflow, but distinguish them when they differ:

| Transition/action | Requester | Configurer | Approver | Dispatcher | Assignee/acceptor | Actual executor | Accountable owner | Handover receiver | Escalation owner | Audit evidence |
|---|---|---|---|---|---|---|---|---|---|---|

Check that:

- The authenticated actor is recorded server-side for material actions.
- A dispatcher cannot impersonate the assignee or actual executor.
- Proxy, reassignment, rejection, timeout, and absence have explicit handling.
- Devices and bots may execute, but do not occupy human/organization accountability fields.
- Handover changes current responsibility without rewriting historical execution.
- Every failure state has a next responsible party and an escalation route.

## 6. Trace State Claims To Evidence

For every material state, build this chain:

```text
trigger -> actor/device -> authoritative response or evidence
-> validation rule -> state transition -> audit record -> next responsibility
```

Treat these as different facts:

- The user clicked a button.
- A request was accepted by a service.
- The action was performed.
- The required evidence was captured.
- The evidence passed quality rules.
- A business result was chosen.
- A downstream ticket or handover was closed.

A checkbox can record a human declaration, but it cannot by itself prove a physical, safety, integration, or evidence-backed state. If a human declaration is the legitimate source, require actor, time, reason, scope, and audit history.

## 7. Check Implementation Handoff Readiness

A new implementation team should be able to answer without verbal supplementation:

- What are the core objects and stable identifiers?
- Which service owns each object and state?
- What is read, written, referenced, or projected from another domain?
- What does each user action change?
- Which roles can perform it?
- What is the success, failure, retry, timeout, cancellation, and correction behavior?
- What evidence proves completion?
- What is versioned, and when do changes take effect?
- What existing capability must be reused rather than copied?

If these answers are missing, classify the finding as implementation ambiguity or an owner decision according to impact; do not invent the contract.

## Review Output

When this check finds a material problem, state:

1. The conflicting source terms or behavior.
2. The real-world scenario that breaks.
3. The correct object, actor, or state boundary in plain language.
4. The source/owner decision still needed.
5. A testable implementation or acceptance rule.

