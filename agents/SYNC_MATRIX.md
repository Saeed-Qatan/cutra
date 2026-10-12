# Sync Matrix

يربط هذا الجدول كل مرحلة بالكود والمنطق والاختبارات ونقطة تكامل backend المؤجلة. تفاصيل التنفيذ وحالة المهام في `TASKS.md`.

| المرحلة | View وtheme | ViewModel/Domain | البيانات الآن | backend لاحقًا | التحقق |
| --- | --- | --- | --- | --- | --- |
| Theme | 13 لونًا ونظام نص/أحجام وأزرار مع light/dark | وضع الجهاز | خطوط محلية | لا يوجد | analyze + اختبارات العرض والتنقل؛ مراجعة الداكن بصريًا مع الصفحات |
| Splash | `auth/views/screens/splash_screen.dart` ومكونات `views/widgets/splash/` | `auth_view_model.dart` و`splash_view_model.dart`؛ عرض كامل خمس ثوانٍ ثم توجيه | session محلية وشعار SVG عبر AppAssets | مراجعة الجلسة والخادم في مرحلة التكامل | splash_screen_test + app_router_test؛ مراجعة 390x844 والمحاكي |
| App Icon / Native Splash | SVG أسود وأبيض وأزرق في `assets/icons/`؛ إعدادات pubspec | `tool/generate_splash_assets_test.dart` | PNG مولدة؛ launcher resource `cutra_launcher` | لا يوجد | flutter_native_splash:create + flutter_launcher_icons + APK build؛ iOS generated فقط على Windows |
| Home | التصميم والإجراءات والتنقل | حالة الصفحة والإجراءات | بيانات محلية | استبدال مصدر البيانات | widget/flow tests |
| Account | Login/Register/Pending/Rejected | التحقق وحالة الجلسة | Auth repository محلي | API Auth والعقد الفعلي | unit/widget/flow tests |
| Automatic Cutting + Result | إدخال ومخطط ونتائج | validation وخوارزمية قص | models محلية | حفظ/مزامنة عند الحاجة | algorithm/widget tests |
| Manual Cutting | تفاعل يدوي وعرض النتيجة | محرك القص والقيود | models محلية | حفظ/مزامنة عند الحاجة | interaction/unit tests |
| History | قائمة وتفاصيل | حفظ وفتح وحذف | local repository | مزامنة وفق قرار المنتج | serialization/flow tests |
| Profile | بيانات وتفضيلات | تعديل وخروج | session/preferences محلية | تحديث الحساب | widget/flow tests |
| Support | قنوات ونموذج عند وجوده | validation وحالة الطلب | حالة محلية | إرسال خارجي | widget tests |
| Backend integration | لا تغيير بصري إلا لخطأ فعلي | الحفاظ على ViewModels | Local/Remote repositories | اعتماد العقد والربط | contract/integration tests |
| Release | فحص جميع الصفحات | فحص المسارات كاملة | بيانات الإنتاج | خادم الإنتاج | analyze/test/build |

## عند تغيير ميزة

المسارات أعلاه نسبية إلى `lib/features/` حيث لم يذكر خلاف ذلك. استخدم `models/data/view_models/views` للميزات، ولا توثق ملفات exports أو الموجّه القديم على أنها تنفيذ مستقل.

حدّث صفها إذا تغير سلوك الصفحة أو مصدر بياناتها أو اختبارها. أي model مولد يعاد توليده من مصدره، ولا تعدل ملفات `*.g.dart` أو `*.freezed.dart` يدويًا. لا تعتبر الصفحة مكتملة إذا غاب تفاعل أو منطق محلي أساسي، حتى لو اكتمل تصميمها.
