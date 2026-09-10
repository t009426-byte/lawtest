# 🚀 دليل النشر على Vercel

## المشاكل الشائعة والحلول

### ❌ خطأ: Cannot find module
**الحل:** المسارات النسبية - استخدم `./docs/file.json` بدلاً من `/docs/file.json`

✅ **تم إصلاحه في:** `real-exam.html:522`

---

### ❌ خطأ: File not found in 404
**الحل:** تأكد من وجود جميع الملفات:
```
docs/
├── final-questions.json
├── actual-content.json
├── extracted-questions.json
└── legal-content.json
```

✅ **تم التحقق:** جميع الملفات موجودة

---

### ❌ خطأ: Large file size
**الحل:** تم تقسيم الملفات الكبيرة
- `actual-content.json`: ~2 MB ✅

✅ **في الحدود المسموحة**

---

## خطوات النشر على Vercel

### 1️⃣ تثبيت Vercel CLI
```bash
npm install -g vercel
```

### 2️⃣ تسجيل الدخول
```bash
vercel login
```

### 3️⃣ النشر الأول
```bash
cd ~/Desktop
vercel --prod
```

### 4️⃣ الخيارات الموصى بها
- **Project Name:** lawtest
- **Directory:** current directory (.)
- **Build Command:** leave blank (no build needed)
- **Output Directory:** . (current)

---

## التحقق من النشر

### بعد النشر:
```bash
✅ Vercel URL سيتم عرضه
✅ فتح https://lawtest.vercel.app
✅ اختبار الصفحة الرئيسية
```

### اختبار الملفات:
```javascript
// افتح Console وتحقق:
fetch('./docs/final-questions.json')
  .then(r => r.json())
  .then(d => console.log('✅ سؤال:', d[0].text))
```

---

## ملفات الإعدادات

| الملف | الغرض | الحالة |
|--------|---------|--------|
| `vercel.json` | إعدادات Vercel | ✅ مُنشأ |
| `.vercelignore` | الملفات المستثناة | ✅ مُنشأ |
| `package.json` | معلومات المشروع | ✅ محدّث |

---

## استكشاف الأخطاء

### تفعيل Debug Mode:
```bash
vercel --debug --prod
```

### عرض Logs:
```bash
vercel logs lawtest --prod
```

### إعادة النشر:
```bash
vercel --prod --force
```

---

## الدعم

إذا استمرت المشكلة:

1. تحقق من `vercel.json`:
```json
{
  "version": 2,
  "buildCommand": "echo 'No build needed'",
  "outputDirectory": "."
}
```

2. تحقق من المسارات:
   - استخدم `./docs/` بدلاً من `/docs/`
   - استخدم `./real-exam.html` بدلاً من `/real-exam.html`

3. حذف Cache:
```bash
vercel env pull
vercel --prod --force
```

---

## الملفات المطلوبة على Vercel

```
.
├── real-exam.html           (الملف الرئيسي)
├── index.html               (النسخة الأولية)
├── legal-exam-*.html        (نسخ إضافية)
├── vercel.json              (إعدادات Vercel)
├── .vercelignore            (المستثنيات)
├── package.json             (المعلومات)
└── docs/
    ├── final-questions.json
    ├── actual-content.json
    ├── extracted-questions.json
    └── legal-content.json
```

✅ جميع الملفات موجودة وجاهزة للنشر!

---

**تاريخ التحديث:** 2026-09-10
**الإصدار:** 2.0.0
**الحالة:** ✅ جاهز للنشر
