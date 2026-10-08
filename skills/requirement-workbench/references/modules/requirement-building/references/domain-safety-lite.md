# Proportionate Domain And Safety Check

## Classify The Action

| Level | Action | Typical risk |
|---|---|---|
| L1 | Read-only observation | Wrong or stale information may mislead. |
| L2 | Business-data editing | Permission, audit, correction, and data ownership matter. |
| L3 | Workflow, approval, dispatch, or acceptance | Responsibility, segregation of duty, and closure evidence matter. |
| L4 | Physical or operational control | Permit, interlock, confirmation, external acknowledgement, fallback, and field safety may be mandatory. |

Apply checks proportionately. Do not turn every management page into an L4 system, but do not hide a control action behind a friendly UI label.

## High-Risk Questions

When a requirement can affect equipment, power, fire protection, access, industrial processes, medical decisions, money movement, or regulated records, ask:

- Is the product observing, requesting, approving, or directly controlling?
- Which system or person has final authority?
- What permit, approval, interlock, double confirmation, or field condition is source-backed?
- What response proves the request was accepted and the action executed?
- What happens on timeout, stale state, duplicate, partial success, loss of connection, or conflicting local action?
- Is there a safe manual fallback and a named accountable owner?
- Can the action be cancelled or reversed, and what evidence remains?

## Requirement Boundary

Separate:

- Product behavior.
- Delivery/project configuration.
- External-system integration.
- Hardware or vendor responsibility.
- On-site operating procedure.
- Legal, regulatory, or professional confirmation.

Do not invent safety rules from general knowledge. When a domain rule affects approval, control, or acceptance, use authoritative current sources or require the appropriate owner/expert to confirm it.

## Conditional Risk

Use `条件性阻断` when a specific unverified fact would make the design unsafe or unapprovable. State:

- The condition.
- The consequence if true.
- The evidence required.
- The owner who can resolve it.

Do not state an unverified server-side, device, legal, or production fact as a confirmed defect.

## Prototype Boundary

A prototype may verify comprehension and interaction. It cannot prove:

- A physical action occurred.
- Interlocks or permits are enforced.
- External data is authoritative.
- Server authorization is correct.
- Failover and recovery work in production.
- A legal or compliance requirement is satisfied.

Label simulated controls visibly and keep them out of normal user-facing product copy when the prototype is shared.

## Minimum Acceptance For High-Risk State

Trace:

```text
trigger -> authenticated actor/device -> approval/permit
-> authoritative response -> validation -> state transition
-> audit record -> next responsibility -> failure fallback
```

If any required link is unknown, keep it as an owner decision or pre-release verification. Do not complete the requirement by guessing.

