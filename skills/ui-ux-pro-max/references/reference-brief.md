# Reference Brief

Use this template to turn UI/UX research and external design samples into a de-branded, reviewable handoff. Keep it under the project at `_analysis/design-research/<run-id>/REFERENCE-BRIEF.md`.

```yaml
---
project: <project name>
run_id: <stable run id>
created_at: <ISO-8601 timestamp>
status: draft # draft | user-approved | consumed | superseded
sources:
  - id: <stable source id>
    type: <local-design-md | url | screenshot | product-code | interview>
    path_or_url: <source location>
    captured_at: <ISO-8601 timestamp or unknown>
    scope: <what was inspected>
    evidence_level: <primary | secondary | inferred | unknown>
    license_note: <known terms or unknown>
---
```

## Task and constraints

State the product, audience, primary page goal, technical constraints, accessibility needs, and non-goals.

## Facts

Record only directly supported observations and cite `sources[].id`.

## Inferences

Record interpretations separately. Explain the evidence and uncertainty.

## Adopted decisions

Write de-branded, implementable principles. Describe relationships and roles rather than copying exact external values.

## Rejected directions and anti-references

Record what must not be carried into the project and why.

## Unresolved decisions

List decisions that still need user approval. Mark each as `material` or `non-material`. Contract generation stops while any material item remains unresolved.

## Contract generation instructions

Map the approved content into the canonical root `DESIGN.md` sections: Overview, Colors, Typography, Layout, Elevation & Depth, Shapes, Components, and Do's and Don'ts. Raw external brand sources are not inputs to the contract or implementation phases.
