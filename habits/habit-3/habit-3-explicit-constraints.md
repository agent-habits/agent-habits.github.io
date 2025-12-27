---
layout: default
title: "Habit 3: Explicit Constraints"
permalink: /habits/habit-3/
---

# Habit 3: Explicit Constraints

## One-sentence definition

Effective agents operate under clearly defined permissions, limitations, and escalation paths.

## Intent

This habit exists to make authority legible.

Explicit constraints define what an agent may do, what it must not do, and when it must defer. They transform autonomy from an implicit assumption into an intentional design decision.

Without constraints, intelligence becomes ambiguity. With constraints, intelligence becomes usable.

## Scope

Constraints are not guardrails added after the fact.

They are part of the agent’s interface.

They apply to:

* Actions the agent can take directly
* Data the agent can access or generate
* Systems the agent may interact with
* Conditions under which escalation is required

Explicit constraints should be enforced by the system, not merely described in prompts.

## What this habit enables

When constraints are explicit:

* Permissions can be audited and reasoned about
* Behavior is predictable under stress
* Failure modes are bounded
* Trust can increase without expanding authority

Well-constrained agents scale more safely than loosely constrained ones, even as their underlying capabilities improve.

## What this habit deliberately prevents

This habit prevents agents from acting on implied authority.

It resists designs where:

* Prompts substitute for policy
* Capabilities expand without review
* Agents infer permissions from context
* Escalation is treated as an exception rather than a rule

An agent that can do anything is not powerful.
It is ungoverned.

## Governance implications

Constraints are the mechanical expression of governance.

They define:

* Which actions are allowed by default
* Which actions require approval
* Which actions are forbidden entirely

Governance that cannot be enforced by the system is not governance.
It is documentation.

Explicit constraints make authority visible and enforceable.

## Common failure modes

Systems that violate this habit often exhibit:

* Agents performing irreversible actions prematurely
* Silent expansion of permissions over time
* Difficulty determining whether an action was allowed
* Governance policies that exist only in writing

These systems tend to fail suddenly, not gradually.

## Example use cases

Examples of explicit constraints might include:

* An agent that can recommend remediation steps but cannot execute them
* An agent that can query observability data but cannot modify configurations
* An agent that drafts customer communications requiring approval before sending
* An agent that operates in read-only mode during incident response

In each case, constraints shape behavior without eliminating usefulness.

## Relationship to other habits

This habit depends on clearly bounded roles and enables deferral and accountability.

Without role clarity, constraints lack meaning.
Without constraints, deferral is inconsistent.
Without both, accountability dissolves.

Explicit constraints turn intent into enforceable structure.

## Closing perspective

Constraints do not reduce autonomy.

They define it.

An agent that understands its limits is safer, more predictable, and ultimately more valuable than one that does not.
