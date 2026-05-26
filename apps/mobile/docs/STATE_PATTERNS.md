# TNYX Mobile State Patterns

## Purpose

Standardize screen state design and action flow.

## Core Pattern

- `UiState` is immutable.
- `Action` is typed and exhaustive.
- `ViewModel` processes actions and updates state.

## Required Screen States

Every user-facing screen should support:

- loading
- empty
- error
- success/content

## State Design Rules

- keep UiState render-complete
- avoid nullable ambiguity where possible
- separate transient UI effects from durable content state

## Action Design Rules

- action names should describe user intent
- avoid string-based event dispatch
- keep action classes small and explicit

## Navigation and State

- navigation outcomes are decided in Route
- ViewModel can emit route-intent signals if needed, but Route executes navigation
