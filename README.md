# TNYX

AI-powered health, fitness, nutrition, recovery, and coaching ecosystem.

> **Status:** Planning + foundation only (no implementation commitments).

## Overview

TNYX is an adaptive health platform focused on:

- Workout tracking and progression
- Training programming (adaptive over time)
- Nutrition and micronutrient logging
- Recovery intelligence and readiness signals
- Water and sleep tracking
- Wearable and health data synchronization
- Coaching workflows and recommendations

This repository is intentionally **planning-first**: product definition, milestones, scope, and operating rules.

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
