# Workflow

## Start

Read `../agent.md` and all files listed in `README.md`. Check Git status, `PLAN.md`, and `TASKS.md`. The owner decides the next page through its design/request.

## One Feature

1. Read the theme and supplied HTML/CSS/assets.
2. Define required interactions, loading/error/empty states, and navigation.
3. Put data classes in `models/`, state/providers/validation in `view_models/`, data access in `data/services/`, and Widgets in `views/`.
4. Complete UI/UX and local business logic. Add a service only for actual API/storage or independent logic.
5. Test the page, route, lifecycle, and failure behavior; run Flutter analysis.
6. Update `TASKS.md`, `SYNC_MATRIX.md`, and important decisions.
7. Start another feature only after the current feature is complete and the owner provides its design.

Splash keeps its full five-second display; Login is the only destination currently. Do not add future routes or placeholders. Backend contracts are reviewed after local pages are complete.

## Assets and Verification

When the SVG logo changes, regenerate its PNG/native splash/launcher resources through the existing tool and verify an Android build. Do not manually edit generated icons. Use `flutter analyze --no-pub` and the relevant tests for normal page work.
