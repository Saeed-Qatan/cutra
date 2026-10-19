# Cutra Architecture

Use feature-first MVVM with Riverpod and fpdart. Create directories only for the active feature and only when they have real contents.

```text
lib/
  app/router/                 active GoRouter routes
  core/                       theme, controls, network/storage foundations
  features/auth/
    data/                     AuthServices and API calls returning Either<Failure, T> via fpdart
    models/                   LoginModel data only
    view_models/              LoginState, LoginViewModel, validators, providers
    views/screens/            LoginScreen
    views/widgets/common/     GridBackgroundPainter, TechnicalCornerMarks (_CornerMark)
    views/widgets/login/      LoginForm, LoginIdentity, LoginFooter
    splash/                   Five-second timer, SplashScreen and widgets
```

Only Splash and Login are active routes. Keep future pages disconnected until their design arrives. Existing Cutting logic remains as dormant historical work; do not treat it as a completed feature or import it into active pages.

## Ownership Rules

- View: display state, collect input, forward actions. No HTTP, storage, or business decisions.
- ViewModel: Riverpod state, validation, coordination, and lifecycle handling. Handles `Either` returns from services with `.fold()`.
- Service: API/storage calls returning `Either<Failure, T>` using `fpdart` for explicit, functional error handling.
- Model: fields, constructors, equality/copy/serialization only (`LoginModel`). No Providers, validators, Widgets, or workflow rules.
- Layout & Spacing: The `gap` package (`Gap(...)`) is mandatory for all spacing across Rows, Columns, and layouts. `SizedBox` is reserved only for explicitly sizing child widgets.
- `main.dart`: bootstrap, theme, and router only.

Flow: `View -> ViewModel -> Service (Either<Failure, T>) -> API/storage`. Do not insert a forwarding Repository or DataSource layer. Future services are introduced with their feature.

Splash owns timing; GoRouter owns navigation. It displays complete content for five seconds after the first Flutter frame, then opens Login. After successful Login, show the signed-in state on Login until a destination page is built. Login requests use a preliminary API; final backend contract is deferred.
