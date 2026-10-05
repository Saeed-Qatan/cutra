# خطة Cutra

## الهدف

بناء تطبيق Flutter متوسط الحجم بطريقة تدريجية: أساس معماري واضح، ثم Auth، ثم Home، ثم Cutting، ثم History/Profile/Support، ثم الجودة والإطلاق.

## المراحل

### Phase 0: Agent Setup

تجهيز ملفات التحكم والتخطيط.

### Phase 1: Repository Orientation and Tooling

فحص المشروع الحالي، تنظيف starter/demo code، وتحديد أوامر run/analyze/test.

### Phase 2: Core Foundation

بناء الأساس المشترك: network، storage، errors، theme، shared widgets.

### Phase 3: Routing and State Pattern

إعداد GoRouter ونمط Riverpod: providers، repositories، controllers، state.

### Phase 4: Auth Vertical Slice

بناء Splash/Login/Register/Pending/Rejected/Home redirect مع session storage.

### Phase 5: Home and Cutting

بناء Home، ثم Automatic Cutting، ثم Manual Cutting بعد تثبيت منطق التقطيع.

### Phase 6: Results, History, Profile, Support

بناء عرض النتائج، السجل، الملف الشخصي، والدعم.

### Phase 7: Quality and Release

تشغيل الاختبارات، مراجعة الأمن، إعداد build/release.

## خارج النطاق الآن

- لا يتم بناء Flutter Features في خطوة إعداد Agents.
- لا يتم إضافة dependencies بدون موافقة.
- لا يتم تنفيذ cutting algorithm قبل تحديد المتطلبات وبحث المكتبات.

## معيار النجاح

- وجود `agents/` يحتوي 10 ملفات فقط.
- وجود خطة ومهام وقواعد واضحة.
- وجود workflow للبحث عن المكتبات والتزامن والاختبارات.
- عدم تعديل كود التطبيق أثناء إعداد التخطيط.
