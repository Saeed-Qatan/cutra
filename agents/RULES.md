# Cutra Rules

1. Read `../agent.md` and the files listed in `README.md` before changing code.
2. Work on one feature at a time. The active pages are Splash and Login. Obtain the owner's design before creating another page, route, ViewModel, model, or service.
3. Follow `ARCHITECTURE.md`: View -> Riverpod ViewModel -> Service -> API/storage with `fpdart` `Either<Failure, T>` for functional error handling. Models are data classes only. Avoid forwarding Repository/DataSource layers.
4. Keep HTTP, storage, cutting rules, and workflow decisions out of Widgets. Keep validation/state/providers out of models.
5. Do not invent authentication success or claim an unavailable backend action occurred. Backend integration is a later stage.
6. Preserve the five-second Splash, local SVG, native icon resources, and approved theme unless the owner requests a change.
7. Update relevant tests and `TASKS.md`, `SYNC_MATRIX.md`, `DECISIONS.md` when behavior changes. Do not mark incomplete pages done.
8. Do not add dependencies or edit generated files casually. Follow `WORKFLOW.md` for asset regeneration.
9. Use the `gap` package (`Gap(...)`) exclusively as the primary spacing standard throughout the entire application instead of `SizedBox` for spacing. `SizedBox` is strictly reserved for explicitly sizing child widgets.
