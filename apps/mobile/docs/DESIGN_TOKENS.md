# TNYX Mobile Design Tokens

## Purpose

Defines token usage rules for consistent and upgrade-safe UI.

## Token Categories

- color
- typography
- spacing
- radius
- elevation
- motion

## Rules

- No hardcoded colors in feature screens when token exists.
- No magic spacing values in business screens.
- Typography should come from theme/token system.
- Motion durations/easing should be tokenized.

## Theme Strategy

- dark-theme friendly defaults
- consistent contrast targets
- semantic color names over raw hex references

## Token Change Policy

- additive changes preferred
- deprecate before removal
- document migration impact in PR notes
