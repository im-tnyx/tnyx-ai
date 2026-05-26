# TNYX Mobile Testing Strategy

## Purpose

Define test expectations for stable UI evolution.

## Test Layers

1. ViewModel unit tests
2. Widget/screen tests
3. Navigation flow tests
4. Golden/snapshot tests (where helpful)

## Minimum Expectations

- ViewModel actions update UiState correctly.
- Critical screens render loading/empty/error/content.
- Key navigation routes are covered.

## v0.1 Focus

- mock-data-first test cases
- no production API mocking complexity required
- fast feedback test suite for UI regressions

## PR Gate Recommendation

- run static analysis
- run unit/widget tests for touched features
- validate screen state coverage before merge
