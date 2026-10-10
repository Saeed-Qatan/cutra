# Git Branch Workflow

كل ميزة لها فرع مستقل من `develop`، وتغلق صفحتها الحالية وفق `TASKS.md` قبل بدء الصفحة التالية. theme هو أول عمل جديد، ثم Splash، ثم Home. لا تُعامل مراحل backend كجزء من فرع واجهة صفحة مبكرًا.

| النوع | المثال | الاستخدام |
| --- | --- | --- |
| Integration | `develop` | تجميع الميزات |
| Feature | `feature/theme`, `feature/splash`, `feature/home` | تنفيذ ميزة أو صفحة كاملة |
| Fix | `fix/<name>` | إصلاح محدود |
| Docs | `docs/<name>` | توثيق |

## قبل بدء فرع

افحص حالة المستودع والتغييرات الحالية، وراجع `TASKS.md` و`Feature.md`. أنشئ فرعًا من `develop` عندما يكون ذلك آمنًا للتغييرات الموجودة. لا تنقل تغييرات غير محفوظة بين الفروع بلا مراجعة.

## أثناء العمل

اربط التغييرات بـtask ID. أكمل UI/UX وViewModel والمنطق المحلي والاختبارات في نطاق الصفحة أو الميزة. وثق عقود backend المؤجلة، ولا تدخل الربط النهائي مبكرًا. حدّث `SYNC_MATRIX.md` و`DECISIONS.md` عند تغير السلوك أو القرار. شغّل code generation فقط عند تغير مصادر النماذج المولدة.

## قبل Pull Request

- تحقق بصريًا ووظيفيًا من الصفحة المكتملة.
- شغّل `flutter analyze --no-pub` والاختبارات المستهدفة؛ شغّل المجموعة العامة حين يتأثر تدفق مشترك.
- شغّل `dart run build_runner build --delete-conflicting-outputs` عند تغير مصدر generated code.
- استخدم `.github/pull_request_template.md`، واذكر مصدر التصميم، السلوك المحلي، الاختبارات، وما ينتظر backend.
- يستهدف PR فرع `develop`.

بعد دمج الميزة وتحديث `develop`، ابدأ فرع الميزة التالية وفق ترتيب `TASKS.md`. أول مهمة تنفيذ جديدة هي `CUTRA-UI-001` عند وصول theme.
