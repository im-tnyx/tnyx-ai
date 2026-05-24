# TNYX Project Structure

**Version:** 1.0  
**Date:** May 2026  
**Architecture:** Monorepo (Flutter + Python)

TNYX ek Adaptive AI Health Operating System hai jo multiple platforms pe kaam karega.

## Root Folder Structure

```bash
tnyx-ai/                          # Monorepo Root
├── apps/                         # All Applications
│   ├── tnyx_mobile/              # Main Flutter App (Android + iOS)
│   ├── tnyx_web/                 # User Website (Flutter Web)
│   ├── tnyx_admin/               # Admin Dashboard
│   └── tnyx_watch/               # Wear OS Watch App
│
├── backend/                      # Python FastAPI Backend
│
├── packages/                     # Shared Packages (Code Reuse)
│
├── docs/                         # All Documentation
│
├── infra/                        # Infrastructure & Deployment
├── scripts/                      # Utility Scripts
├── .github/                      # CI/CD Workflows
├── melos.yaml                    # Monorepo Management (Flutter)
├── README.md
├── MASTER_EXECUTION_PLAN.md
├── PROJECT_STRUCTURE.md          # Yeh File
└── .gitignore
```

## 1) Apps Folder (Detailed)

### `apps/tnyx_mobile/` (Primary App)

```bash
tnyx_mobile/
├── lib/
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
│   ├── wear/                 # Wear OS specific logic
│   └── main.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── animations/
├── test/
└── pubspec.yaml
```

### `apps/tnyx_web/`

Flutter Web (User Facing Website)

### `apps/tnyx_admin/`

Admin Panel (Next.js ya Flutter Web)

### `apps/tnyx_watch/`

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
- `apps/tnyx_mobile/` ko sabse zyada priority dena hai.
- Global support (i18n, multi-region food DB, Metric/Imperial) abhi se consider karna hai.
