# Sync Matrix

يربط هذا الجدول كل مرحلة بالكود والمنطق والاختبارات ونقطة تكامل backend المؤجلة. تفاصيل التنفيذ وحالة المهام في `TASKS.md`.

| المرحلة | View وtheme | ViewModel/Domain | البيانات الآن | backend لاحقًا | التحقق |
| --- | --- | --- | --- | --- | --- |
| Theme | tokens وThemeData ومكونات مشتركة | تفضيل theme عند الحاجة | محلي | لا يوجد | مراجعة بصرية + analyze |
| Splash | تصميم البداية والحالات | تهيئة وتوجيه حسب الجلسة | session محلية | استعادة الجلسة من الخادم | route/widget tests |
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

حدّث صفها إذا تغير سلوك الصفحة أو مصدر بياناتها أو اختبارها. أي model مولد يعاد توليده من مصدره، ولا تعدل ملفات `*.g.dart` أو `*.freezed.dart` يدويًا. لا تعتبر الصفحة مكتملة إذا غاب تفاعل أو منطق محلي أساسي، حتى لو اكتمل تصميمها.
