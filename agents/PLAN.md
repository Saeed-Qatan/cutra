# Cutra Development Plan

## Sequence

1. Theme and shared controls: implemented.
2. Splash: implemented with full five-second display and local icon.
3. Login: current feature; finish its UI, state, validation, session behavior, and tests.
4. Next page: start only after the owner supplies its design and behavior. Home, Register, Pending, Rejected, Cutting, Result, History, Profile, and Support are deferred.
5. Review the real API contract and integrate the backend after the local page flows are complete.
6. Run full quality and release checks.

Finish a page's UI/UX and local business logic before moving to the next. Do not build placeholder routes or feature code in advance. See `TASKS.md` for completion status.

## MVVM

`View -> Riverpod ViewModel -> Service -> API/storage` when a service is needed. Views only render and send intents. ViewModels own state, validation, and orchestration. Services own external access or independent algorithms. Models hold data and serialization only. Use no Repository/DataSource layer unless a later requirement makes it necessary.
