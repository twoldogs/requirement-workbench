# Domain Reality Check

## Purpose

Prevent polished PRDs and prototypes from approving flows that cannot be executed in the real professional domain. Apply the check proportionately to the authority and operational risk of the feature.

Use this pass for power, HVAC, fire safety, weak-current, security, IT infrastructure, data-center O&M, monitoring, inspection, maintenance, incident command, production control, field work, permits, switching, remote control, alarm handling, emergency response, safety measures, or regulated audit evidence.

## Classify The Action Level First

| Level | Typical capability | Primary checks |
|---|---|---|
| L1 Read-only observation | Dashboard, asset query, mobile detail, 2D/3D location, report view | Data accuracy, authorization, masking, stale data, field readability, degradation, and misleading presentation. |
| L2 Business-data editing | Asset fields, roster, configuration, import, relation maintenance | Authoritative source, edit permission, validation, concurrency, change reason, rollback, and audit. |
| L3 Workflow and approval | Work order, incident, handover, permit workflow, responsibility transfer | Role legitimacy, responsibility continuity, mandatory approvals, evidence, escalation, and closure conditions. |
| L4 Operational control | Switching, reset, lockout removal, protection changes, control command, safety override | Tickets, permits, guardian, double-person operation, interlocks, isolation, production-control security, command confirmation, and fail-safe behavior. |

Do not apply L4 control requirements to an L1 read-only feature. Do not under-classify a button or workflow that can ultimately change equipment state.

## Separate Business Intent From Physical State

For devices, facilities, access, robots, and production systems, distinguish:

```text
business request -> command accepted -> physical action -> device/field confirmation
-> evidence validation -> business state update
```

A management platform may send a permitted high-level business request without becoming the low-level controller. Do not let a request status claim that equipment has stopped, switched, unlocked, reset, recovered, or become safe before the authoritative device/field confirmation exists.

Separate the accountable human/organization from the executing device, bot, contractor, or service. A device may execute work but must not become the business owner.

## Source Priority

Use evidence in this order:

1. Local company/product knowledge and project documents.
2. Customer operation manuals, SOPs, acceptance rules, and historical requirements.
3. National laws, regulations, standards, and official regulator publications.
4. Industry standards, equipment-vendor manuals, and credible professional sources.
5. General web sources only as weak hints.

If the answer depends on current laws, standards, security regulation, or external professional facts, search authoritative sources and cite them. Do not rely only on memory.

## Context To Extract

- Business domain, devices, systems, and physical work environment.
- Action level L1-L4 and whether authority changes across the flow.
- Read-only versus state-changing behavior.
- Remote control, command dispatch, cross-zone communication, or external integration.
- Ticket, permit, approval, guardian, double-person operation, or field confirmation requirements.
- Required logs, signatures, photos, attachments, timestamps, approval records, and handover evidence.
- Actions that must never be automated.
- The accountable role, actual executor, current handler, handover receiver, and escalation owner.

## Red Lines

### Power And Production Control

Flag potential P0 when:

- A work ticket, operation ticket, permit, or safety measure is reduced to a generic form without required responsible roles and closure steps.
- AI or a management-side workflow can directly execute switching, reset, lockout removal, or protection-setting changes without required authorization, monitoring, isolation, and confirmation.
- Five-prevention or anti-misoperation logic is bypassed or optional.
- A management-side workflow sends commands across production-control boundaries without security-architecture review.
- Required dispatch instruction, shift-lead approval, guardian, permit issuer, or double-person review is replaced by a generic assignee.

### Data Center Operations

Flag P0/P1 proportionately when:

- Alarm, inspection, maintenance, and duty workflows compute conflicting responsible persons instead of using an authoritative duty source.
- An incident closes without confirming equipment state, customer impact, unresolved risk, or handover.
- Handover omits open incidents, work orders, alarms, changes, or risks and relies only on free text.
- External contractors receive or close work without qualification, contract, access, or audit checks.
- A read-only capacity or location view shows inconsistent data that can materially mislead field or planning decisions.
- An inspection flow silently expands from non-invasive observation into cabinet opening, reset, switching, bypass, or other controlled operation without the required permit and safety process.
- A robot/device request is shown as safely completed before an authoritative device or field acknowledgement.

### Fire, Security, And Access Control

Flag potential P0 when:

- Fire-alarm handling becomes ordinary notification without confirmation, escalation, or site response.
- Access-control override lacks authorization, reason, time window, and audit trace.
- Cameras or monitoring links are treated as control authority rather than evidence or context.

## Output Requirement

In Gate, Rework, or Full mode, state:

- Relevant domain and action level.
- Evidence or authority used.
- Applicable red lines; say explicitly when none apply.
- Field-practice or expert-confirmation questions.
- Product changes or pre-release verification required.

Do not inflate a read-only integration gap into a proven safety P0. Use a conditional P0 when the risk depends on an unverified authorization or control path.
