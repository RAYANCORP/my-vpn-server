# استفاده از تصویر پایه Alpine Linux
FROM alpine:latest

# کپی فایل‌های اجرایی V2Ray به داخل تصویر
COPY v2ray /usr/bin/v2ray
COPY v2ctl /usr/bin/v2ctl

# تنظیم مجوز اجرایی برای فایل‌های V2Ray
RUN chmod +x /usr/bin/v2ray /usr/bin/v2ctl

# کپی فایل پیکربندی V2Ray به داخل تصویر
COPY config.json /etc/v2ray/config.json

# دستور اجرای V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]