# تحويل Theme وHTML/CSS إلى Flutter

يرسل مالك المشروع theme أولًا، ثم كود HTML/CSS لكل صفحة تباعًا. تستخدم هذه الملفات مرجعًا للتصميم والتفاعل، وتحوّل إلى Widgets أصلية في Flutter. ترتيب الصفحات ومعيار اكتمالها في `TASKS.md`.

## استقبال theme

1. استخدم لوحة `lib/core/constants/colors.dart` ونظام النص والأحجام في `lib/core/theme/app_theme.dart`.
2. راجع `light_theme.dart` و`dark_theme.dart` قبل إضافة لون جديد.
3. نفذ التفاصيل الخاصة بكل صفحة عند وصول HTML/CSS الخاص بها، وأعد استخدام الأنماط المشتركة.

## استقبال الصفحة

توضع الشاشة في `features/<feature>/views/screens/` ومكوناتها في `views/widgets/` (يمكن تجميعها بحسب الصفحة)، والحالة في `view_models/` والبيانات في `models/` و`data/`. لا تستخدم مسارات `presentation/screens/` القديمة للصفحات الجديدة.

اطلب أو راجع: HTML وCSS والأصول وصورة مرجعية إن وجدت، وسلوك الأزرار والحقول، وحالات loading/empty/error/disabled، والمقاسات المستهدفة. احصر ما هو ظاهر في التصميم وما هو مطلوب من business logic حتى تعمل الصفحة.

| مرجع HTML/CSS | تنفيذ Flutter |
| --- | --- |
| البنية | Widget tree |
| الألوان الأساسية | `colors.dart` وملفا light/dark |
| النص والأحجام والأزرار المشتركة | `app_theme.dart` |
| تفاصيل الصفحة | Widgets الصفحة وفق HTML/CSS |
| النماذج والأزرار | Widgets مع validation والتفاعل |
| responsive rules | LayoutBuilder أو قيود مناسبة |
| التفاعل والبيانات | Riverpod ViewModel وdomain وRepository محلي |

## خطوات التنفيذ

1. اختر task ID للصفحة الحالية من `TASKS.md`.
2. افحص theme والشاشة القائمة والـrouting.
3. حوّل التصميم إلى Flutter وراجع التطابق بصريًا.
4. ابنِ حالات الصفحة وتفاعلها وViewModel باستخدام Riverpod.
5. اربط business logic وRepository محليًا؛ لا تضع المنطق في Widget.
6. أكمل loading/empty/error والتحقق والتنقل حسب الحاجة.
7. اختبر الصفحة وظيفيًا وبصريًا وحدّث `SYNC_MATRIX.md` و`TASKS.md`.
8. وثق اختلاف التصميم أو نقطة backend المؤجلة في handoff.

لا تستخدم WebView لعرض HTML/CSS بدل تحويله. لا تنشئ component مشتركًا إلا إذا كان مفيدًا فعلًا أو واردًا في theme.

## Splash المعتمدة

HTML/CSS لـSplash وصل ونُفذ. يحتوي العرض على VER. 1.0 وENG-TOOL والشعار وCutra والعبارة العربية والنقاط والنص السفلي والشبكة وعلامات الزوايا. استخدم `AppAssets.appIcon` بدل رابط الصورة الخارجي. المحتوى الكامل يظهر خمس ثوانٍ بعد أول إطار Flutter؛ لا تقيده بارتفاع ثابت 500 ولا تستخدم مكتبة تتولى التنقل بدل GoRouter. حافظ على النص المرسل «أداة هندسية لتقطيع الزجاج»؛ اختلافه عن نطاق خوارزمية السجاد الحالية سؤال منتج موثق، لا مبرر لتغيير الخوارزمية دون طلب.

## بوابة التسليم

تكتمل الصفحة عندما تعمل واجهتها وتجربتها ومنطقها المحلي، ويُراجع شكلها على المقاسات المقصودة وتنجح اختبارات السلوك المناسبة. إذا كان HTML/CSS لا يوضح تفاعلًا أساسيًا، يسجل السؤال ولا تُعتبر الميزة مكتملة حتى يحسم سلوكها.

```text
Page / task ID:
Theme reference:
HTML/CSS and assets:
Flutter target:
States and interactions:
ViewModel/domain:
Local data:
Backend deferred:
Visual and automated checks:
Design deviations:
```
