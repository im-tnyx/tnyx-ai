# TNYX OS

TNYX is an AI-first health operating system for fitness, nutrition, recovery, sleep, stress, metabolism, behavior, and realtime coaching.

The product vision is bigger than a simple fitness tracker: TNYX is designed to become an adaptive AI health ecosystem that understands each user, learns from their habits, predicts what they need next, and coaches them with safe, personalized guidance.

## Current Build Focus

- Production-grade Android mobile UI
- AI Coach experience
- Nutrition intelligence screens
- Home dashboard and daily health summary
- UI-first feature development with mock/static state
- Clean navigation, theme tokens, and reusable components

Backend APIs, repositories, remote AI execution, and persistence should be added only when explicitly requested.

Planned provider direction:

- AI: OpenAI, Google Gemini, Grok
- Nutrition data: Nutritionix or Nutrimix, Edamam, FatSecret
- Apps call only TNYX backend APIs; provider keys and routing stay server-side.

Product model:

- Custom AI identity: example name `Xio`
- User-facing AI modes: `Fast` and `Smart`
- Membership plans: Free with ads, Plus without ads, Premium with advanced AI intelligence

## Monorepo Direction

Production app surfaces should live under `apps/`:

- `apps/mobile` for the Android phone app
- `apps/wear` for the Wear OS companion app
- `apps/web` for the public web app
- `apps/admin` for the internal admin console
- `apps/support` for customer support workflows when support needs a separate tool
- `apps/partner` for coaches, gyms, dietitians, and clinics when partner workflows exist

Current Android code still lives in `android/mobile` until migration is explicitly requested.

## Documentation

- [Vision Overview](docs/VISION.md)
- [Mobile UI Roadmap](docs/MOBILE_UI_ROADMAP.md)
- [Full-Stack Architecture](docs/FULL_STACK_ARCHITECTURE.md)
- [Root Folder Structure](docs/ROOT_FOLDER_STRUCTURE.md)
- [Android Notes](android/mobile/docs/README.md)
- [Android Architecture](android/mobile/docs/ARCHITECTURE.md)
- [Navigation](android/mobile/docs/NAVIGATION.md)
- [Testing And Verification](android/mobile/docs/TESTING.md)
