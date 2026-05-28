# TNYX Mobile Coding Standards

## Language and Style

- Dart only
- clear naming
- small focused files/functions
- avoid unnecessary comments

## Architecture Compliance

- enforce `Route -> Screen -> ViewModel -> UiState + Action`
- no business logic in Screen
- no navigation logic in Screen

## Reuse and Maintainability

- prefer shared components over copy-paste
- prefer additive changes
- keep contracts stable

## Review Checklist

- architecture boundaries respected
- token usage respected
- state coverage present (loading/empty/error/content)
- no hidden side effects in UI layer
- backward compatibility considered
