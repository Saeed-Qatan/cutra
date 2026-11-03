# Architecture & Application Workflow Guide

This document establishes the architecture standards, bootstrapping sequence, and quality workflow for the Cutra Flutter project.

---

## 1. Application Entrypoint Architecture

The project strictly separates the **entrypoint trigger** (`main.dart`) from the **application services and root configuration** (`lib/app/app.dart`).

```
lib/
├── main.dart             # Pure launch trigger (< 15 lines)
└── app/
    ├── app.dart          # Services assembly, ProviderScope overrides & root CutraApp
    └── router/
        ├── app_router.dart
        └── app_routes.dart
```

### 1.1 `main.dart` — Pure Launch Trigger
`main.dart` has a single responsibility: triggering the application bootstrap sequence. It does not instantiate controllers, configure themes, or contain UI widgets.

```dart
import 'app/app.dart';

void main() async {
  await AppBootstrapper.bootstrap();
}
```

### 1.2 `lib/app/app.dart` — Services Engine & Root Widget
`app.dart` contains:
1. **`AppBootstrapper.initServices()`**:
   - Initializes Flutter bindings (`WidgetsFlutterBinding.ensureInitialized()`).
   - Loads asynchronous pre-run dependencies (e.g., `SharedPreferences`, local storage, secure credentials).
   - Generates the list of Riverpod `Override` objects needed at startup.
2. **`AppBootstrapper.bootstrap()`**:
   - Resolves all services asynchronously.
   - Runs `runApp()` with `ProviderScope` populated with resolved overrides and mounts `CutraApp`.
3. **`CutraApp` (`ConsumerWidget`)**:
   - Configures `MaterialApp.router`.
   - Binds the declarative `goRouterProvider`.
   - Binds `lightTheme` and `darkTheme` with system mode detection.
   - Provides global app titles and metadata.

---

## 2. Adding a New Pre-Flight Service

When adding a service that requires asynchronous initialization before UI rendering:

1. Create or register its Riverpod provider in `lib/core/providers/core_providers.dart`:
   ```dart
   final myServiceProvider = Provider<MyService>((ref) {
     throw UnimplementedError('Must be overridden in ProviderScope');
   });
   ```
2. Initialize it in `AppBootstrapper.initServices()` in `lib/app/app.dart`:
   ```dart
   static Future<List<Override>> initServices() async {
     WidgetsFlutterBinding.ensureInitialized();
     final sharedPreferences = await SharedPreferences.getInstance();
     final myService = await MyService.init();

     return [
       sharedPreferencesInstanceProvider.overrideWithValue(sharedPreferences),
       myServiceProvider.overrideWithValue(myService),
     ];
   }
   ```

---

## 3. Layer Separation & Guidelines

- **Presentation (`lib/features/*/presentation/`)**:
  - UI widgets and Riverpod `Notifier` / `AsyncNotifier` implementations.
  - Zero business logic inside widgets.
  - No `ref.read` calls inside `build()`.
  - Isolate frequent updates (e.g., timers) to subwidgets via `.select()`.
- **Domain (`lib/features/*/domain/`)**:
  - Pure Dart models, entities, and use cases. Zero Flutter imports.
- **Data (`lib/features/*/data/`)**:
  - Data sources, repositories implementations, and DTOs.
  - Never imported directly into Presentation.

---

## 4. Quality & CI Workflow

The CI pipeline (`.github/workflows/flutter_quality.yml`) and agent workflows enforce the following validation steps:

1. **Dependency Resolution**:
   ```bash
   flutter pub get
   ```
2. **Formatting Enforcement**:
   ```bash
   dart format --output=none --set-exit-if-changed .
   ```
3. **Code Generation**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
4. **Static Analysis (Zero Warnings)**:
   ```bash
   flutter analyze --no-pub
   ```

> **Note on Testing Policy:** Per project policy (`.agents/rules/no-test-directory.md`), test directories and unit test files are prohibited. Quality assurance is enforced via static analysis, strict architectural layering, and Riverpod compile-time guarantees.

