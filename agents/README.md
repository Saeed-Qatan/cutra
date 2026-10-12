# مركز وكلاء Cutra

يحتوي `agents/` كامل تعليمات المشروع. نقطة الدخول هي `../agent.md` في جذر المشروع، ويشير إليها `../AGENTS.md` لتكتشفها الأدوات. يجب قراءة هذه التعليمات قبل العمل. `TASKS.md` هو مصدر ترتيب المهام وحالتها.

## اتجاه العمل

يرسل مالك المشروع theme أولًا، ثم HTML/CSS لكل صفحة. يطبق theme قبل الصفحات. تنفذ كل صفحة Flutter UI/UX مع business logic محلي وفق MVVM وRiverpod، وتختبر قبل بدء الصفحة التالية. يبدأ التسلسل بـSplash ثم Home. يأتي تكامل backend بعد اكتمال الصفحات والمنطق المحلي.

## ترتيب القراءة

1. `../agent.md` ثم هذا الملف و`PLAN.md`.
2. `TASKS.md` لتحديد المرحلة والصفحة الحالية.
3. `ARCHITECTURE.md` و`RULES.md` لتدفق MVVM.
4. `Stitch.md` لقواعد تحويل theme وHTML/CSS.
5. `WORKFLOW.md` و`Feature.md` و`SYNC_MATRIX.md` أثناء التنفيذ.
6. `GIT_BRANCH_WORKFLOW.md` لقواعد الفروع وPull Requests.
7. `DECISIONS.md` للقرارات والأسئلة، و`ROLES.md` للمسؤوليات.

## التقنية القائمة

Flutter وRiverpod وGoRouter وDio وSecure Storage وSharedPreferences، مع `flutter_svg` للشعار و`flutter_native_splash` للبداية الأصلية و`flutter_launcher_icons` لتوليد أيقونات الهاتف. Freezed/json_serializable ليستا اعتمادات مضافة حاليًا؛ لا تفترض وجودهما. حذفت `animated_splash_screen`.

## الحالة والهيكلة الحالية

- داخل الميزة: `models/` و`data/` و`view_models/` و`views/screens/` و`views/widgets/`.
- theme وSplash منفذان؛ تعرض Splash المحتوى الكامل خمس ثوانٍ بعد أول إطار Flutter، ثم يقرر GoRouter الوجهة حسب الجلسة.
- Home ما زالت شاشة عداد أولية وليست الصفحة النهائية. بعض الملفات القديمة تصدر الملفات الجديدة للتوافق.
- وجود Dio وAuthRemoteDataSource لا يعني اكتمال backend أو اكتمال تجربة Auth المحلية؛ راجع `DECISIONS.md`.
