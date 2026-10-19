# Agent Instructions

At the start of every task, open `agents/README.md` and read the instruction files it lists. `agents/TASKS.md` records the current page and completion gates.

The active application currently has only Splash and Login. Build one complete feature at a time from the owner's supplied theme and HTML/CSS. Do not add routes, UI, models, ViewModels, services, or placeholder screens for future pages until work begins on that feature. The next feature is chosen from the next owner request/design. Backend integration is the final stage.

Use feature-first MVVM with Riverpod and fpdart: `View -> ViewModel -> Service (returns Either<Failure, T>) -> API/storage` when data access is needed. A View renders state and sends actions. A ViewModel owns state, validation, and coordination. A service owns network/storage or substantial independent logic. `models/` contains data classes and serialization only. Do not add Repository or DataSource layers by default.

Auth features are consolidated into `features/auth/` (data, models, view_models, views); Splash and Login own their own views. Preserve the complete five-second Splash and existing theme/logo. Read `agents/ARCHITECTURE.md`, `agents/RULES.md`, and `agents/WORKFLOW.md` before editing. Record behavior, tests, and deferred work in `agents/TASKS.md`, `agents/SYNC_MATRIX.md`, and `agents/DECISIONS.md`.
