# معمارية Cutra

## الشكل العام

يعتمد Cutra Feature-first مع MVVM وRiverpod. تنشأ المجلدات بحسب الحاجة الفعلية، ولا تنشأ طبقات فارغة.

```text
lib/
  app/
    router/
  core/
    theme/
    errors/
    network/
    storage/
    widgets/
  features/
    <feature>/
      presentation/
        screens/
        widgets/
        viewmodels/
      domain/
        models/
        services/
        repositories/
      data/
        datasources/
        repositories/
```

المجلدات الحالية قد تستخدم `controllers/` بدل `viewmodels/`. تُعامل Controllers القائمة كـViewModels إذا كانت تدير حالة العرض عبر Riverpod؛ تُعدّل تدريجيًا عند العمل على ميزتها، دون إعادة تسمية شاملة.

## تدفق MVVM مع Riverpod

1. **View**: Widgets تعرض `AsyncValue` أو state وتستدعي أفعال ViewModel؛ لا تحتوي business logic أو طلبات HTTP.
2. **ViewModel**: `Notifier` أو `AsyncNotifier` (أو النمط الموجود المناسب) يدير حالة الصفحة، التحقق المرتبط بالتفاعل، والتنسيق بين الخدمات.
3. **Model/Domain**: نماذج البيانات وقواعد القص والتحقق المستقل عن الواجهة. تبقى الخوارزميات pure Dart حيث أمكن.
4. **Repository contract**: يعزل مصدر البيانات عن ViewModel. عند الحاجة يستخدم تنفيذ محلي أولًا، ثم تنفيذ remote في مرحلة backend.
5. **Data Source**: التخزين المحلي الآن؛ Dio وواجهات API النهائية في مرحلة التكامل.

```text
User action -> View -> Riverpod ViewModel -> domain logic -> Repository -> Local Data Source
                                                       ثم في مرحلة backend -> Remote Data Source
```

لا يحمل Provider وحده كل منطق الميزة؛ يستخدم لحقن الاعتمادات وكشف الحالة. لا تعتمد View على Dio أو Storage مباشرة.

## Theme وRouting

- يطبق theme المرسل من المالك قبل تحويل الصفحات، وتستخدم الصفحات tokens والمكونات المشتركة.
- GoRouter يربط الصفحات المكتملة. يبدأ التدفق بـSplash ثم Home وفق حالة الجلسة المحلية؛ تضبط حالات الحساب عند إنجازها.
- تُختبر كل صفحة في وضعها المحلي قبل الانتقال إلى التالية.

## Backend لاحقًا

يبقى API client الموجود أساسًا تقنيًا، لا مصدر الحقيقة للواجهات الجديدة حتى اعتماد العقد النهائي. تُوثق احتياجات كل ميزة أثناء بنائها. بعد اكتمال UI/UX والمنطق المحلي، تُربط Remote Data Sources بعقود Repository وتختبر حالات الشبكة والجلسة.
