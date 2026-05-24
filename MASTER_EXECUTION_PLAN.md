# TNYX Master Execution Plan

This document is the single execution reference for TNYX.

It translates product vision into build order, domain boundaries, and release gates.

> **Policy:** This plan is **technology-agnostic**. It must not commit to any specific programming language, framework, repository structure, vendor integration, or infrastructure tooling.

## 1) Product Definition

TNYX is an adaptive health platform, not a basic tracker.

Long-term system scope:

- nutrition intelligence
- training intelligence
- recovery and stress intelligence
- wearable-aware adaptation
- coaching workflows (adaptive over time)
- memory-driven personalization (auditable, user-controlled)

## 2) Current Reality (As-Is)

Current status:

- documentation foundation created
- client UI shell and core UX foundations in progress
- theme/typography foundations in place
- navigation prototypes in progress
- mock-data-first approach active

Current deliberate constraints (by design):

- no production data integration
- no production identity/access implementation
- no persistence layer integration
- no adaptive intelligence wiring
- no realtime synchronization

## 3) Target Architecture (To-Be)

Execution model (principles):

- modular boundaries with clear ownership
- layered domain design (client, service, and domain rules separated)
- standardized domain contracts and message formats
- scalable inter-module communication (pattern chosen later)
- selective capability extraction only when required by scale/latency/security

Planned topology (conceptual):

- client applications (mobile, watch companion, web dashboard)
- administrative console
- core service layer (identity, data, rules)
- domain capability modules (nutrition, training, recovery)
- adaptive intelligence layer (recommendations, coaching)
- optional integration layer (wearables, providers)
- optional realtime interaction layer (live sessions)

### Adaptive Intelligence Architecture (Conceptual)

The "Adaptive Health OS" experience is composed of multiple coordinated, technology-agnostic capabilities:

- **Decision/Recommendation Engine:** deterministic rules first, then adaptive/personalized behavior as maturity increases
- **Memory System (Auditable):** structured facts and preferences, user-visible and user-deletable
- **Safety Filter (Hard Guardrails):** blocks unsafe deficits, overtraining, risky suggestions; enforces conservative defaults
- **Explanation Layer:** consistent "why" format, confidence signals, and what data was used
- **Realtime Coaching Loop (Optional):** low-latency session state for live workouts and recovery-aware adjustments

### Multi-platform sequencing (Conceptual)

- v0.1 focuses on mobile UI foundations.
- web/admin and watch companions are staged when contracts and core services exist.
- realtime sessions and device-aware adaptation unlock the full watch experience.

## 4) Domain Model (Build in This Order)

1. User and Goal domain
2. Nutrition logging domain
3. Training session domain
4. Recovery and sleep domain
5. Adaptive intelligence domain
6. External data synchronization domain (wearables/providers)
7. Prediction and adaptation domain

## 5) Milestone Plan

### Milestone A - UI Foundation (v0.1) [Now]

Deliver:

- polished mobile-first UI foundations
- tokenized design system
- reusable component architecture
- stable navigation patterns
- state-complete mock screens

Exit criteria:

- 25-40 quality screens (as per screen inventory)
- no production data dependencies
- docs-to-UI compliance validated

### Milestone B - Core Service Foundation (v0.2)

Deliver:

- core service layer bootstrap
- shared domain contracts baseline
- data model v1 (core entities only)
- identity/access contract wiring
- logging, validation, and error standards

Exit criteria:

- clients consume stable contracts (mock-compatible)
- no direct privileged data access from clients
- consent model baseline documented (what is collected, why, and user controls)

### Milestone C - Domain Capability Modules (v0.3)

Deliver:

- nutrition capability v1
- training progression capability v1
- recovery scoring capability v1

Exit criteria:

- deterministic recommendations available
- per-domain versioned contracts published
- export/delete control design complete (user controls designed early)

### Milestone D - Adaptive Intelligence Layer (v0.4)

Deliver:

- adaptive intelligence coordination layer
- memory policy (short + long context)
- recommendation explanation format
- safety and escalation logic

Exit criteria:

- explainable coaching outputs
- confidence-aware responses
- unsafe recommendation blocking

### Milestone E - Integrations + Realtime (v0.5)

Deliver:

- provider/wearable ingestion adapters (provider choice deferred)
- realtime session capability for live coaching
- readiness and adaptation updates

Exit criteria:

- low-latency session state updates
- recovery-aware training recommendations

### Milestone F - Adaptive Health OS (v1.0)

Deliver:

- dynamic calorie adaptation
- refeed and deload intelligence
- periodized nutrition and recovery planning
- behavior-based adherence prediction

Exit criteria:

- measurable adaptation outcomes
- stable production release posture

## 6) Non-Negotiable Guardrails

- service-owned critical mutations only
- additive data model evolution only
- shared contracts as single source of truth
- health-safety filter before adaptive suggestions
- no medical diagnosis claims
- strict secret/privacy handling

### Safety & Risk Policy (Planning)

TNYX must prioritize safety, especially before introducing autonomous adaptation:

- prevent unhealthy calorie deficits and extreme recommendations
- block overtraining signals from escalating load or frequency
- conservative defaults when confidence is low or data is missing
- clear disclaimers and escalation language (not medical care)
- age-aware defaults (e.g., stricter constraints for minors)

## 7) Data and AI Governance

- user-sensitive health data must be encrypted at rest and in transit
- explicit consent for media and external data ingestion
- delete/export controls must be designed early
- adaptive memory must store structured, auditable facts (user-visible, user-deletable)

## 8) Execution Rhythm

For each milestone:

1. architecture note freeze
2. contract draft
3. implementation slices
4. validation and QA gates
5. documentation and handoff update

## 9) Immediate Next Actions (Current Sprint)

1. stabilize remaining navigation and UI details
2. close P1/P2 screen placeholders to documented state coverage
3. finalize docs index and source-of-truth links
4. prepare the core service foundation plan (without integrating it yet)

## 10) Source-of-Truth Document Order

1. `MASTER_EXECUTION_PLAN.md`
2. `README.md`
3. `docs/FEATURE_ROADMAP.md`

If conflicts appear, this file governs execution sequencing.
