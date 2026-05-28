# TNYX Mobile UI Generation Prompt

You are building production-grade mobile UI for TNYX.

## Execution Alignment

- Follow root `MASTER_EXECUTION_PLAN.md` and `docs/FEATURE_ROADMAP.md`.
- Follow `docs/MOBILE_UI_ARCHITECTURE_STANDARD.md` for layer boundaries.
- Current phase is Milestone A (`v0.1 UI Foundation`): mobile UI only, mock data only, no production integration.
- If instructions conflict, resolve in this order:
  `MASTER_EXECUTION_PLAN -> FEATURE_ROADMAP -> MOBILE_UI_ARCHITECTURE_STANDARD -> mobile-ui.prompt.md`.

## Product Context

TNYX is an AI-first health, fitness, nutrition, recovery, and coaching platform.  
UI should prioritize:

- fast workout flows
- clear nutrition logging
- high-signal recovery visibility
- low-friction daily actions

## Tech Context (Current Mobile Repo)

- Flutter
- Dart
- Material 3
- Feature-first modular structure in `apps/mobile/lib`

Do not introduce unrelated frameworks or parallel architecture styles.

## Core UI Direction

- dark-theme friendly and high-contrast
- premium but disciplined health-product visual language
- scanning-friendly hierarchy
- reusable component-first implementation
- tokenized spacing, typography, color, radius, and motion

## Non-Negotiable Architecture

Use this flow for every screen:

`Route -> Screen -> ViewModel -> UiState + Action -> UseCase -> Repository -> DataSource`

### Required behavior by layer

- `Route`: collect state, wire callbacks, handle navigation.
- `Screen`: dumb/presentational only.
- `ViewModel`: UI state transitions and non-navigation behavior.
- `UiState`: immutable and render-complete.
- `Action`: typed user/system events only.

## Mandatory Rules

- Dart only.
- Keep screens declarative and lightweight.
- No business logic inside any screen/widget/composable.
- No navigation decision logic inside screens.
- No direct backend/provider calls in presentation widgets.
- No hardcoded visual constants when tokens already exist.
- Every screen must define loading, empty, error, and success states.
- Keep files modular; split oversized screens into components.
- Add only minimal, meaningful comments.

## Interaction Rules

- Primary interactions should be obvious and thumb-friendly.
- Use motion only for comprehension (transitions, feedback, state change).
- Avoid decorative animation noise.
- Keep tap targets and semantics accessible.

## Visual System Rules

- Keep contrast/readability above decorative effects.
- Keep accent palette consistent per screen.
- Reuse existing iconography patterns.
- Prefer shared component APIs over one-off local variants.

## Output Requirements

Always produce:

- file-by-file changes
- predictable naming
- reusable components
- additive, backward-safe updates
- clean boundary compliance

Do not produce:

- random folder structure
- route logic inside screens
- ad-hoc string event contracts
- duplicated token values across screens
- architecture drift from existing standard

## Final Validation Checklist

- Route exists and wires ViewModel + navigation callbacks.
- Screen accepts only `UiState` + `onAction`.
- Screen contains zero business logic.
- ViewModel handles all state transitions.
- UiState is immutable and render-complete.
- Actions are typed and exhaustive.
- No v0.1 scope violation (no production backend wiring).
