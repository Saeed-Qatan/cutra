# مركز وكلاء Cutra

يحتوي هذا المجلد خطة تنفيذ التطبيق وتعليمات العمل المشتركة. `TASKS.md` هو مصدر ترتيب المهام وحالتها.

## اتجاه العمل

يرسل مالك المشروع theme أولًا، ثم HTML/CSS لكل صفحة. يطبق theme قبل الصفحات. تنفذ كل صفحة Flutter UI/UX مع business logic محلي وفق MVVM وRiverpod، وتختبر قبل بدء الصفحة التالية. يبدأ التسلسل بـSplash ثم Home. يأتي تكامل backend بعد اكتمال الصفحات والمنطق المحلي.

## ترتيب القراءة

1. `AGENTS.md` و`PLAN.md`.
2. `TASKS.md` لتحديد المرحلة والصفحة الحالية.
3. `ARCHITECTURE.md` و`RULES.md` لتدفق MVVM.
4. `Stitch.md` عند وصول theme أو HTML/CSS.
5. `WORKFLOW.md` و`Feature.md` و`SYNC_MATRIX.md` أثناء التنفيذ.
6. `GIT_BRANCH_WORKFLOW.md` عند إنشاء فرع أو Pull Request.
7. `DECISIONS.md` للقرارات والأسئلة، و`ROLES.md` للمسؤوليات.

## التقنية القائمة

Flutter وRiverpod وGoRouter وDio وSecure Storage وSharedPreferences وFreezed/json_serializable. وجود عميل Dio لا يعني اكتمال تكامل backend. تفاصيل الحالة الفعلية والمهام القادمة في `TASKS.md`.
