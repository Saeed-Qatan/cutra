# تحويل Theme وHTML/CSS إلى Flutter

يرسل مالك المشروع theme أولًا، ثم كود HTML/CSS لكل صفحة تباعًا. تستخدم هذه الملفات مرجعًا للتصميم والتفاعل، وتحوّل إلى Widgets أصلية في Flutter. ترتيب الصفحات ومعيار اكتمالها في `TASKS.md`.

## استقبال theme

1. احصر الألوان والخطوط والأوزان والمسافات والزوايا والأيقونات والأصول.
2. حدد light/dark وRTL والمقاسات المستهدفة بحسب المرجع.
3. نفذ tokens و`ThemeData` و`TextTheme` والمكونات المشتركة.
4. راجع المظهر قبل بدء Splash. لا تخمّن قيمة تصميم غير واضحة إذا كانت مؤثرة؛ سجلها في `DECISIONS.md`.

## استقبال الصفحة

اطلب أو راجع: HTML وCSS والأصول وصورة مرجعية إن وجدت، وسلوك الأزرار والحقول، وحالات loading/empty/error/disabled، والمقاسات المستهدفة. احصر ما هو ظاهر في التصميم وما هو مطلوب من business logic حتى تعمل الصفحة.

| مرجع HTML/CSS | تنفيذ Flutter |
| --- | --- |
| البنية | Widget tree |
| الألوان والخطوط والمسافات | theme وtokens المشتركة |
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
