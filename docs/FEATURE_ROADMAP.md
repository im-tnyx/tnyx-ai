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
- no business logic inside any screen/composable
- no navigation logic inside screens
- mandatory screen architecture: `Route -> Screen -> ViewModel -> UiState + Action`
- all user interactions must be emitted as typed `Action`
- `UiState` must be immutable and fully drive screen rendering

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

## 6) Post UI Foundation Roadmap

### v0.2

- service contracts baseline
- identity/access integration
- persistence baseline

### v0.3

- adaptive coaching integration
- nutrition capability rollout
- external data synchronization

### v0.4

- subscriptions
- realtime capability
- notification intelligence

### v1.0

- production release hardening
- analytics maturity
- scale and optimization

## 7) Documentation Status

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
- `MOBILE_UI_ARCHITECTURE_STANDARD.md`
- `../apps/mobile/docs/mobile-ui.prompt.md`

Primary execution authority:

- root `MASTER_EXECUTION_PLAN.md`

## 8) Execution Rule

Current path:

Documentation complete  
-> mobile UI foundation  
-> no service coupling in v0.1  
-> component-first implementation  
-> premium mock-driven screens
