# قواعد Cutra

## قواعد عامة

- لا تبدأ التنفيذ قبل فهم المهمة والمرحلة.
- لا توسع نطاق المهمة بدون سبب واضح.
- لا تضف dependency بدون بحث وموافقة.
- لا تعدل generated files يدويًا.
- لا تضع business logic داخل Widgets.

## SOLID

### Single Responsibility

كل Class أو Widget أو Service له مسؤولية واحدة واضحة.

### Open/Closed

التوسع يكون بإضافة سلوك جديد بدل كسر السلوك الموجود قدر الإمكان.

### Liskov Substitution

أي implementation لعقد يجب أن يعمل مكان العقد بدون تغيير توقعات المستهلك.

### Interface Segregation

لا تنشئ interfaces كبيرة أو كثيرة بلا حاجة. افصل العقود عند اختلاف المسؤوليات.

### Dependency Inversion

UI يعتمد على Controllers وProviders، وليس على Dio أو Storage أو API مباشرة.

## قاعدة المكتبات

قبل كتابة كود مخصص لحل معروف:

1. ابحث عن مكتبة مستقرة.
2. قارن الخيارات.
3. اقترح المكتبة على مالك المشروع.
4. وضح سبب الاختيار والمخاطر.
5. لا تضفها قبل الموافقة.
6. سجل القرار في `DECISIONS.md`.

## الملفات المولدة

- لا تعدل `*.g.dart` أو `*.freezed.dart` يدويًا.
- عدل المصدر فقط.
- شغل code generation بعد تغيير models أو annotations.
