# Version And User-Story Analysis

## When To Use

Read this reference when the user asks what each version solves, requests a zero-context explanation, supplies multiple versions, or needs historical requirements mapped to current product behavior.

## Start With The Product Mental Model

Explain the product using the user's work rather than internal module names:

- What object or responsibility is being managed?
- What happens before, during, and after the target workflow?
- Which roles touch it?
- What questions or decisions does the product help them answer?
- What actions remain outside the product boundary?

Keep this section concrete and short enough to orient a reader who has not opened the PRD or prototype.

## Establish The Existing Baseline

When the target is an upgrade, reconstruction, or migration, build:

| Existing capability | Keep | Change | Add | Retire | Evidence |
|---|---|---|---|---|---|

Do not describe the new version as creating a capability from scratch when an existing entry, object, workflow, or data source already exists. Do not claim an old design is implemented or released without status evidence.

## Build A Version Evidence Map

For each version, capture:

| Field | Rule |
|---|---|
| Official theme | Use the source title exactly. |
| Analytical summary | Add a plain-language theme only when clearly marked as analysis. |
| Requirement IDs | Include every requirement in scope. |
| Status | Preserve exact states such as designed, suspended, accepted, or released. |
| Available evidence | List PRD, annotations, screens, tested interactions, and acceptance records separately. |
| Missing evidence | Identify absent historical PRDs, roles, reasons, exceptions, and acceptance criteria. |

Do not turn a collection of small usability changes into a fabricated strategic phase. Do not describe a suspended item as solved.

Track term drift when versions or artifacts use different names:

| Concept | Earlier official name | Current official name | UI/code aliases | Same meaning? | Decision/evidence |
|---|---|---|---|---|---|

Preserve historical official names while identifying the current standard name. Do not treat spelling variants as separate capabilities or collapse genuinely different concepts into one label.

## Reconstruct Each User Story

Use this order:

1. Role and real work pattern.
2. Trigger or usage context.
3. Current user action.
4. Current blocker.
5. Intended product change.
6. Business value.
7. Preconditions and data objects.
8. Permissions and forbidden actions.
9. Main success flow.
10. Exception branches.
11. Acceptance criteria.
12. Evidence label and missing information.

Write the compact story as:

> 作为 `[角色]`，当 `[场景/触发]` 时，我希望 `[能力]`，从而 `[业务价值]`。

If the role, blocker, or value is inferred, say so immediately after the story.

## Explain Version Evolution

For each transition, answer:

```text
Previous user workflow
  -> unresolved blocker
  -> new version change
  -> resulting user capability
  -> remaining gap or next-version trigger
```

Then connect the versions into one end-to-end user journey. Do not imply that every version is a separate product or that the first visible version created the entire product from scratch.

## Separate Intended, Designed, And Proven States

Use these meanings consistently:

| State | Meaning |
|---|---|
| Intended | PRD or requirement states the target behavior. |
| Designed | Prototype or interaction specification represents the behavior. |
| Demonstrated | The prototype supports the tested interaction path. |
| Implemented | Product code and relevant service behavior exist. |
| Integrated | Required external systems and authoritative data sources are connected. |
| Accepted | Acceptance evidence confirms required scenarios. |
| Released | The capability is available in the target product release. |
| Suspended | Do not count the item as solved or committed. |

Do not upgrade one state into another without evidence.

## Required Explain-Mode Output

Use this order unless the user requests another structure:

1. Evidence boundary.
2. What the product does in plain language.
3. Version roadmap.
4. Per-version role, action, blocker, intended solution, evidence, and unknowns.
5. End-to-end user journey.
6. PRD-prototype consistency and concrete problems.
7. Must change, can keep, and needs owner decision.
