# Workflow

## بداية الجلسة

1. اقرأ `../agent.md` ثم جميع تعليمات هذا المجلد بترتيب `README.md`، وحدد المرحلة الحالية من `PLAN.md` و`TASKS.md`.
2. افحص الكود الموجود للصفحة والـtheme قبل التعديل.
3. اقرأ `Feature.md` و`ARCHITECTURE.md` و`SYNC_MATRIX.md`.
4. عند وجود HTML/CSS أو أصول مرجعية، اتبع `Stitch.md`.
5. سجل أي قرار مؤثر في `DECISIONS.md`.

## تسلسل تنفيذ الصفحة

1. استلم تصميم الصفحة بعد اعتماد theme؛ احصر الحالات والتنقل والتفاعل.
2. حوّل HTML/CSS إلى Flutter Widgets باستخدام theme والمكونات المشتركة.
3. عرّف state وViewModel عبر Riverpod في `view_models/`، والنماذج في `models/`، وقواعد العمل المستقلة في خدمة أو خوارزمية عند الحاجة دون إنشاء domain افتراضي.
4. اربط Repository محليًا أو استخدم منطقًا محليًا قائمًا، ووثّق ما ينتظر backend.
5. أكمل التحقق من المدخلات وحالات loading/empty/error، ثم وصل الصفحة بالتنقل.
6. اختبر المنطق والتفاعل وراجع الصورة على المقاسات المستهدفة.
7. شغّل `flutter analyze` والاختبارات المستهدفة، وحدّث `TASKS.md` و`SYNC_MATRIX.md`.
8. اكتب handoff، ثم ابدأ الصفحة التالية فقط بعد إغلاق الحالية.

الشاشات الموجودة مسبقًا تخضع للتدفق نفسه عند وصول تصميمها. لا يغير غياب backend ترتيب العمل، ولا يسمح بترك الصفحة مجرد واجهة ثابتة.

## تدفق MVVM

`View -> Riverpod ViewModel -> domain logic -> Repository -> Local Data Source`. لا تستدعي View مصادر البيانات، ولا يحتوي ViewModel تفاصيل HTTP. في المرحلة الأخيرة يضاف Remote Data Source خلف Repository بعد اعتماد عقد API.

## عند إضافة مكتبة أو code generation

طبق `RULES.md` وسجل القرار. عدّل المصدر فقط للملفات المولدة وأعد التوليد عندما يلزم. لا توسع قائمة الحزم أو نطاق الصفحة دون حاجة مرتبطة بالمهمة.

عند تغيير الشعار، عدل `assets/icons/cutra_icon.svg` ثم نفذ بالترتيب:

```powershell
flutter test --no-pub tool/generate_splash_assets_test.dart
dart run flutter_native_splash:create
dart run flutter_launcher_icons
flutter test --no-pub test/features/auth/splash_screen_test.dart
```

عند تغيير الاعتمادات نفذ `flutter pub get` قبل هذه الأوامر. لتعديل سلوك Splash اختبر كذلك `test/app/router/app_router_test.dart` و`test/widget_test.dart`. تحقق من `flutter analyze --no-pub` وبناء Android عند تغيير موارده. يلزم تثبيت APK الجديد لرؤية الأيقونة وNative Splash؛ Hot Reload لا يكفي. توليد ملفات iOS على Windows لا يؤكد نجاح بناء iOS؛ تحقق منه على macOS لاحقًا.

## الفروع والتسليم

اتبع `GIT_BRANCH_WORKFLOW.md` لفرع كل ميزة. يمكن أن تضم الميزة عدة صفحات مترابطة، لكن تغلق كل صفحة بمعيارها قبل الانتقال داخل الميزة. عند انتهاء الميزة تمر بوابات `Feature.md`.

```text
Task ID:
Page/feature:
Design source:
UI states:
ViewModel/domain behavior:
Local data source:
Backend contract deferred:
Tests and visual verification:
Open questions:
Next page:
```

## مرحلة backend

بعد إغلاق جميع صفحات UI/UX والمنطق المحلي، راجع العقود الحقيقية، وبدّل مصادر البيانات من خلال Repository، واختبر الشبكة والمصادقة والأخطاء. ثم تبدأ مراجعة الجودة والإطلاق.
