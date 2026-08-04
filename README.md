# Xray-config
Make ws, xhttp, wss, xhttp tls config in railway
Railway Docker Project


این پروژه یک قالب استاندارد برای اجرای یک سرویس Docker روی Railway است.


ساختار پروژه


project/

├── Dockerfile
├── entrypoint.sh
├── start.sh
├── healthcheck.sh
├── .dockerignore
├── README.md

└── app/
    └── app.sh



Deploy در Railway




پروژه را در GitHub قرار دهید.


وارد Railway شوید.


گزینه:




New Project



را انتخاب کنید.




گزینه:




Deploy from GitHub Repo



را بزنید.




Repository را انتخاب کنید.




Railway به صورت خودکار Dockerfile را شناسایی می‌کند.



Variables


Railway مقدار PORT را هنگام اجرا تنظیم می‌کند.


برای تست می‌توان مقدار پیش‌فرض تعریف کرد:


PORT=8080




بررسی Logs


از مسیر:


Service
 |
Deployments
 |
Logs



می‌توان وضعیت اجرا را بررسی کرد.


خروجی سالم:


Railway Container Starting
PORT=8080
Application running




Health Check


Health Check هر ۳۰ ثانیه اجرا می‌شود.


مسیر بررسی:


/health



باید پاسخ موفق HTTP دریافت کند.



نکات مهم




داده‌های دائمی داخل Container ذخیره نشوند.


تنظیمات قابل تغییر از Environment Variables خوانده شوند.


برنامه باید Process اصلی Container باشد.


تمام خطاها باید در stdout نمایش داده شوند.




