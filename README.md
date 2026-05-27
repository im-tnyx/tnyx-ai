# TNYX

Adaptive AI-powered Health Operating System (nutrition, training, recovery, sleep, stress, and coaching).

> **Status:** Planning + UI foundation only (v0.1). No production integration commitments yet.

## Vision

TNYX is not a basic tracker. It is designed as an adaptive system that can:

- understand user context and goals
- learn long-term behavior patterns
- adapt recommendations over time
- provide explainable suggestions with confidence
- enforce safety-first coaching behavior

This repository is intentionally **planning-first**: product definition, milestone sequencing, scope boundaries, and operating rules.

## Platforms (Target)

- Mobile app
- Watch companion
- Web dashboard
- Admin console

## Architecture Principles (Technology-Agnostic)

- Modular boundaries with clear ownership
- Standardized domain contracts and communication rules
- Centralized domain governance for critical health logic
- Strict security and privacy boundaries
- Deterministic health logic before probabilistic/adaptive behavior

## Current Phase (v0.1)

Scope for the initial milestone:

- Design system foundations
- Navigation structure
- Premium screen inventory and UX flows
- Mock data flows
- Motion and interaction patterns
- Dark theme-first UX

**Note:** Delivery sequencing remains UI/UX and domain planning first. Integration and implementation choices are deferred until the foundation stabilizes.

## Architecture Direction (Planning)

- Core backend orchestration: `Node.js + Express + TypeScript`
- Optional AI/ML compute services (when needed): `Python` as capability modules
- Shared contracts remain the source of truth across all clients and services

## Execution Plan

Primary delivery sequence and milestone gates are defined in:

- [`MASTER_EXECUTION_PLAN.md`](./MASTER_EXECUTION_PLAN.md)

## Documentation Map

Primary docs for the current phase:

- [`MASTER_EXECUTION_PLAN.md`](./MASTER_EXECUTION_PLAN.md)
- [`docs/FEATURE_ROADMAP.md`](./docs/FEATURE_ROADMAP.md)
- [`docs/MOBILE_UI_ARCHITECTURE_STANDARD.md`](./docs/MOBILE_UI_ARCHITECTURE_STANDARD.md)
- [`apps/mobile/docs/mobile-ui.prompt.md`](./apps/mobile/docs/mobile-ui.prompt.md)

Execution priority on conflict:

`MASTER_EXECUTION_PLAN -> FEATURE_ROADMAP -> feature-specific docs`
