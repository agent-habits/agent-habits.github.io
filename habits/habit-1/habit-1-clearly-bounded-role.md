---
layout: default
title: "Habit 1: Clearly Bounded Role"
permalink: /habits/habit-1/
---

# Habit 1: Clearly Bounded Role

## One-sentence definition

Effective agents serve a narrowly defined function within a larger system.

## Intent

This habit exists to reduce ambiguity.

A clearly bounded role defines what an agent is responsible for and, just as importantly, what it is not responsible for. It limits blast radius, clarifies expectations, and makes failures diagnosable rather than surprising.

Agents are most valuable when they reduce uncertainty in a specific domain, not when they attempt to own outcomes end to end.

## Scope

A bounded role does not describe how intelligent an agent is.

It describes where that intelligence is applied.

The role should be narrow enough that:

* Success can be clearly articulated
* Failure modes are understandable
* Authority is legible to humans and systems
* The agent can be safely composed with other components

This habit applies equally to small assistive agents and larger agentic subsystems.

## What this habit enables

When an agent has a clearly bounded role:

* Its permissions can be tightly scoped
* Its outputs can be validated and monitored
* Its impact on the system is predictable
* Its behavior can improve without expanding authority

Bounded roles make agents easier to trust because they make trust testable.

## What this habit deliberately prevents

This habit prevents agents from becoming implicit owners of complex outcomes.

It resists designs where:

* Responsibility is implied rather than explicit
* Authority expands organically through prompt changes
* Agents are expected to figure things out end to end
* Failures are attributed to intelligence rather than design

Broad responsibility without clear intent is not autonomy.
It is abdication.

## Governance implications

A clearly bounded role is a governance primitive.

It defines:

* What decisions the agent may influence
* What decisions it may not make
* Where escalation boundaries exist
* Who remains accountable for outcomes

Without a bounded role, permission boundaries cannot be meaningfully enforced. Governance becomes reactive instead of structural.

## Common failure modes

Systems that violate this habit often exhibit:

* Agents making decisions outside their original intent
* Expanding scope through incremental prompt changes
* Difficulty explaining why an action occurred
* Blurred accountability between humans and automation

These failures are often misattributed to model limitations, when the root cause is unclear role definition.

## Example use cases

Examples of bounded roles might include:

* Interpreting unstructured user input and mapping it to predefined actions
* Summarizing observability signals for human review
* Drafting responses that require approval before execution
* Translating between human language and system interfaces

In each case, the agent contributes intelligence without owning the outcome.

## Relationship to other habits

This habit anchors several others:

* Explicit Constraints build on role clarity
* Deferral depends on knowing when authority ends
* Accountability requires clearly defined responsibility

When this habit is weak, the rest of the system compensates poorly.

## Closing perspective

A clearly bounded role does not limit an agent’s usefulness.

It concentrates it.

The fastest way to make an agent dangerous is to make it responsible for too much.
The fastest way to make it valuable is to be precise about why it exists.

**[-> Habit 2]({{ '/habits/habit-2/' | relative_url }})**