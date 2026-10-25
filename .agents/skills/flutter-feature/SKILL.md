---
name: flutter-feature
description: Build one Cutra Flutter page with Riverpod MVVM, local validation, and focused tests before starting another page.
---

# Flutter Feature

1. Read `AGENTS.md`, `.agents/rules/clean-architecture.md`, and the existing feature files.
2. Confirm the page's UI reference and current behavior. Preserve its theme and shared controls.
3. Keep request models in `domain/models/`, presentation state and Riverpod ViewModels in `presentation/`, and external calls in `data/services/`.
4. Implement UI and local business logic first. Do not invent API responses, saved sessions, or backend success.
5. Add focused ViewModel and widget tests, then follow `.agents/workflows/run-tests.md`.
