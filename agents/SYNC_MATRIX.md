# Sync Matrix

هذا الملف يمنع انفصال الكود عن التكامل والاختبارات والملفات المولدة.

| المرحلة | الكود | API integration | المكتبات | generated code | الاختبارات | التحقق | المسؤول |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Phase 0 Agents | `agents/` | لا يوجد | لا يوجد | لا يوجد | فحص وثائق | عد 10 ملفات | Codex |
| Phase 1 Orientation | repo root | فحص فقط | لا إضافة | لا يوجد | baseline | analyze/test إن أمكن | Codex |
| Phase 2 Core | `lib/core` | client setup | بحث وموافقة | حسب الحاجة | unit tests | analyze/test | Codex |
| Phase 3 Routing/State | `lib/app`, providers | لا يوجد | GoRouter/Riverpod | state models | route/state tests | analyze/test | Codex |
| Phase 4 Auth | `features/auth` | auth endpoints | لا إضافة بلا موافقة | auth models | unit/widget | analyze/test | Codex |
| Phase 5 Cutting | `features/cutting` | optional | بحث geometry/cutting libs | cutting models | unit-heavy | analyze/test | Codex + Antigravity |
| Phase 6 Results/Profile | history/profile/support | optional | لا إضافة بلا موافقة | result models | unit/widget | analyze/test | Codex |
| Phase 7 Release | whole app | final check | dependency audit | regenerate | full suite | build/test | Codex + Owner |

## قاعدة

إذا تغير عمود من الأعمدة، حدّث هذا الملف أو سجل سبب عدم الحاجة للتحديث في handoff.
