# Pull Request

## Feature / Task

- Branch:
- Target branch: `develop`
- Task IDs:
- Feature name:

## Summary

اكتب هنا ملخصًا واضحًا لما تم إنجازه.

## Scope

- ما يدخل ضمن هذا PR:
- ما لا يدخل ضمن هذا PR:

## Agent Checklist

- [ ] بدأ العمل من `develop` أو من branch مقصود وموثق.
- [ ] اسم الفرع مطابق للقاعدة: `feature/*` أو `fix/*` أو `docs/*`.
- [ ] لا يحتوي PR على أكثر من Feature مستقلة.
- [ ] تم تحديث `agents/TASKS.md` عند تغير حالة المهام.
- [ ] تم تحديث `agents/SYNC_MATRIX.md` عند تغير integration أو testing أو generated code.
- [ ] تم تسجيل القرارات في `agents/DECISIONS.md` عند الحاجة.
- [ ] لم تتم إضافة dependency جديدة بدون بحث وموافقة.
- [ ] إذا تغيرت Freezed/json models، تم تحديث الملفات المولدة.

## Verification

- [ ] `flutter pub get`
- [ ] `dart run build_runner build --delete-conflicting-outputs`
- [ ] `flutter analyze --no-pub`
- [ ] `flutter test --no-pub`

إذا تم تخطي أمر، اذكر السبب:

```text
Skipped:
Reason:
```

## Screens / UI

- هل يحتوي PR على شاشات؟ نعم / لا
- إن وجدت واجهات من Stitch، هل تم اتباع `agents/Stitch.md`؟ نعم / لا / لا ينطبق

## Handoff

```text
Completed:
Verified:
Decisions:
Open questions:
Next branch:
```

