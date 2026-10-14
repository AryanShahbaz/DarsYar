# درس‌یار | DarsYar

**دستیار درسی تو · Your Study Assistant**

[فارسی](#فارسی) | [English](#english)

---

## فارسی

### معرفی
**درس‌یار** یک برنامهٔ محلی برای مدیریت و پیگیری مطالعه است که هدف آن کمک به نظم‌دادن به درس‌ها و ثبت روند پیشرفت تحصیلی است.

### قابلیت‌ها
- مدیریت و سازمان‌دهی اطلاعات درسی
- ثبت و پیگیری گزارش‌های مطالعه
- رابط کاربری فارسی و راست‌چین (در صورت فعال بودن در نسخهٔ منتشرشده)
- ذخیره‌سازی داده‌ها به‌صورت محلی
- اجرای برنامه از طریق سورس پایتون یا فایل اجرایی ویندوز، بسته به فایل‌های ارائه‌شده در Release

> قابلیت‌های دقیق ممکن است با نسخهٔ منتشرشده تفاوت داشته باشند. پیش از انتشار، این فهرست را با امکانات واقعی همان نسخه تطبیق دهید.

### پیش‌نیازها
**برای فایل اجرایی ویندوز (EXE):** نسخهٔ ویندوز سازگار با فایل منتشرشده.

**برای اجرای سورس‌کد:**
- Python سازگار با پروژه
- pip
- وابستگی‌های فهرست‌شده در `requirements.txt`

### اجرا از سورس
۱. مخزن را دریافت یا کلون کنید:

```bash
git clone <REPOSITORY_URL>
cd <REPOSITORY_FOLDER>
```

۲. محیط مجازی بسازید:

```bash
python -m venv .venv
```

در ویندوز آن را فعال کنید:

```bat
.venv\Scripts\activate
```

۳. وابستگی‌ها را نصب کنید:

```bash
python -m pip install -r requirements.txt
```

۴. اگر `START.bat` در این نسخه وجود دارد، آن را اجرا کنید. سپس آدرس محلی‌ای را که برنامه در ترمینال نشان می‌دهد در مرورگر باز کنید؛ برای نمونه ممکن است `http://127.0.0.1:8000` باشد. از آدرس و پورتی که برنامه واقعاً نمایش می‌دهد استفاده کنید.

### فایل‌های Release
در بخش **Releases**، فایل مناسب را انتخاب کنید. اگر نسخهٔ نصبی و نسخهٔ فشردهٔ قابل‌حمل هر دو ارائه شده‌اند، توضیح همان فایل را بخوانید. تا زمانی که EXE و نصاب روی یک سیستم تمیز آزمایش نشده‌اند، آن‌ها را تأییدشده فرض نکنید.

### داده‌ها و حریم خصوصی
- پیش از به‌روزرسانی یا حذف برنامه، از داده‌های مهم نسخهٔ پشتیبان تهیه کنید.
- محل پایگاه داده به تنظیمات همان نسخه بستگی دارد.
- رمزگذاری پایگاه داده به پیاده‌سازی و پیکربندی واقعی نسخه وابسته است؛ نصب یک کتابخانه به‌تنهایی رمزگذاری را تضمین نمی‌کند.
- تا زمان بررسی امنیت و تنظیمات شبکه، برنامه را روی شبکهٔ عمومی در معرض دسترسی قرار ندهید.

### گزارش مشکل
برای گزارش مشکل در بخش **Issues** این موارد را بنویسید:
- نسخهٔ برنامه و نسخهٔ ویندوز
- مراحل بازتولید مشکل
- پیام خطا یا تصویر آن
- اینکه برنامه از سورس اجرا شده یا از فایل EXE

### مجوز
اگر برای پروژه مجوزی انتخاب کرده‌اید، آن را در فایل `LICENSE` درج کنید. تا زمانی که مجوزی اضافه نشده، فرض نکنید استفادهٔ مجدد یا بازتوزیع نامحدود مجاز است.

---

## English

### Overview
**DarsYar** (“Your Study Assistant”) is a local study-management application intended to help users organize study information and track their learning activity.

### Features
- Organize study-related information
- Record and review study reports
- Persian, right-to-left interface (where available in the published version)
- Local data storage
- Run from Python source or a Windows executable, depending on the assets included in the release

> The exact feature set may vary by release. Verify this list against the actual version before publishing.

### Requirements
**For a Windows executable:** A Windows version compatible with the published file.

**For running from source:**
- A Python version compatible with the project
- pip
- Dependencies listed in `requirements.txt`

### Run from source
1. Clone or download the repository:

```bash
git clone <REPOSITORY_URL>
cd <REPOSITORY_FOLDER>
```

2. Create a virtual environment:

```bash
python -m venv .venv
```

On Windows, activate it:

```bat
.venv\Scripts\activate
```

3. Install dependencies:

```bash
python -m pip install -r requirements.txt
```

4. Run `START.bat` if it is included in this version. Open the local URL printed by the application in your browser. It may look like `http://127.0.0.1:8000`; use the actual address and port shown by the app.

### Release downloads
Go to **Releases** and choose the appropriate asset. If both an installer and a portable archive are provided, read the notes for each asset. Do not consider an EXE or installer verified until it has been tested on a clean Windows environment.

### Data and privacy
- Back up important data before upgrading or removing the application.
- The database location depends on the configuration of the specific release.
- Database encryption depends on the actual implementation and configuration. Installing an encryption library alone does not guarantee that the database is encrypted.
- Do not expose the application to a public network until its security and network settings have been reviewed.

### Bug reports
When opening an **Issue**, include:
- App version and Windows version
- Steps to reproduce the problem
- Error message or screenshot
- Whether you ran from source or from the executable

### License
If you choose a license, add it in a `LICENSE` file. Until a license is included, do not assume that redistribution or reuse is unrestricted.

---

## قالب توضیحات ریلیز / Release notes template

### فارسی
- نسخه: `vX.Y.Z`
- تغییرات اصلی: [تغییرات واقعی این نسخه را بنویسید]
- رفع اشکال‌ها: [موارد واقعی]
- فایل‌های دانلود: [نام فایل‌ها]
- وضعیت آزمایش: [سیستم‌عامل و روش‌هایی که واقعاً آزمایش شده‌اند]

### English
- Version: `vX.Y.Z`
- Highlights: [List the actual changes in this version]
- Bug fixes: [Actual fixes]
- Downloads: [Asset filenames]
- Testing status: [Operating system and scenarios actually tested]
