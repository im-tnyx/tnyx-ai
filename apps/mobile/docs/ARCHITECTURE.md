# TNYX Mobile Architecture

## Purpose

This document defines the mandatory mobile architecture for `apps/mobile`.

## Mandatory Flow

Every feature must follow:

`Route -> Screen -> ViewModel -> UiState + Action -> UseCase -> Repository -> DataSource`

## Layer Responsibilities

### Route

- collects state from ViewModel
- handles navigation callbacks
- wires `UiState` and `Action` to Screen
- may trigger dialogs/sheets/navigation side effects

### Screen

- dumb/presentational only
- renders from `UiState`
- emits typed `Action`
- no business logic
- no navigation decisions

### ViewModel

- owns UI state transitions
- maps `Action` to state updates
- invokes use-cases for business behavior

### UseCase / Repository / DataSource

- `UseCase`: business rules
- `Repository`: domain abstraction
- `DataSource`: backend/local/provider implementation details

## Hard Rules

- No business logic in screens/widgets.
- No raw provider payloads in presentation layer.
- No ad-hoc route strings in features.
- UiState must be immutable.

## Current Phase Constraint (v0.1)

- UI-only and mock-data-first.
- No production backend/auth/persistence integration.
