# AI System Overview (Planning)

This document describes the conceptual AI system architecture for TNYX.

> **Policy:** Planning-only and technology-agnostic. This document must not commit to specific vendors, models, providers, databases, or infrastructure.

## 1) Goal

TNYX is intended to function as an **Adaptive AI Health Operating System**:

- personalized coaching that improves over time
- explainable recommendations ("why")
- conservative, safety-guarded behavior
- auditable memory that users can inspect and delete

## 2) Core AI Components

### 2.1 Decision / Recommendation Engine

Purpose:

- produce coaching suggestions for nutrition, training, recovery, sleep, and stress

Design posture:

- deterministic rules first
- adaptive behavior introduced gradually as validation improves

Inputs (examples):

- user goals and constraints
- recent logs (workout, food, sleep)
- trends (adherence, recovery, fatigue)
- external device data (when consented)

Outputs:

- recommendation + confidence
- explanation bundle (see 2.4)
- safety verdict (see 2.3)

### 2.2 Memory System (Auditable)

Memory types:

- **short context:** recent sessions, last 7-30 days signals
- **long memory:** stable preferences, constraints, allergies, patterns

Rules:

- memory must be structured (facts/preferences), not vague chat history
- user-visible entries where possible
- user-deletable and exportable by design

### 2.3 Safety Filter (Hard Guardrails)

Safety runs before any recommendation is shown.

Responsibilities:

- block unsafe deficits, extreme behaviors, or risky training suggestions
- prevent overtraining escalations when fatigue/recovery signals are poor
- default to conservative fallbacks when data is missing
- ensure messaging is not medical diagnosis and includes appropriate disclaimers

### 2.4 Explanation Layer (Why + Confidence)

Every coaching output must include:

- why the suggestion is being made (signals used)
- what the user can do next (actionable)
- confidence level and uncertainty notes
- what data is missing (if relevant)

### 2.5 Realtime Coaching Loop (Optional Capability)

Used for live workout coaching:

- low-latency session state updates
- rest timer intelligence
- fatigue monitoring and set-by-set adjustments

This capability is staged after core contracts and safety systems exist.

## 3) Data Boundaries & Consent

- no external device ingestion without explicit consent
- media ingestion (voice/image) requires explicit consent by category
- user controls: export and delete should exist as designed gates early

## 4) Confidence & Fallback Behavior

When confidence is low:

- prefer safe, generic recommendations
- ask for clarifying inputs
- avoid autonomous adaptation

## 5) Non-Negotiables

- safety-first gating
- auditable memory
- explainable outputs
- privacy and consent by default

## 6) Roadmap Linkage

- overall sequencing: `MASTER_EXECUTION_PLAN.md`
- phased delivery: `docs/FEATURE_ROADMAP.md`
