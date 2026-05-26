# TNYX Mobile UI Release Checklist

## Pre-Merge

1. Architecture pattern compliance verified.
2. No business logic in screens.
3. Navigation remains route-owned.
4. Tokens used for visual system consistency.
5. Required screen states covered.

## Pre-Release (UI Foundation)

1. Critical flows manually sanity-checked.
2. Placeholder screens are clearly documented.
3. Mock-data behavior is predictable and stable.
4. Accessibility checks completed on key screens.
5. No unauthorized backend integration in v0.1.

## Regression Safety

1. Route names and contracts unchanged unless intentionally versioned.
2. Shared components remain backward-compatible.
3. ViewModel state transitions validated for touched features.
