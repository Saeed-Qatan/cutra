# Cutra Agent Hub

Read `../agent.md` first, then `PLAN.md`, `TASKS.md`, `ARCHITECTURE.md`, `RULES.md`, `Stitch.md`, `WORKFLOW.md`, `Feature.md`, `SYNC_MATRIX.md`, `GIT_BRANCH_WORKFLOW.md`, `DECISIONS.md`, and `ROLES.md`.

## Active Scope

Only Splash and Login are routed. Splash displays its full content for five seconds. Login has validation, loading/error feedback, session persistence, and a local sign-out action. Login's API contract is preliminary; no later page or backend integration is complete.

The owner supplies the next page's design before that feature is built. Some older Cutting logic and preliminary Register data files are preserved but are not active screens or routes. Do not expand them until their feature starts.

The active stack is Flutter, Riverpod, GoRouter, Dio, Secure Storage, fpdart, and the existing theme/assets. `animated_splash_screen` is not used.
