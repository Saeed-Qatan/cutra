---
name: run-tests
description: Analyze and verify Flutter project quality
---

1. Run `flutter pub get` if needed.
2. Run `dart format --output=none --set-exit-if-changed .` to verify formatting.
3. Run `flutter analyze` or Dart static analysis.
4. Report results clearly (passed/failed + diagnostic summary).
