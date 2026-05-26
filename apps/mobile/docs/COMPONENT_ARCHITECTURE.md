# TNYX Mobile Component Architecture

## Purpose

Defines reusable component boundaries and ownership.

## Component Layers

1. Design-system primitives
2. Shared app components
3. Feature-scoped components
4. Screen assembly

## Rules

- Prefer composition over duplication.
- Keep component APIs consistent and minimal.
- No domain business logic inside reusable UI components.
- Feature components should not leak provider-specific types.

## Suggested Placement

- `lib/core/theme` for tokens/theme
- `lib/core/ui` for shared components
- `lib/features/<feature>/presentation/components` for feature UI blocks

## API Design Checklist

- clear required/optional params
- stable naming
- no side-effect-heavy constructors
- state ownership clearly documented
