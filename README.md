# TNYX

Adaptive AI-powered Health Operating System (nutrition, training, recovery, sleep, stress, and realtime coaching).

> **Status:** Planning + UI/UX foundation only (v0.1). No implementation commitments.

## Vision (AI Health OS)

TNYX isn’t a simple fitness tracker. It’s being designed as an **Adaptive AI Health Operating System** that doesn’t just log data, but:

- understands user context (goals, habits, stress, sleep)
- learns long-term patterns (with user control)
- adapts recommendations over time
- explains **why** a recommendation is being made (explainable coaching)
- enforces a **safety-first** layer before any deficit/cut/overtraining suggestions

> **Important:** TNYX is not medical advice. It provides responsible coaching guidance and safety-guarded recommendations only.

## What exists now (v0.1)

Current work is deliberately **UI/UX-only**:

- tokenized design system foundations
- reusable component structure
- stable navigation shell
- **state-complete** mock screens (empty, loading, error, success)
- motion/interaction baselines

## Explicitly not in v0.1

- no production data integration
- no identity/access implementation
- no persistence layer
- no adaptive intelligence wiring
- no realtime synchronization
- no wearable provider choices/APIs yet

## Platforms (Target)

- Mobile app
- Watch companion
- Web dashboard
- Admin console

## Architecture Principles (Technology-Agnostic)

- modular boundaries with clear ownership
- standardized domain contracts and communication rules
- centralized domain governance for critical health logic
- deterministic health logic before probabilistic/adaptive behavior
- strict security and privacy boundaries

## Execution Plan

Primary delivery sequence and milestone gates are defined in the single source-of-truth:

- [`MASTER_EXECUTION_PLAN.md`](./MASTER_EXECUTION_PLAN.md)

## Documentation Map

Core docs (v0.1 + roadmap):

- [`MASTER_EXECUTION_PLAN.md`](./MASTER_EXECUTION_PLAN.md)
- [`docs/FEATURE_ROADMAP.md`](./docs/FEATURE_ROADMAP.md)

All other docs are supporting references for UI/UX foundation and execution standards.

Execution priority on conflict:

`MASTER_EXECUTION_PLAN -> FEATURE_ROADMAP -> feature-specific docs`
