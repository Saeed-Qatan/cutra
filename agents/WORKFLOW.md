# Workflow

## بداية الجلسة

1. اقرأ `PLAN.md` و`TASKS.md` وحدد المرحلة الحالية فقط.
2. افحص الكود الموجود للصفحة والـtheme قبل التعديل.
3. اقرأ `Feature.md` و`ARCHITECTURE.md` و`SYNC_MATRIX.md`.
4. عند وجود HTML/CSS أو أصول مرجعية، اتبع `Stitch.md`.
5. سجل أي قرار مؤثر في `DECISIONS.md`.

## تسلسل تنفيذ الصفحة

1. استلم تصميم الصفحة بعد اعتماد theme؛ احصر الحالات والتنقل والتفاعل.
2. حوّل HTML/CSS إلى Flutter Widgets باستخدام theme والمكونات المشتركة.
3. عرّف state وViewModel عبر Riverpod؛ انقل قواعد العمل إلى domain/service مستقل.
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
