# Sync Matrix

| Feature | Current code | State/logic | Verification | Status |
| --- | --- | --- | --- | --- |
| Theme | `core/constants/colors.dart`, `core/theme/` | Light/dark mode and shared controls | Analysis/widget checks | Implemented; dark review pending |
| Splash | `auth/splash/` | Five-second Riverpod timer, then Login | Splash/router tests | Active and implemented |
| Login | `auth/login/`, `auth/shared/` | Validation, request, session save, failure and sign-out | Login/service/widget tests | Active; real backend contract deferred |
| Future pages | No routes or screen content | Build only when the owner starts each feature | Add tests with each page | Deferred |
| Backend | Preliminary client only | Review final API after local flows | Contract/integration tests later | Deferred |

Older Cutting logic and Register data are dormant and not evidence of completed pages. Keep this table aligned with `TASKS.md`.
