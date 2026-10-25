---
trigger: always_on
description: "Reuse installed Flutter and Dart packages when implementing features"
---

- Before writing code, inspect `pubspec.yaml`, `pubspec.lock`, and nearby feature code for an existing package that fits the task.
- Verify the installed package's API and version-specific behavior in its documentation or source before using it. Do not guess imports, constructors, or parameters.
- Prefer a suitable installed package over duplicating its functionality or adding an overlapping dependency. Keep usage consistent with the surrounding feature.
- For spacing, consider `flutter_gutter`'s `Gutter` variants when adaptive gutter spacing is intended. Use the existing `gap` package or project spacing tokens when an exact fixed distance is required.
- Do not use a package merely because it is installed. If it does not fit, use a simple Flutter/Dart API and briefly explain the choice.
- Keep package calls in the correct Clean Architecture layer, and cover changed behavior with focused tests.
