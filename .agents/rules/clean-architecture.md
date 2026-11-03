---
trigger: always_on
description: "Enforce Clean Architecture + Feature-first + Riverpod only + Component Isolation"
---

- Respect layer boundaries:
  - Presentation (UI + Riverpod Notifiers/Providers)
  - Domain (Entities + UseCases + Repository interfaces)
  - Data (Repository implementations + DataSources + Models)
- Never import Data layer into Presentation.
- Never put business logic inside Widgets.
- Follow the **Feature-First Clean Architecture Boilerplate** defined in `.agents/skills/flutter-feature-boilerplate/SKILL.md`:
  `lib/features/<feature_name>/{presentation,domain,data}`
- **Strict Component Isolation:**
  - Every Custom Widget used inside a View/Screen must be extracted into its own dedicated file under `lib/features/<feature_name>/presentation/views/widgets/`.
  - Never declare multi-element private component builder methods (e.g. `_buildHeader()`, `_buildInputCard()`, `_buildSubmitButton()`) inside screen files.
  - Screen files must only coordinate layout, constraints, routing, and listen to side-effects.
- Use **Riverpod only** (no Cubit, no Bloc, no Provider package).
- Prefer Notifier / AsyncNotifier for complex state.
- Adhere strictly to the testing policy in `.agents/rules/no-test-directory.md`.
