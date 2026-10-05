# مهام Cutra

إجمالي المهام: 34 مهمة.

## Phase 0: Agent Setup

### CUTRA-001: إنشاء `agents/`
Status: Done
Goal: إنشاء مركز تحكم متوسط الحجم من 10 ملفات.
Verification: عد الملفات.

### CUTRA-002: تثبيت قواعد SOLID والمكتبات
Status: Done
Goal: توثيق SOLID وقاعدة البحث قبل dependency أو custom code.
Verification: مراجعة `RULES.md`.

### CUTRA-003: تثبيت workflow وsync matrix
Status: Done
Goal: ربط العمل بالاختبارات والتكامل.
Verification: مراجعة `WORKFLOW.md` و`SYNC_MATRIX.md`.

## Phase 1: Repository Orientation and Tooling

### CUTRA-101: فحص هيكل المشروع
Status: Todo
Goal: معرفة الملفات الحالية وحالة Flutter.
Verification: تقرير مختصر.

### CUTRA-102: تحديد أوامر التشغيل
Status: Todo
Goal: معرفة run/analyze/test/build.
Verification: أوامر موثقة.

### CUTRA-103: تنظيف starter/demo code
Status: Todo
Goal: إزالة Counter demo أو الملفات غير اللازمة بعد الفحص.
Verification: app still analyzes/runs.

### CUTRA-104: مراجعة dependencies الحالية
Status: Todo
Goal: معرفة الموجود في `pubspec.yaml`.
Verification: قائمة dependencies وملاحظات.

## Phase 2: Core Foundation

### CUTRA-201: بحث واعتماد dependencies الأساسية
Status: Todo
Goal: مراجعة Riverpod/Dio/GoRouter/storage/freezed/json.
Verification: موافقة مالك المشروع.

### CUTRA-202: إعداد core structure
Status: Todo
Goal: إنشاء `core/config`, `errors`, `network`, `storage`, `widgets`.
Verification: analyze.

### CUTRA-203: إعداد Dio API client
Status: Todo
Goal: API client مركزي.
Verification: unit test أو review.

### CUTRA-204: إعداد storage wrappers
Status: Todo
Goal: Secure Storage وSharedPreferences خلف wrappers.
Verification: unit tests.

### CUTRA-205: إعداد shared errors/states
Status: Todo
Goal: توحيد loading/error/failure.
Verification: tests/review.

## Phase 3: Routing and State Pattern

### CUTRA-301: إعداد GoRouter
Status: Todo
Goal: routes أساسية وguards.
Verification: route tests.

### CUTRA-302: تثبيت Riverpod pattern
Status: Todo
Goal: provider/repository/controller pattern.
Verification: review.

### CUTRA-303: مراجعة Dependency Inversion
Status: Todo
Goal: منع UI من معرفة Dio/Storage.
Verification: architecture review.

### CUTRA-304: إعداد app shell
Status: Todo
Goal: ProviderScope + router + theme.
Verification: app launches/analyze.

## Phase 4: Auth Vertical Slice

### CUTRA-401: توثيق Auth API contracts
Status: Todo
Goal: login/register/session/pending/rejected.
Verification: owner review.

### CUTRA-402: بناء Auth models
Status: Todo
Goal: Freezed/json models.
Verification: generation + tests.

### CUTRA-403: بناء Auth data/repository
Status: Todo
Goal: فصل API عن UI.
Verification: unit tests.

### CUTRA-404: بناء Auth controller/storage
Status: Todo
Goal: session restore/logout/states.
Verification: controller tests.

### CUTRA-405: بناء Auth screens
Status: Todo
Goal: splash/login/register/pending/rejected.
Verification: widget tests.

## Phase 5: Home and Cutting

### CUTRA-501: بناء Home
Status: Todo
Goal: landing screen للمستخدم المقبول.
Verification: widget test.

### CUTRA-502: جمع متطلبات cutting
Status: Todo
Goal: الأبعاد، القيود، وحدات القياس.
Verification: owner review.

### CUTRA-503: بحث مكتبات cutting/geometry
Status: Todo
Goal: اقتراح مكتبة أو توثيق custom.
Verification: موافقة.

### CUTRA-504: بناء cutting models/validation
Status: Todo
Goal: material/pieces/constraints.
Verification: unit tests.

### CUTRA-505: بناء automatic cutting logic
Status: Todo
Goal: منطق قابل للاختبار خارج UI.
Verification: unit tests.

### CUTRA-506: بناء manual cutting أساسًا
Status: Todo
Goal: model + interactions الأساسية.
Verification: widget/unit tests.

## Phase 6: Results, History, Profile, Support

### CUTRA-601: بناء Result screen
Status: Todo
Goal: عرض نتائج التقطيع.
Verification: widget test.

### CUTRA-602: بناء History
Status: Todo
Goal: حفظ وفتح النتائج السابقة.
Verification: storage/serialization tests.

### CUTRA-603: بناء Profile
Status: Todo
Goal: عرض بيانات الحساب وlogout.
Verification: widget test.

### CUTRA-604: بناء Support
Status: Todo
Goal: شاشة مساعدة/تواصل.
Verification: widget test.

## Phase 7: Quality and Release

### CUTRA-701: full quality pass
Status: Todo
Goal: format/analyze/test.
Verification: commands pass أو blockers موثقة.

### CUTRA-702: security review
Status: Todo
Goal: مراجعة tokens/storage/API.
Verification: checklist.

### CUTRA-703: release preparation
Status: Todo
Goal: app id/name/icon/splash/signing.
Verification: release checklist.
