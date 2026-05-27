# TNYX Project Structure

**Version:** 1.1  
**Date:** May 2026  
**Architecture:** Monorepo (Flutter + TypeScript/Node.js + Optional Python AI Services)

TNYX is an Adaptive AI Health Operating System across mobile, watch, web, admin, and backend layers.

## Root Folder Structure

```txt
tnyx-ai/                          # Monorepo Root
|-- apps/                         # Application surfaces
|   |-- mobile/                   # Main Flutter app (Android + iOS)
|   |-- web/                      # Web dashboard (Next.js App Router)
|   |-- admin/                    # Admin console (Next.js)
|   `-- watch/                    # Wear OS companion app
|
|-- backend/                      # Core API/backend orchestration (Node.js + Express + TypeScript)
|-- packages/                     # Shared packages and contracts
|-- docs/                         # Architecture, roadmap, standards
|-- infra/                        # Infrastructure and deployment configs
|-- scripts/                      # Utility scripts
|-- .github/                      # CI/CD workflows
|-- melos.yaml                    # Flutter workspace orchestration (Dart packages)
|-- README.md
|-- MASTER_EXECUTION_PLAN.md
`-- .gitignore
```

## Apps Folder (Detailed)

### `apps/mobile/` (Primary App)

```txt
mobile/
|-- lib/
|   |-- app/                      # App wiring (MaterialApp, routes, shell)
|   |-- core/                     # Theme, config, shared runtime primitives
|   |-- features/                 # Feature modules
|   |-- shared/                   # Shared widgets/models/extensions
|   |-- wear/                     # Optional watch-specific shared flows
|   `-- main.dart
|-- assets/
|-- test/
`-- pubspec.yaml
```

### `apps/web/`

Next.js App Router user dashboard.

### `apps/admin/`

Next.js admin console for operations and governance workflows.

### `apps/watch/`

Wear OS companion runtime (fast interactions, low-latency controls).

## Packages Folder (Shared Code)

```txt
packages/
|-- contracts/                    # Shared DTOs, route/event contracts (source of truth)
|-- design_system/                # Shared UI tokens/components where applicable
|-- shared_models/                # Shared domain models
`-- utilities/                    # Common helpers
```

## Backend Structure (Core Service Layer)

```txt
backend/
|-- src/
|   |-- controllers/              # Thin request handlers
|   |-- services/                 # Use-case orchestration/business logic
|   |-- repositories/             # Data access boundaries
|   |-- modules/                  # Domain modules (nutrition, workout, recovery, coach)
|   |-- middleware/               # Auth, validation, observability
|   `-- app.ts
|-- tests/
|-- package.json
`-- tsconfig.json
```

## Optional AI Compute Services (When Needed)

Heavy ML/CV workloads can be isolated as optional Python services behind stable contracts:

- image analysis
- OCR nutrition label parsing
- posture/form analysis
- prediction model execution

These services are optional capability modules and must not bypass backend governance, safety, or shared contracts.

## Technology Stack Summary

- **Mobile:** Flutter (Dart)
- **Watch:** Wear OS companion (Flutter/Wear-compatible approach)
- **Web/Admin:** Next.js + TypeScript
- **Core Backend:** Node.js + Express + TypeScript
- **AI/ML Compute:** Optional Python services (module-level, contract-driven)
- **Data:** PostgreSQL (+ supporting infra as needed)

## Notes

- Keep cross-platform contracts in `packages/contracts`.
- Prioritize `apps/mobile/` during UI foundation milestone.
- Apply safety-first and explainability-first rules before adaptive autonomy.
