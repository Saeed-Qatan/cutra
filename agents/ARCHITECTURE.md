# معمارية Cutra

## الشكل العام

Cutra يعتمد Feature-first architecture مع Core مشترك.

```text
lib/
  app/
    router/
    theme/
  core/
    config/
    errors/
    network/
    storage/
    widgets/
  features/
    auth/
    home/
    cutting/
    history/
    profile/
    support/
```

## شكل Feature

```text
features/<feature>/
  data/
    datasources/
    models/
    repositories/
  domain/
    entities/
    repositories/
    usecases/
  presentation/
    controllers/
    screens/
    widgets/
```

لا يتم إنشاء طبقات فارغة بلا حاجة. إذا كانت Feature بسيطة، تبقى بسيطة.

## Riverpod

- `Provider` للاعتمادات.
- `Notifier` للحالة المتزامنة.
- `AsyncNotifier` للحالة غير المتزامنة.
- Widgets ترسل intents وتعرض state فقط.

## Networking

- Dio داخل core API client.
- Data sources تتعامل مع Dio.
- Repositories تخفي تفاصيل API.
- Controllers لا تعرف تفاصيل HTTP.

## Routing

- GoRouter هو نظام التوجيه.
- Auth guard يوجه حسب session state:
  - logged out: login/register
  - pending: pending
  - rejected: rejected
  - accepted: home

## Storage

- Secure Storage للـ tokens والبيانات الحساسة.
- SharedPreferences للتفضيلات غير الحساسة.
