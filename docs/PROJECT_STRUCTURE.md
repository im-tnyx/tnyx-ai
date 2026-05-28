# TNYX Project Structure

**Version:** 1.1  
**Date:** May 2026  
**Architecture:** Monorepo (Flutter + Python)

TNYX ek Adaptive AI Health Operating System hai jo multiple platforms pe kaam karega.

> Note: GitHub repo name `tnyx-ai` ho sakta hai, lekin local monorepo root folder ko aap `tnyx/` rakh sakte ho. Docs mein hum logical structure ko refer kar rahe hain.

## Root Folder Structure

```bash
tnyx/                             # Monorepo Root (repo: tnyx-ai)
├── apps/                         # All Applications
│   ├── mobile/                   # Main Flutter App (Android + iOS)
│   ├── web/                      # User Website (Flutter Web)
│   ├── admin/                    # Admin Dashboard
│   └── watch/                    # Wear OS Watch App
│
├── backend/                      # Python FastAPI Backend
├── packages/                     # Shared Packages (Code Reuse)
├── docs/                         # All Documentation
├── infra/                        # Infrastructure & Deployment
├── scripts/                      # Utility Scripts
├── .github/                      # CI/CD Workflows
├── melos.yaml                    # Monorepo Management (Flutter)
├── README.md
├── MASTER_EXECUTION_PLAN.md
└── .gitignore
```

## Naming Clarification (Important)

- **Folder names** (`apps/mobile`) ko simple rakho, kyunki ye monorepo navigation aur tooling (melos) ke liye readable hota hai.
- **Flutter pubspec name** (e.g., `name: tnyx_mobile`) Dart package identifier hota hai, folder name nahi. Monorepo mein multiple apps/pkgs honge, isliye `tnyx_mobile` jaisa unique name practical hota hai.
- **App identity** (Android `applicationId`, iOS bundle id) alag cheez hai, jo later production ke time set hogi.

## 1) Apps Folder (Detailed)

### `apps/mobile/` (Primary App)

```bash
mobile/
├── lib/
│   ├── app/                  # App entry wiring (MaterialApp, etc.)
│   ├── core/                 # Theme, DI, Routes, Config, Utils
│   ├── features/             # Feature-wise modules
│   │   ├── nutrition/
│   │   ├── workout/
│   │   ├── live_coach/
│   │   ├── camera_vision/
│   │   ├── ai_chat/
│   │   ├── recovery/
│   │   ├── profile/
│   │   └── ...
│   ├── shared/               # Shared widgets, models, extensions
│   ├── wear/                 # Wear OS specific logic (if needed)
│   └── main.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── animations/
├── test/
└── pubspec.yaml
```

### `apps/web/`

Flutter Web (User Facing Website)

### `apps/admin/`

Admin Panel (Next.js ya Flutter Web)

### `apps/watch/`

Wear OS Companion App

## 2) Packages Folder (Shared Code)

```bash
packages/
├── design_system/            # UI Components, Theme, Typography
├── shared_models/            # Common Entities & DTOs
├── tnyx_core/                # Business Logic, API Client, Utils
├── contracts/                # OpenAPI Specs
└── utilities/                # Common Helpers
```

## 3) Backend Structure

```bash
backend/
├── app/
│   ├── api/                  # Endpoints (v1/)
│   ├── core/                 # Config, Security, Database
│   ├── domain/               # Entities, Use Cases
│   ├── features/             # nutrition_engine, ai_coach etc.
│   ├── infrastructure/       # DB, External Services
│   ├── ml/                   # AI, LangChain, Vision Models
│   └── services/
├── alembic/                  # Database Migrations
├── tests/
├── pyproject.toml
└── requirements.txt
```

## 4) Docs Folder

```bash
docs/
├── architecture/
├── ai/
├── api/
├── roadmap/
├── decision-records/
├── globalization.md
├── tech-stack-decision.md
└── safety-guidelines.md
```

## Technology Stack Summary

- **Mobile & Web:** Flutter (Dart)
- **Watch:** Flutter for Wear OS
- **Admin:** Next.js (recommended) ya Flutter Web
- **Backend:** Python + FastAPI
- **AI/ML:** Gemini/Claude + LangChain + MediaPipe + TFLite
- **Database:** PostgreSQL + Vector DB

## Notes

- Maximum code sharing `packages/` ke through.
- `apps/mobile/` ko sabse zyada priority dena hai.
- Global support (i18n, multi-region food DB, Metric/Imperial) abhi se consider karna hai.
