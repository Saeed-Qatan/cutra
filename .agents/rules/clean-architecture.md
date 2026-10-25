---
trigger: always_on
description: "Enforce Clean Architecture + Feature-first + Riverpod only"
---

- Respect layer boundaries:
  - Presentation (UI + Riverpod)
  - Domain (Entities + UseCases + Repository interfaces)
  - Data (Repository implementations + DataSources + Models)
- Never import Data layer into Presentation.
- Never put business logic inside Widgets.
- New features must follow feature-first structure:
  lib/features/<feature_name>/{presentation,domain,data}
- Use **Riverpod only** (no Cubit, no Bloc, no Provider package).
- Prefer Notifier / AsyncNotifier for complex state.
