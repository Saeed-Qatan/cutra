# معمارية Cutra

## الشكل العام

يعتمد Cutra Feature-first مع MVVM وRiverpod. تنشأ المجلدات بحسب الحاجة الفعلية، ولا تنشأ طبقات فارغة.

```text
lib/
  app/
    router/
  core/
    constants/
    theme/
    errors/
    network/
    storage/
    widgets/
  features/
    <feature>/
      models/
      data/
        repositories/ # عند الحاجة؛ موجود في Auth وHome
      view_models/
      views/
        screens/
        widgets/
```

هذه الهيكلة تخص الميزة فقط؛ لا تنشئ مجلدًا أو ملفًا بلا حاجة. ضع النماذج في `models/`، وعقود البيانات وتنفيذها في `data/`، والحالة وProviders في `view_models/`، والعرض في `views/`. لا تنشئ `presentation/` أو `domain/` افتراضيًا للميزات الجديدة. يمكن إبقاء خوارزمية أو خدمة pure Dart منفصلة عندما تقتضي طبيعة الميزة ذلك.

## خريطة الكود الحالي

- Auth: `lib/features/auth/models/auth_models.dart`، و`data/` لمصادر البيانات وعقود Repository، و`view_models/auth_view_model.dart`، و`view_models/splash_view_model.dart`، و`views/` للشاشات ومكونات كل صفحة.
- Home: `models/home_model.dart` و`data/repositories/` و`view_models/home_view_model.dart` و`views/`. التطبيق الحالي عداد مبدئي.
- Cutting: `models/cutting_models.dart` و`view_models/`؛ تحتفظ الخوارزميات بمسار `domain/algorithms/` الحالي، ولا توجد واجهات نهائية بعد.
- ملفات Auth/Home المباشرة في `data/` قد تكون exports إلى `data/repositories/`. وملفات Cutting القديمة في `presentation/controllers/` و`data/models/` ملفات توافق. افحص محتواها قبل التعديل ولا تنشئ تطبيقًا ثانيًا للمنطق.
- التوجيه الفعلي من `lib/app/router/app_router.dart`. يوجد موجّه قديم في `lib/core/routes/app_router.dart` لا يستخدمه جذر التطبيق؛ لا تربط التنقل الجديد به.

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

- لوحة الألوان في `lib/core/constants/colors.dart`، والنص والأحجام والمكونات المشتركة في `lib/core/theme/app_theme.dart`.
- يحدد `light_theme.dart` و`dark_theme.dart` ألوان كل وضع، ويربطهما `main.dart` حسب وضع الجهاز.
- تستمد تفاصيل كل صفحة من HTML/CSS الخاص بها عند وصوله، وتستخدم النظام المشترك بدل القيم المتفرقة.
- `main.dart` يهيئ SharedPreferences وProviderScope ويربط theme وGoRouter فقط؛ لا تضف مؤقتات أو تفاصيل شاشات إليه.
- `SplashViewModel` يدير مؤقت خمس ثوانٍ يبدأ بعد أول إطار للصفحة. يهيئ `AuthViewModel` الجلسة بالتوازي، ويمنع GoRouter تجاوز Splash قبل انتهاء المؤقت. بعده تكون الوجهة Login أو Pending أو Rejected أو Home بحسب الحالة، وتبقى Splash عند استمرار التحقق.
- تُختبر كل صفحة في وضعها المحلي قبل الانتقال إلى التالية.

## الشعار وموارد المنصات

- مصدر الشعار `assets/icons/cutra_icon.svg`؛ C أبيض وخلفية `#111111` وقطع `#00439B`. تعرضه View عبر `AppAssets.appIcon` و`flutter_svg` دون شبكة.
- `tool/generate_splash_assets_test.dart` يولد صور PNG للـNative Splash وأيقونة الهاتف من SVG.
- إعدادات `flutter_native_splash` و`flutter_launcher_icons` في `pubspec.yaml`. يولد الأخير موارد `cutra_launcher` ويشير AndroidManifest إليها.
- Native Splash تظهر أثناء تهيئة Flutter فقط. صفحة Flutter الكاملة مستقلة عنها وتملك مؤقت الخمس ثوانٍ. لا تعِد إضافة `animated_splash_screen` ولا تسمح بتنقل تلقائي موازٍ لـGoRouter.

## Backend لاحقًا

يبقى API client الموجود أساسًا تقنيًا، لا مصدر الحقيقة للواجهات الجديدة حتى اعتماد العقد النهائي. تُوثق احتياجات كل ميزة أثناء بنائها. بعد اكتمال UI/UX والمنطق المحلي، تُربط Remote Data Sources بعقود Repository وتختبر حالات الشبكة والجلسة.
