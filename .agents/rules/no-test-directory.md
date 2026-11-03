---
trigger: always_on
description: "Disallow creating the test directory and writing tests in it"
---

# Testing Policy

- **يُمنع منعاً باتاً إنشاء مجلد `test` في المشروع أو أي مجلدات فرعية له.**
- **يُمنع كتابة أو توليد ملفات اختبار (`*_test.dart`) داخله.**
- لا يتم تضمين مهام إنشاء الاختبارات أو تنفيذها ضمن مراحل العمل إلا إذا طلب المستخدم ذلك صراحة وبشكل منفصل.
- يتم الاعتماد في التحقق وضمان جودة الكود على الالتزام بالمعمارية والتحليل الساكن الفوري (`analyze_files` / `dart analyze`).

