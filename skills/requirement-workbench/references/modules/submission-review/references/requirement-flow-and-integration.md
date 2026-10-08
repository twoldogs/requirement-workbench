# Original Need, End-To-End Flow, Integration, And Compatibility

## Contents

1. [Preserve The Original Need Before Reviewing The Solution](#1-preserve-the-original-need-before-reviewing-the-solution)
2. [Build A Requirement-To-Outcome Trace](#2-build-a-requirement-to-outcome-trace)
3. [Replay The Whole Business Flow](#3-replay-the-whole-business-flow)
4. [Draw The Integration Topology](#4-draw-the-integration-topology)
5. [Define The Change-Propagation Contract](#5-define-the-change-propagation-contract)
6. [Build The Version-Compatibility Matrix](#6-build-the-version-compatibility-matrix)
7. [Acceptance Must Prove The Business And Integration Outcome](#7-acceptance-must-prove-the-business-and-integration-outcome)
8. [Multi-Role Plain-Language Test](#8-multi-role-plain-language-test)
9. [Route The Result Correctly](#9-route-the-result-correctly)

## When To Read

Read this reference when the review must prove that a PRD still solves the original user problem, when a workflow crosses roles or systems, or when the requirement involves integration, northbound/southbound data, upstream/downstream platforms, cascading changes, synchronization, migration, mixed deployments, or old/new-version compatibility.

## Goal

Prevent a locally polished feature from failing the real business outcome. A review must connect the original need to a complete workflow and, when systems interact, to an implementable and testable contract across the versions customers actually run.

## 1. Preserve The Original Need Before Reviewing The Solution

Record the source separately from the proposed feature:

| Source and evidence label | Affected role and situation | Current action or workaround | Actual blocker | Desired business outcome | Proposed feature |
|---|---|---|---|---|---|

Rules:

- Quote or closely preserve the original customer statement when available.
- Keep a requested page, button, automation, report, API, or field separate from the underlying problem it is meant to solve.
- Mark reconstructed roles, blockers, or value as `业务推导`, not as the original demand.
- If the source material contains several different problems, do not merge them into one generic user story.
- If the PRD changes the problem statement, identify who authorized that change and where it was recorded.

## 2. Build A Requirement-To-Outcome Trace

For every core need, trace:

```text
source problem -> user story -> product rule -> affected object and state
-> end-to-end flow -> prototype or implementation contract
-> acceptance scenario -> evidence of the business outcome
```

When generating or revising a PRD, write the story rather than leaving it implicit:

> 作为 `[角色]`，当 `[真实工作场景或触发]` 时，我希望 `[具体能力]`，从而 `[可观察的业务结果]`。

Immediately below it, state the current blocker, evidence status, and any missing fact or decision. Each core story must point to its main flow, exception cases, responsible roles, and acceptance scenarios.

Use this table when the chain is not obvious:

| Core need | Story/rule | Flow step | Product surface or contract | Acceptance | Gap or contradiction |
|---|---|---|---|---|---|

Fail the trace when:

- The PRD implements the named feature but leaves the user's original blocker unchanged.
- Acceptance proves that a page opens, a button is visible, or an API returns success, but not that the user can complete the intended work.
- A secondary convenience feature is complete while the core outcome has no rule or evidence.
- The source says one problem, the PRD solves another, and no decision record explains the change.
- A core need appears in the summary but has no story, flow, owner, exception path, or acceptance criterion.

## 3. Replay The Whole Business Flow

Adapt this skeleton to the actual domain:

```text
trigger -> intake -> validation -> assignment -> execution
-> acknowledgement -> evidence -> business decision
-> upstream/downstream update -> closure -> correction or reopening
```

For every meaningful step, record:

| Step | Actor | Business object and state | Input/evidence | Action | Result/next state | Next responsible party | Failure or recovery |
|---|---|---|---|---|---|---|---|

Check for:

- No entry, no exit, or no path back after an exception.
- A waiting state with no timeout, owner, escalation, or user-visible next action.
- A handover that changes the current handler but loses final accountability or history.
- A success message before execution, evidence, or downstream acknowledgement.
- A closed task while a required downstream update, exception, or manual follow-up remains open.
- Two sections, pages, systems, or acceptance cases that assign different meanings to the same object or state.
- Reports, notifications, and list/detail views that count or describe the same event differently.

Use one normal scenario and at least one realistic failure, degraded, retry, cancellation, correction, or late-arrival scenario. Add more only when the domain makes them material.

## 4. Draw The Integration Topology

Do not review `上游`、`下游`、`北向` or `南向` as self-explanatory labels. These words are relative to a system boundary.

| System/device | Role in this flow | Produces | Consumes | Authoritative objects/fields | Allowed writes | Trigger/transport | Acknowledgement | Deployed versions |
|---|---|---|---|---|---|---|---|---|

Confirm:

- Which system owns the business object, field, rule, state, and audit record.
- Which side initiates each interaction and which side can reject it.
- Whether data is pushed, pulled, subscribed, imported, manually refreshed, or reconciled.
- Which stable identifier crosses the boundary; names and display labels must not be used as identity unless the contract explicitly requires it.
- Whether a result means request received, change applied, data validated, or business completion.
- Which user sees delay, stale data, failure, conflict, or unsupported capability and what they can do next.

## 5. Define The Change-Propagation Contract

For each applicable change, decide what crosses the boundary:

| Change | Source of truth | Propagates to | Field/rule mapping | Effective time | Conflict precedence | Failure/retry | Audit and user result |
|---|---|---|---|---|---|---|---|
| Create | | | | | | | |
| Update | | | | | | | |
| Rename | | | | | | | |
| Move/re-parent | | | | | | | |
| Disable/enable | | | | | | | |
| Delete/restore | | | | | | | |
| Merge/split | | | | | | | |
| Rule or threshold change | | | | | | | |
| State change | | | | | | | |

Do not assume that two products from the same company should synchronize everything. Decide which data is shared, referenced, copied, or independently maintained.

For automatic or bidirectional propagation, require:

- Stable identity and origin metadata.
- Version or revision comparison.
- Idempotency for retries.
- Ordering and late-arrival handling.
- Loop prevention for bidirectional updates.
- Conflict detection and an explicit winner or manual resolution path.
- Partial-failure visibility, retry or compensation, and reconciliation.
- Audit records that show the source, actor, time, old value, new value, target systems, and final result.

## 6. Build The Version-Compatibility Matrix

Use the combinations customers can actually deploy, not only the newest pair:

| Upper/consumer side | Lower/provider side | Contract/capability | Expected behavior | User-visible degradation | Upgrade/rollback/migration rule | Acceptance evidence |
|---|---|---|---|---|---|---|
| Current | Current | | | | | |
| Current | Legacy | | | | | |
| Legacy | Current | | | | | |
| Legacy | Legacy | | | | | |
| Mixed or rolling upgrade | Mixed | | | | | |
| Current | Third party | | | | | |
| Disconnected/degraded | Any | | | | | |

Check:

- Capability negotiation or a version handshake before using a newer operation.
- Backward- and forward-compatible field, enum, event, and error handling.
- Unknown fields, missing fields, renamed fields, and changed meanings.
- Whether a newer producer can safely downgrade or suppress unsupported data for an older consumer.
- Whether an older producer leaves the newer consumer with a clear unsupported or incomplete state instead of false success.
- Rolling upgrade, mixed-node behavior, rollback, old-data migration, and reconciliation after reconnection.
- Support-window and third-party boundaries, including what is explicitly unsupported.

Do not turn missing compatibility evidence into a guessed contract. Mark observed version distribution and documented API behavior as facts to verify. Route supported product combinations, compatibility promises, and commercial support boundaries to the authorized owner when they are genuine product decisions.

## 7. Acceptance Must Prove The Business And Integration Outcome

For a core integration story, acceptance should cover:

- The representative end-to-end business outcome, not only transport success.
- At least one same-version success path.
- Every supported mixed-version category that changes behavior.
- Rename or rule-change propagation when names or rules are shared.
- Duplicate, late, out-of-order, retry, partial-failure, and reconciliation behavior when applicable.
- A visible and actionable result for unsupported, disconnected, stale, or rejected cases.
- Audit evidence and responsibility after success and failure.
- No duplicate authoritative records, double counting, silent overwrite, or false completion.

## 8. Multi-Role Plain-Language Test

After the correction, give each role only the part they would normally receive:

- Frontline user: Can they say what happened, what is affected, what to do next, and who owns the next step?
- Product manager or accountable owner: Can they state the original problem, intended outcome, scope, main risk, unresolved decision, and acceptance boundary?
- Implementation recipient: Can they identify objects, ownership, direction, version behavior, success, failure, retry, conflict, audit, and test cases without a meeting?
- Zero-background customer leader: Can they retell what changes from today, who benefits, what can go wrong, and what decision is needed?

If a role can only repeat internal terms such as `统一主账`、`北向同步`、`能力级联` or `兼容旧版` without explaining the actual behavior, the PRD is not yet understandable.

Do not leave the product manager with unexplained implementation shorthand. Pair the term with the product behavior the first time it appears:

- `幂等`: the same change may be delivered more than once without creating duplicate objects, duplicate updates, or duplicate statistics.
- `乱序处理`: an older late-arriving change must not overwrite a newer confirmed value.
- `循环防护`: a change synchronized from one side must not bounce back and trigger endless updates.
- `补偿或对账`: after partial failure or reconnection, compare both sides, show the differences, and either repair them automatically under a defined rule or assign a person to resolve them.
- `能力协商`: check the connected product and version before sending a change, then choose supported, degraded, blocked, or manual behavior.

The PRD may keep the technical term in an implementation section, but the business rule, user-visible result, responsibility, and acceptance criterion must be understandable without knowing that term.

## 9. Route The Result Correctly

- `产品经理可处理`: missing story-to-flow mapping, unclear copy, omitted exception, incomplete matrix, inconsistent field names, and absent acceptance cases within an agreed boundary.
- `仍需查证`: deployed-version distribution, existing API behavior, current field mapping, actual upstream/downstream ownership, logs, and available acknowledgements.
- `需有权负责人确认`: authoritative ownership, supported product combinations, conflict precedence, compatibility promise, migration responsibility, paid versus included integration scope, or a main-flow change outside the PM's authority.

The PM should still prepare options, a recommendation, consequences, and testable acceptance. Owner confirmation does not excuse an empty PRD.
