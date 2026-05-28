# TNYX Mobile Navigation Structure

## Purpose

Defines navigation ownership and route structure for mobile.

## Navigation Principles

- Use a single top-level navigation entry.
- Keep route constants centralized.
- Navigation decisions live in Route layer only.
- Screens never call navigation APIs directly.

## Suggested Graph Shape

1. Entry graph
2. Auth/Welcome graph
3. Main app graph (tabs + feature stacks)
4. Modal/dialog routes

## Route Naming Rules

- stable and additive
- no random renames
- no inline route strings in screens

## Deep Link Rules

- define deep links at route-level modules
- validate params before navigation
- unsupported links should fail safely to known route

## v0.1 Scope

- implement mock navigation flows only
- keep placeholders explicit and documented in `SCREEN_INVENTORY.md`
