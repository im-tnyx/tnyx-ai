# TNYX Mobile UI Architecture Standard

## 1) Purpose

This document defines mandatory implementation rules for mobile UI so that:

- design changes remain low-risk
- navigation remains stable
- feature refactors do not break business flows
- teams can scale without architecture drift

This standard applies to all mobile UI features in `apps/mobile`.

## 2) Mandatory Screen Architecture

Every feature screen must follow:

`Route -> Screen -> ViewModel -> UiState + Action -> UseCase -> Repository -> DataSource`

## 3) Layer Responsibilities

### Route

- collects `ViewModel` state
- handles navigation callbacks
- passes `UiState` and `Action` handlers to `Screen`
- may invoke platform dialogs/sheets/navigation
- must not contain domain business rules

### Screen

- dumb/presentational only
- renders from `UiState` only
- emits typed `Action` only
- no business logic
- no navigation decisions
- no direct data access

### ViewModel

- owns UI state transitions
- maps `Action` to state updates and use-case calls
- contains non-navigation UI behavior
- no framework-specific navigation decisions

### UiState

- immutable
- render-complete for the screen
- predictable defaults for preview/testing

### Action

- typed user/system events
- no raw string event routing

### UseCase / Repository / DataSource

- `UseCase`: business rules and orchestration
- `Repository`: domain-friendly abstraction
- `DataSource`: provider/backend/local implementation details

## 4) Required Feature Folder Pattern

Each feature should follow:

```text
features/<feature_name>/presentation/
  <feature>_route.dart
  <feature>_screen.dart
  <feature>_view_model.dart
  <feature>_contract.dart   // UiState + Action
```

Domain/data layers must be separated from presentation.

## 5) Hard Rules (Do Not Break)

- No business logic inside screens/composables/widgets.
- No navigation decision logic inside screens.
- No provider/backend payloads directly inside screens.
- No mutable UI state owned by screens for business flow.
- No ad-hoc route strings outside route constants/contracts.

## 6) Design Change Safety Rules

To keep design upgrades safe:

- keep all spacing/color/typography/motion tokenized
- avoid hardcoded visual constants in feature screens
- keep reusable UI in shared component/design-system layers
- keep UI copy and localization centralized
- keep route contracts stable and additive

## 7) Definition of Done (UI Feature)

A screen is complete only when:

1. Route exists and wires state/actions.
2. Screen is dumb and stateless for business behavior.
3. UiState is immutable and render-complete.
4. Actions are typed and exhaustive.
5. ViewModel owns transitions and non-navigation logic.
6. Preview/test states exist for loading/empty/content/error.
7. No architecture rule violations from this document.

## 8) PR Review Checklist

- Route/Screen/ViewModel split is present.
- Screen has no business logic.
- Screen has no navigation decisions.
- UiState/Action are typed and immutable.
- Any new behavior is moved to use-case layer when needed.
- Changes are backward-safe for existing navigation and contracts.
