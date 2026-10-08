# Object, State, Responsibility, And Rules

## Build The Smallest Object Tree

A common workflow may contain:

```text
policy or standard
  -> recurring plan
    -> generated task
      -> work item or point
        -> assignment
          -> execution attempt
            -> evidence and item result
      -> final task result and downstream record
```

Use source-backed domain names. Do not force this hierarchy when the actual work differs.

For each object answer:

- What uniquely identifies it in the business?
- Who owns its meaning and authoritative data?
- Which states belong to it?
- Which actions may change it?
- What event or evidence permits the change?
- What must not change with it?

A button labeled `完成` is not a requirement until the completed object and rule are clear.

## Term Map

When multiple artifacts exist, map them:

| Concept | Source term | User-story term | UI label | Code/API term | Standard business name | Owner/meaning gap |
|---|---|---|---|---|---|---|

Check both failures:

- One concept has many names, causing duplicate objects or fields.
- One name describes different concepts, causing wrong state, permission, or statistics.

Plain UI language may differ from a stable technical identifier, but the mapping must be explicit.

## Separate Similar Concepts

Keep separate when relevant:

- Plan versus generated task.
- Task item versus execution attempt.
- Assignment versus actual execution.
- Current handler versus accountable owner.
- Request versus acceptance versus execution versus confirmation.
- Evidence quality versus business result.
- Business exception versus execution failure versus integration/device failure.
- Configuration version versus deployment version versus task-time rule version.

## State Transition Table

| Object | From | Trigger/action | Allowed actor/device | Evidence/response | To | Audit data | Next owner |
|---|---|---|---|---|---|---|---|

Test normal, rejection, cancellation, timeout, duplicate request, retry, correction, and handover as appropriate.

## Responsibility Continuity

Use only relevant roles, but distinguish them before merging:

| Transition/action | Requester | Configurer | Approver | Dispatcher | Assignee | Actual executor | Accountable owner | Handover receiver | Escalation owner |
|---|---|---|---|---|---|---|---|---|---|

Rules:

- Record the authenticated actor for material actions.
- A dispatcher cannot silently impersonate an assignee or executor.
- Reassignment, proxy, rejection, timeout, and absence need explicit handling.
- Devices, bots, queues, and services may execute but do not occupy human or organizational accountability fields.
- Handover changes current responsibility without rewriting historical execution.
- Every failure state has a next actor or an explicit terminal outcome.

## Permission Is Not Responsibility

For each action distinguish:

- Who may see it.
- Who may initiate it.
- Who may approve it.
- Who actually performs it.
- Who confirms the result.
- Who remains accountable.

Client-side hiding does not prove server authorization. At requirement stage, specify the business permission and required audit behavior; do not claim implementation closure.

## Rule Combination Table

Use when rules inherit, override, conflict, fall back, or change over time:

| Parent/default | Local choice | Item constraint | Runtime condition | Expected result | Publish/run outcome | Reason |
|---|---|---|---|---|---|---|

Include:

- Normal inheritance.
- Explicit override.
- Mixed items in one task.
- Direct conflict or empty intersection.
- Missing capability or permission.
- Runtime degradation.
- Allowed and forbidden fallback.
- Configuration change after task generation.

Do not make a scenario pass by removing required items or hiding conflicts from completion statistics.

## Authoritative Data

For each material field or state record:

| Fact | Authoritative source | Read/write/reference | Update event | Conflict rule | Owner | Audit/correction |
|---|---|---|---|---|---|---|

Avoid two pages or systems each acting as the final source. If synchronization is required, define direction, delay, conflict, failure, retry, correction, and ownership.

## Handoff Readiness

A new engineering and test team should be able to answer without a meeting:

- What are the business objects and stable identifiers?
- What does each user action change?
- Which role may act and which role is accountable?
- What source proves a state?
- What happens on success, failure, retry, timeout, cancellation, correction, and handover?
- What is versioned and when do rule changes take effect?
- What existing capability must be reused?

If an answer is missing, mark implementation ambiguity or owner decision. Do not invent the contract.

