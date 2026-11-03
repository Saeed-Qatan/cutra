---
name: flutter-feature-boilerplate
description: Scaffolds and enforces Feature-First Clean Architecture with complete component isolation, ensuring every custom widget is in its own dedicated file under widgets/.
---

# Feature-First Clean Architecture & Component Isolation Skill

This skill defines the mandatory boilerplate and structural standards for scaffolding and organizing features in the Cutra Flutter application.

---

## 1. Feature Directory Structure

Every feature under `lib/features/<feature_name>/` must follow this exact hierarchy:

```
lib/features/<feature_name>/
├── presentation/
│   ├── views/
│   │   ├── screens/
│   │   │   └── <feature_name>_screen.dart       # Pure coordinator: handles layout and route wiring
│   │   └── widgets/
│   │       ├── <feature_name>_header.dart       # Extracted standalone widget
│   │       ├── <feature_name>_form.dart         # Extracted standalone widget
│   │       ├── <feature_name>_card.dart         # Extracted standalone widget
│   │       └── <feature_name>_action_button.dart# Extracted standalone widget
│   └── view_models/
│       ├── <feature_name>_view_model.dart       # Riverpod Notifier / AsyncNotifier
│       └── <feature_name>_state.dart            # Immutable State with value equality (== & hashCode)
├── domain/
│   ├── models/
│   │   └── <feature_name>_entity.dart           # Pure Dart model (Zero Flutter imports)
│   ├── repositories/
│   │   └── <feature_name>_repository.dart       # Abstract repository interface
│   └── usecases/
│       └── <feature_name>_usecase.dart          # Single-responsibility use case
└── data/
    ├── models/
    │   └── <feature_name>_dto.dart              # JSON serialization & data transfer models
    ├── datasources/
    │   ├── <feature_name>_remote_datasource.dart# Network API caller
    │   └── <feature_name>_local_datasource.dart # Local cache / SharedPreferences (optional)
    └── repositories/
        └── <feature_name>_repository_impl.dart  # Concrete implementation of domain repository
```

---

## 2. Mandatory Component Isolation Rules

1. **Zero Inline Component Declarations:**
   - Never embed multi-element private helper methods (e.g. `_buildHeader()`, `_buildCard()`, `_buildSubmitSection()`) inside the Screen file.
   - Any visual element with distinct styling, interactivity, or semantics must be extracted into a standalone widget file inside `presentation/views/widgets/`.

2. **Single Responsibility for Screens:**
   - Screen files (`*_screen.dart`) must act solely as coordinators:
     - Providing `Scaffold`, `SafeArea`, responsive constraints, and background canvas.
     - Placing extracted child widgets.
     - Listening to side-effects (e.g. snackbars, routing) via `ref.listen`.
     - Keeping file length strictly under 150 lines.

3. **Riverpod Interaction Rules:**
   - Pass callbacks down to widgets or read notifiers inside interaction handlers only.
   - Never call `ref.read` inside `build()`.
   - Isolate high-frequency rebuilds (e.g. countdown timers) inside dedicated widgets using `.select()`.

4. **Testing Policy:**
   - Adhere strictly to `.agents/rules/no-test-directory.md`. Do not create `test/` folders or unit tests.
   - Quality verification is conducted via `analyze_files` and static linter checks.

