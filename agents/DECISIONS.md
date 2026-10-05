# القرارات والحالة

آخر تحديث: 2026-10-01

## الحالة الحالية

تم اعتماد نسخة متوسطة من هيكلة الوكلاء تحتوي 10 ملفات فقط داخل `agents/`.

## قرارات معتمدة

- استخدام `agents/` كمجلد ظاهر في محرر الأكواد.
- عدم استخدام نسختين متوازيتين مثل `.agents/` و`agents/` داخل المشروع الحقيقي.
- اعتماد Flutter مع Riverpod وDio وGoRouter وSecure Storage وSharedPreferences وFreezed/json_serializable.
- اعتماد Feature-first architecture.
- اعتماد SOLID.
- البحث عن مكتبة مستقرة قبل كتابة custom code لوظيفة معروفة.
- عدم إضافة dependency بدون موافقة مالك المشروع.

## أسئلة مفتوحة

- ما API base URL؟
- ما شكل Auth endpoints؟
- هل approval/rejection يأتي من login أم endpoint منفصل؟
- هل history محلي أم backend؟
- ما قيود cutting algorithm؟
- ما منصة الإطلاق الأولى؟

## سجل قرارات مختصر

```text
Date: 2026-10-01
Decision: تقليل هيكلة الوكلاء إلى 10 ملفات فقط.
Reason: المشروع متوسط ولا يحتاج 39 ملفًا للتخطيط.
Impact: أسهل في القراءة والصيانة داخل محرر الأكواد.
Follow-up: استخدام TASKS.md كمصدر المهام الرئيسي.
```

## قالب قرار جديد

```text
Date:
Decision:
Reason:
Impact:
Follow-up:
```
