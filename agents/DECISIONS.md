# Decisions and Status

Last updated: 2026-10-14

## Current Decision

Only Splash and Login are active routes. Build each later page only after the owner supplies its design and explicitly starts that feature. Home's counter placeholder and Register/Pending/Rejected screen content were removed. Existing Cutting logic and preliminary Register data remain dormant for now; their presence does not complete those features.

The active architecture is `View -> Riverpod ViewModel -> Service -> API/storage`. Models contain data and serialization only. Do not reintroduce forwarding Repository/DataSource layers. The app uses one shared Auth session state; a second router AuthStatus provider was removed. Splash always shows its full content for five seconds and then opens Login. A successful Login is shown on Login until a later destination page exists; local sign-out is available.

The Login endpoint and request/response shapes are preliminary. Final backend review, password recovery, and any future page routing remain deferred. Do not simulate authentication or announce a backend action that did not occur.

## Established Assets and Tools

The theme uses approved colors, IBM Plex/Manrope fonts, and light/dark variants. The SVG icon has a white C, black background, and blue tiles. Native splash and launcher assets are generated from it. `animated_splash_screen` was removed; the Flutter SplashViewModel owns the five-second timer and GoRouter owns navigation.

## Historical Context

- 2026-10-05: Initial Auth contracts and Cutting algorithms were added before their final pages. The final API contract remains unconfirmed.
- 2026-10-10: The owner set the feature-by-feature order and backend-last direction.
- 2026-10-12: Login HTML/CSS became the active design. Login moved into `auth/login/`; shared session/user data moved into `auth/shared/`.
- 2026-10-14: Deferred screen contents were removed from the active app. Home's counter implementation was removed. Cutting logic and preliminary Register data are preserved but disconnected. Router exposes Splash/Login only, and instructions now reflect services and one feature at a time.

## Open Questions

- The next page design and desired behavior.
- Final Auth base URL, fields, session policy, and password recovery contract.
- Product terminology: the Splash footer says glass cutting while the older dormant Cutting logic targets carpet.
- Target platform and release requirements.
