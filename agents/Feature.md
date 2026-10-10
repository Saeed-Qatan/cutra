# Feature Workflow

## تعريف الميزة

الميزة وحدة عمل تؤدي فعلًا كاملًا للمستخدم. لا تغلق عندما يكتمل شكل الصفحة فقط؛ يجب أن تعمل UI/UX والمنطق المحلي والتنقل والحالات والاختبارات. تشمل أمثلة المسار المعتمد: theme، Splash، Home، صفحات الحساب، Automatic Cutting وResult، Manual Cutting، History، Profile، Support. ربط backend ميزة تكامل لاحقة مستقلة.

قد تضم ميزة واحدة صفحات مترابطة، مثل Login/Register/Pending/Rejected، لكن تُغلق كل صفحة داخلها قبل الانتقال إلى التالية. ترتيب العمل في `TASKS.md` هو المرجع.

## فرع الميزة

ابدأ من `develop` على فرع `feature/<name>` بعد فحص التغييرات الموجودة. أمثلة: `feature/theme` و`feature/splash` و`feature/home` و`feature/auth-ui`. استخدم `fix/<name>` للإصلاح و`docs/<name>` للتوثيق. تفاصيل PR في `GIT_BRANCH_WORKFLOW.md`.

## بداية العمل

1. حدد task ID والصفحة الحالية من `TASKS.md`.
2. افحص الكود الموجود والشاشة السابقة ومسار التنقل.
3. استلم theme أو HTML/CSS والأصول الخاصة بالصفحة، واتبع `Stitch.md`.
4. حدد حالات الصفحة وقواعد business logic ومصدر البيانات المحلي.
5. حدد ملفات View وViewModel وdomain وRepository المطلوبة وفق `ARCHITECTURE.md`.
6. وثق مدخلًا ناقصًا أو قرارًا مؤثرًا في `DECISIONS.md`.

## تنفيذ الميزة

`View -> Riverpod ViewModel -> domain logic -> Repository -> Local Data Source`.

- View تستخدم theme وتعرض الحالة وترسل الأفعال.
- ViewModel يدير state ويتعامل مع نوايا المستخدم.
- منطق المجال يبقى قابلًا للاختبار دون Widgets.
- Repository المحلي يتيح تجربة كاملة حتى يصل backend.
- يسجل عقد remote المنتظر، ويؤجل الربط النهائي إلى مرحلة `CUTRA-BE-901` وما بعدها.

لا تتوسع في ميزة تالية قبل إكمال الحالية. إذا كان المنطق موجودًا مسبقًا، أعد استخدامه واختبره مع التصميم الجديد.

## بوابات إغلاق الصفحة/الميزة

- التصميم مطابق للمرجع على المقاسات المستهدفة، والحالات المطلوبة مغطاة.
- التفاعل والتنقل والتحقق والمنطق المحلي يعملون دون placeholder.
- لا تعتمد Widget على Dio أو Storage مباشرة.
- الاختبارات المناسبة و`flutter analyze` ينجحان، أو يوثق عائق البيئة ونتيجة الفحص الممكن.
- تحدث `TASKS.md` و`SYNC_MATRIX.md`، وتسجل القرارات الجديدة.
- توثق نقاط backend المؤجلة، ولا تُسمى الميزة مكتملة إذا نقصت وظيفة محلية أساسية.

## Handoff

```text
Feature / page:
Branch:
Task IDs:
Theme and HTML/CSS source:
UI states and responsive review:
ViewModel and domain behavior:
Local repository:
Backend contract deferred:
Tests and analysis:
Open questions:
Next page:
```

بعد إغلاق الميزة وتسليمها، يبدأ فرع الميزة التالية من `develop` وفق `GIT_BRANCH_WORKFLOW.md`.
