# استفاده از تصویر پایه Alpine Linux
FROM alpine:latest

# کپی فایل اجرایی V2Ray به داخل تصویر
COPY v2ray /usr/bin/v2ray

# تنظیم مجوز اجرایی برای فایل V2Ray
RUN chmod +x /usr/bin/v2ray

# کپی فایل پیکربندی V2Ray به داخل تصویر
COPY config.json /etc/v2ray/config.json

# دستور اجرای V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]