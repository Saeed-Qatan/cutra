# Cutra Development Tasks

## Active Scope

The application currently exposes only Splash and Login. Build one full feature at a time. The next page starts after the owner supplies its design and behavior. Preliminary API code is not final backend integration.

## Theme

- [x] CUTRA-UI-001: Approved colors and light/dark theme.
- [x] CUTRA-UI-002: Shared typography, controls, fonts, and app icon.
- [ ] CUTRA-UI-003: Visual review of dark mode with future page designs.

## Splash

- [x] CUTRA-UI-101: Full HTML-derived content, local SVG, native splash/icon, and five-second Flutter display.
- [x] Start timing after the first frame and navigate to Login only after five seconds.
- [x] Verify content, sizes, timing, and route behavior.

## Login

- [x] CUTRA-UI-301: Arabic design, CustomButton, CustomTextField, validation, loading/error states, and small-screen behavior.
- [x] Keep credentials in LoginModel, state/validation in LoginViewModel, API call in LoginService, and session persistence in the shared service.
- [x] Persist a successful session before clearing the loading state; show its status on Login while no later page is built.
- [x] Support local sign-out and remove links to pages that are not available.
- [ ] Confirm real Login API and password recovery contract in the backend stage.

## Deferred Pages

- [ ] CUTRA-UI-201: Home, after its design is supplied.
- [ ] CUTRA-UI-302: Register, after its design is supplied.
- [ ] CUTRA-UI-303: Pending/Rejected, after their designs and flow are supplied.
- [ ] CUTRA-UI-401/402: Automatic Cutting and Result.
- [ ] CUTRA-UI-501: Manual Cutting.
- [ ] CUTRA-UI-601/701/801: History, Profile, Support.

Do not add routes, screen contents, or new implementation for these pages yet. Older Cutting logic and preliminary Register data remain dormant, not completed features.

## Backend and Release

- [ ] CUTRA-BE-901: Agree the actual server contract and reconcile preliminary Auth fields.
- [ ] CUTRA-BE-902/903: Integrate and test backend flows after local page work.
- [ ] CUTRA-QA-1001/1002/1003: Full visual, security, platform, and release checks.

## Completion Gate

A page is done when its design, interactions, state handling, local logic, lifecycle, navigation, and relevant tests work. Record what remains deferred; do not mark an unseen page complete.
