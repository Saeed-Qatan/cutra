# AGENTS.md

## Project Overview

Flutter project using **Clean Architecture** + **Feature-first** structure.\
State management: **Riverpod only** (no Cubit, no Bloc, no Provider package).

## Architecture Rules (Strict)

### Layers

- Follow Clean Architecture strictly:
  - **Presentation** → UI + Riverpod Notifiers/Providers
  - **Domain** → Entities + UseCases + Repository Interfaces
  - **Data** → Repository Implementations + DataSources + Models (DTOs)
- Never import Data layer into Presentation.
- Never import Presentation into Domain or Data.
- Domain layer must stay pure Dart (no Flutter imports).

### Feature-first Structure

Every feature must follow this structure:

### State Management – Riverpod Only

#### Allowed Provider Types

| Type                    | When to use                                   | Example use case                  |
| ----------------------- | --------------------------------------------- | --------------------------------- |
| `Provider`              | Simple synchronous derived values             | Theme, config, pure calculations  |
| `FutureProvider`        | One-time async data (no mutation)             | Fetch user profile once           |
| `StreamProvider`        | Continuous async data stream                  | Realtime updates, websocket       |
| `NotifierProvider`      | Complex mutable state (sync)                  | Form state, filters, UI state     |
| `AsyncNotifierProvider` | Complex mutable async state                   | Login, fetch + mutate, pagination |
| `StateProvider`         | Very simple mutable state (avoid if possible) | Simple toggles only               |

#### Rules for Riverpod

- Prefer **`Notifier` / `AsyncNotifier`** for any non-trivial state.
- Prefer **`Provider` / `FutureProvider` / `StreamProvider`** for read-only or derived state.
- Avoid `StateProvider` and `StateNotifierProvider` unless the state is extremely simple.
- Do **not** use Cubit, Bloc, GetX, or the old Provider package.
- Keep business logic inside Notifiers or UseCases — never inside Widgets.
- Widgets should only:
  - `ref.watch(...)` for reading
  - `ref.read(...).method()` for calling actions
- Never call `ref.watch` inside event handlers (use `ref.read` instead).
- Prefer family modifiers (`Provider.family`) when the provider depends on a parameter.
- Prefer `autoDispose` when the state should be cleaned up automatically.

#### Naming Conventions for Providers

- `xxxProvider` → for simple Provider / FutureProvider / StreamProvider
- `xxxNotifierProvider` → for NotifierProvider / AsyncNotifierProvider
- File names:
  - `*_provider.dart`
  - `*_notifier.dart`

## Coding Conventions

- Prefer `const` constructors everywhere possible.
- Keep Widgets small and focused on UI only.
- Name files clearly:
  - `*_notifier.dart` or `*_provider.dart` for Riverpod
  - `*_usecase.dart` for UseCases
  - `*_repository.dart` for repositories
  - `*_entity.dart` for domain entities
  - `*_model.dart` for data models
- Never hardcode secrets, API keys, or environment values.
- Use dependency injection via Riverpod providers.

## Commands

- Install dependencies: `flutter pub get`
- Run app: `flutter run`
- Analyze: `flutter analyze`
- Run tests: `flutter test`
- Format: `dart format .`

## Review Expectations

- Every change must pass `flutter analyze` and `flutter test`.
- Check for layer boundary violations.
- Check that only Riverpod is used (no Cubit/Bloc).
- Check that the correct provider type is chosen.
- Check that new features follow the feature-first structure.
- Prefer small, focused commits.
