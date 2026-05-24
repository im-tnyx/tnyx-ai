# TNYX Feature Roadmap

This document defines rollout order and development priorities for TNYX.

> **Policy:** This roadmap is **planning-only** and **technology-agnostic**. It must not commit to any specific language, framework, vendor, provider, database, or infrastructure.

Current focus:

- mobile UI prototyping only
- mock data only
- no service logic integration
- no production integrations

## Execution Alignment

- This roadmap governs phased delivery under root `MASTER_EXECUTION_PLAN.md`.
- Detailed UI standards live in supporting documents (screen inventory, design system, navigation, motion, and coding standards).

## 1) Product Vision

TNYX is an adaptive health, fitness, nutrition, recovery, and coaching ecosystem.

It is intended to evolve into an **Adaptive AI Health OS** where coaching is personalized, explainable, and safety-guarded.

Long-term platform scope:

- mobile apps
- watch companion apps
- web dashboard
- admin console
- coaching system
- recovery intelligence
- nutrition intelligence
- external health data synchronization

## 2) Current Development Phase

### Phase: UI Foundation (v0.1)

Goal:
Create a production-grade mobile UI prototype with premium UX quality.

In scope:

- screen architecture
- design system implementation
- navigation flows
- motion/interaction baselines
- reusable component library
- mock data states

Out of scope:

- service integration
- identity/access implementation
- realtime synchronization
- adaptive intelligence wiring
- production persistence
- watch runtime implementation

## 3) UI-Only Rules (v0.1)

During v0.1:

- all data remains mock-driven
- no production network calls
- no vendor-specific wiring
- no domain rule implementation

## 4) MVP Screen Priorities

### P1 Core Entry

- Splash
- Welcome
- Login
- Verification
- Onboarding
- Permissions

### P2 Main Navigation

- Home Dashboard
- Primary Tabs
- Navigation Shell
- Empty and Loading States

### P3 Training Module

- Planner
- Session
- Active
- Summary
- Exercise Details
- History

### P4 Nutrition Module

- Dashboard
- Food Logging
- Barcode Entry
- Camera Entry
- Voice Entry
- Micronutrient Summary

### P5 Coaching Surfaces

- Coach Entry
- Coach Chat UI
- Training Suggestions
- Nutrition Suggestions
- Recovery Insights

### P6 Recovery and Analytics

- Recovery Dashboard
- Sleep Summary
- Hydration Tracking
- Weight Progress
- Streak Tracking
- Analytics Overview

### P7 Profile and Settings

- Profile
- Goals
- Devices
- Notifications
- Subscription UI
- Settings

## 5) Immediate Deliverable Target (v0.1)

- 25-40 polished mobile screens
- reusable design system
- stable navigation structure
- smooth transitions
- mock-driven interactions

No service work is required before this milestone is complete.

## 6) Post UI Foundation Roadmap (Staged Intelligence)

### v0.2 - Core Data + Identity + Consent (Foundation)

- service contracts baseline
- identity/access integration (contract-first)
- persistence baseline
- consent model baseline (what data is collected, why, user controls)

### v0.3 - Deterministic Coach + Safety (Rules First)

- deterministic coaching outputs (rules-based)
- nutrition capability v1
- training capability v1
- recovery scoring v1
- safety filter baseline and escalation language

### v0.4 - Memory + Explainability + Wearables Baseline

- memory policy (auditable facts, user-visible/deletable)
- explanation format maturity (why + confidence)
- external data synchronization baseline (provider choice deferred)
- admin console foundation (optional, if required for ops)

### v0.5 - Multimodal Logging + Realtime Coaching Loop

- barcode logging
- voice logging
- camera logging (staged; privacy and accuracy-first)
- realtime session capability (live coaching surfaces)
- notification intelligence (as needed)

### v1.0 - Adaptive Health OS Release Hardening

- autonomous adaptation (calories, deload/refeed) with safety gating
- analytics maturity
- scale, performance, and reliability

## 7) Multimodal Food Logging Rollout (Policy)

Multimodal input is staged to protect reliability and user trust:

1. text-first logging
2. barcode scanning
3. voice + text hybrid
4. image logging
5. OCR nutrition label reading (last; accuracy validation required)

## 8) Wearables & External Data Integration (Policy)

- ingestion must be provider-agnostic via normalized contracts
- define conflict resolution rules (multiple sources, missing data)
- explicit user consent for each external source and data category

## 9) Documentation Status

Core v0.1 docs include:

- `DESIGN_SYSTEM.md`
- `DESIGN_TOKENS.md`
- `NAVIGATION_STRUCTURE.md`
- `SCREEN_INVENTORY.md`
- `COMPONENT_ARCHITECTURE.md`
- `ANIMATION_GUIDELINES.md`
- `FIGMA_STRUCTURE.md`
- `UI_GENERATION_WORKFLOW.md`
- `CODING_STANDARDS.md`

Primary execution authority:

- root `MASTER_EXECUTION_PLAN.md`

## 10) Execution Rule

Current path:

Documentation complete  
-> mobile UI foundation  
-> no service coupling in v0.1  
-> component-first implementation  
-> premium mock-driven screens
