# Workflow

## بداية كل جلسة

1. اقرأ `PLAN.md`.
2. اقرأ `TASKS.md`.
3. اختر task ID واحد.
4. راجع `SYNC_MATRIX.md` إذا كانت المهمة تمس integration أو testing أو generated code.
5. نفذ أقل تغيير يحقق المهمة.

## قبل إضافة مكتبة

1. طبق قاعدة البحث في `RULES.md`.
2. سجل المقارنة والاقتراح في `DECISIONS.md`.
3. انتظر موافقة مالك المشروع.
4. بعد الموافقة فقط يتم تعديل `pubspec.yaml`.

## قبل كتابة كود مخصص

- اسأل: هل توجد مكتبة مستقرة تؤدي هذا الغرض؟
- إذا نعم، اقترحها أولًا.
- إذا لا، وثق سبب الحل المخصص.

## بعد كل مهمة

- حدث حالة المهمة في `TASKS.md`.
- سجل القرار في `DECISIONS.md` إذا وجد.
- حدث `SYNC_MATRIX.md` إذا تغير التكامل أو الاختبارات.
- اكتب handoff مختصر.

## Handoff

```text
Task:
Completed:
Verified:
Decisions:
Open questions:
Next step:
```

## Quality Gates

- Documentation gate قبل التطبيق.
- Dependency gate قبل إضافة أي مكتبة.
- Architecture gate قبل أي Feature.
- Testing gate قبل إغلاق Feature.
- Release gate قبل الإطلاق.
