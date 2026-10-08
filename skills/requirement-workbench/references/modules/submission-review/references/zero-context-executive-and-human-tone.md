# Zero-Context Executive Comprehension And Human Tone

## Contents

1. [Run The 30-Second Decision Test](#1-run-the-30-second-decision-test)
2. [Run A Fresh-Context Teach-Back Test](#2-run-a-fresh-context-teach-back-test)
3. [Detect Insider-Only Writing](#3-detect-insider-only-writing)
4. [Detect AI-Like Or Machine-Written Patterns](#4-detect-ai-like-or-machine-written-patterns)
5. [Rewrite Without Losing The Product](#5-rewrite-without-losing-the-product)
6. [Use A Standalone Executive Summary](#6-use-a-standalone-executive-summary)
7. [Grade The Result](#7-grade-the-result)

## When To Read

Read this reference when a PRD, prototype, proposal, owner brief, or review must be understood by a customer leader or another reader who has not followed the project, does not know the internal object model, and should not need a product manager beside them to translate it. Also read it when the user asks whether text has AI flavor, machine-like wording, business jargon, translation style, or poor human readability.

## The Reader Is Context-Free, Not Unintelligent

Treat the zero-background customer leader as an experienced decision maker who lacks this project's vocabulary and history. They care about the problem, affected people, operating change, risk, cost or effort when known, responsibility, and the decision required.

Do not:

- Talk down to the reader or replace professional content with childish analogies.
- Remove a necessary technical term merely because it is unfamiliar.
- Assume the reader knows internal abbreviations, product history, object relationships, system boundaries, or why the proposal exists.
- Use `领导能看懂` as permission to hide evidence gaps, risks, cost, dependencies, or uncertainty.

Human tone in a professional decision document means that a real person states concrete facts, makes a bounded judgment, names responsibility, and admits uncertainty. It does not require first-person emotion, humor, deliberate messiness, internet slang, or casual analogies.

## 1. Run The 30-Second Decision Test

Give the reader only the first-screen explanation or decision summary. They should be able to answer:

1. What is being proposed, and is it an idea, design, prototype, pilot, tested behavior, or current production capability?
2. What current problem does it solve, and why is a decision needed now?
3. Who will use it, and what will they do differently?
4. What changes from today's process or system?
5. What is the main risk, dependency, cost uncertainty, or unconfirmed premise?
6. What decision or approval is requested now?

Fail the test when any core answer must be reconstructed from an acronym, architecture diagram, hidden product history, unexplained object model, or verbal explanation from the author.

Do not reward polished wording when the requested decision is still missing.

## 2. Run A Fresh-Context Teach-Back Test

Use this test for externally shared, high-stakes, owner-decision, or explicitly requested zero-background material.

1. Prepare the shortest candidate summary that is intended to stand on its own.
2. Give only that summary to a fresh reader or subagent. Do not provide the PRD, glossary, review findings, expected answer, or the author's explanation.
3. Ask the reader to retell: what the product does, the current problem, the affected user, the proposed change, the main risk or unknown, and the decision needed.
4. Compare the retelling with the source evidence.

Pass when the retelling preserves the main product, decision, responsibility, risk, and evidence boundary without inventing authority or capability.

Fail when the reader:

- Cannot name the requested decision.
- Confuses current capability, proposed scope, and future possibility.
- Assigns work or accountability to the wrong person, organization, system, or device.
- Misses a material risk because it was buried in technical detail.
- Can only repeat slogans such as `统一底座`、`全链路` or `形成闭环` without explaining the actual operating change.

## 3. Detect Insider-Only Writing

Treat the material as insider-dependent when it relies on one or more of these patterns:

- The subject is omitted: the reader cannot tell who configures, approves, executes, accepts, or remains accountable.
- The object is omitted: words such as `完成`、`接入`、`接管` or `恢复` do not say what changed state.
- The action is hidden inside a noun pile: for example, `多业务协同能力承接机制` instead of who sends what to whom and what happens next.
- An abbreviation, enum, internal service name, or architecture term carries the main meaning without an inline explanation.
- The text states a solution before the current problem, so readers must guess why the feature exists.
- The proposal assumes knowledge of earlier versions, meetings, or existing pages that are not shown.
- The comparison point is missing: `提升效率` does not say which step is removed, shortened, or made safer.
- Responsibility is implied through phrases such as `系统兜底`、`机器人闭环` or `平台承接` rather than naming the accountable human or organization.

If a smart domain insider can infer the intended meaning but a reasonable new reader cannot, record a comprehension defect. Do not excuse it as `需要业务背景` unless the target audience was explicitly limited to trained specialists.

## 4. Detect AI-Like Or Machine-Written Patterns

Judge the communication result, not the suspected author. A single word, phrase list, regex hit, or style score is not proof of AI authorship and cannot decide whether material passes.

Do not build the review around banned words. Words such as `闭环`、`协同`、`底座` or `本质上` can be precise in one context and empty in another. The reviewer must inspect the sentence's job, evidence, audience, and consequence.

### Run Reasoning Tests Before Phrase Tests

- **Paragraph-job test**: Name what each paragraph contributes: fact, explanation, decision, risk, action, evidence, or boundary. If it contributes none, it is probably filler.
- **Product-substitution test**: Replace the product, industry, and role with an unrelated one. If the paragraph still sounds equally valid, it is generic and does not explain this product.
- **Subject-action-result test**: Ask who does what to which object, what changes, and who acts next. If those answers exist only in the reviewer's imagination, the text is insider-dependent.
- **Evidence-pressure test**: Ask which claim is source fact, tested behavior, inference, proposal, or unknown. Smooth prose that collapses these states is not trustworthy.
- **Teach-back test**: Ask a fresh reader to retell the proposal and decision without repeating the original wording. Correct paraphrase matters more than keyword recognition.
- **Read-aloud test**: Read the paragraph once at normal speed. If it sounds like a speech, slogan, or template announcing importance rather than a person explaining work, identify the missing fact or decision instead of merely swapping words.

Use the pattern families below only to locate places that deserve those reasoning tests.

### Empty Narration And Significance

- `本质上`、`归根结底`、`值得注意的是`、`这意味着` used to announce a conclusion that could be stated directly.
- Statements that call a change `系统性重构`、`关键转折` or `能力跃迁` without naming the operating change.
- A generic optimistic ending such as `建议尽快推进落地` with no scope, dependency, owner decision, or acceptance condition.

### Formula And Performance

- Repeated `不是 X，而是 Y` or `不仅是 X，更是 Y` structures that manufacture importance.
- Mechanical three-part lists, symmetrical headings, or sentences with nearly identical length and rhythm.
- Narrator voice that explains what the document is doing instead of stating the fact, decision, or risk.
- A final paragraph that repeats earlier headings without adding a decision or next action.

### Business-Jargon Chains

- Dense chains such as `赋能、抓手、闭环、对齐、收敛、承接、沉淀、打通、拉通、能力底座、统一主账、业务投影、全链路`.
- Keep a term when it has an agreed, precise domain meaning. Define it once in ordinary business language and avoid stacking it with other abstractions.
- Do not replace a chain mechanically. First recover the missing actor, action, object, evidence, and consequence. If they cannot be recovered from the source, mark the content as missing instead of inventing a concrete sentence.

### Translation Style And False Authority

- Long modifiers, passive stacking, repeated `基于......通过......实现......`, or a sentence that can be translated word-for-word back into English.
- Vague authority such as `行业普遍认为`、`专家指出` or `数据表明` without a named source.
- Excessive hedging that avoids a clear evidence status, or excessive certainty that hides missing evidence.

## 5. Rewrite Without Losing The Product

Run two separate passes.

### Pass 1: Fidelity

Protect:

- Source facts, numbers, dates, names, and direct quotations.
- Necessary technical terms, field names, API names, state names, and audit identifiers.
- Role, responsibility, permission, safety, and evidence boundaries.
- The difference between current capability, proposed behavior, tested prototype behavior, and future possibility.
- Known unknowns, dependencies, cost uncertainty, and decisions still awaiting approval.

If a sentence cannot be simplified without changing one of these, keep it and add a short explanation after it.

### Pass 2: Human Readability

- Put the real problem before the solution name.
- Use a concrete subject, action, object, and result: who does what to which object, and what changes for the next person.
- Prefer a representative work example before an abstract model, but label invented examples as examples rather than facts.
- Introduce one unfamiliar concept at a time and explain it in the same sentence.
- Replace empty importance claims with the actual consequence.
- Delete meta-commentary, repeated summaries, and slogans that add no decision information.
- Mix short decision sentences with longer evidence sentences naturally. Do not manufacture rhythm or a quotable line.
- State uncertainty directly: `现有材料没有设备价格，当前只能审范围，不能审采购预算` is better than a vague disclaimer.
- Mark the stage in the verb itself: use `建议`、`拟`、`试点中计划`、`原型显示` or `已在生产验证` as supported. Bare present tense such as `机器人负责` can make a proposal sound already implemented.

## 6. Use A Standalone Executive Summary

When the target reader has not read the source material, start with these six short statements:

```text
这是做什么（当前阶段是什么）：
现在的问题：
谁受影响、他们的工作怎么变（相比今天）：
建议怎么改：
主要风险或还没确认的事：
现在需要您决定：
```

The affected-people-and-change line is not optional. It is the only place the summary answers questions 3 and 4 of the 30-second test. If the material does not say who works differently, write `材料未说明` instead of deleting the line, and record the gap as a comprehension defect.

Add cost, delivery time, security, safety, or operational impact only when the evidence supports them. Do not fill an empty field with a guess.

Put object models, state tables, integration design, field mappings, and acceptance detail after this summary.

## 7. Grade The Result

Score each dimension from 1 to 10 only when a score helps comparison:

| Dimension | Question |
|---|---|
| Comprehension | Can a zero-background decision maker retell the proposal correctly? |
| Directness | Does the text state the problem, change, and decision without narrator padding? |
| Evidence trust | Are facts, inference, uncertainty, and current-versus-proposed state kept distinct? |
| Decision usefulness | Are impact, responsibility, risk, and requested decision visible? |
| Human tone | Does it sound like a knowledgeable person explaining real work rather than a template performing expertise? |

A score does not override a hard failure. Treat the result as not ready when the requested decision is missing, the reader confuses proposal with current capability, a material risk or responsibility is hidden, or the rewrite changes source facts.

Do not score `AI probability` or claim to identify the author. Score only the reader-visible properties above.

Use these bands when a scored gate is requested:

- 45-50: ready for the target reader, subject to the product and evidence gates.
- 40-44: small readability edits required.
- 35-39: rewrite the summary and repeat the teach-back test.
- Below 35: not ready for external or owner decision use.

Treat any score below 7 in comprehension, evidence trust, or decision usefulness as not ready. Good style cannot compensate for a missing decision, hidden risk, or distorted fact.

## Severity Guidance

- Use P2 for isolated AI-like phrasing or an awkward sentence that does not affect understanding or action.
- Use P1 when a target customer leader or owner cannot understand the product, operating change, responsibility, risk, or requested decision without verbal translation.
- Use P0 only when the wording causes a demonstrated unsafe action, materially wrong decision, false completion, security failure, or destroyed accountability. AI flavor by itself is never P0.
