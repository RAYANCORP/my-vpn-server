# استفاده از تصویر پایه Alpine Linux
FROM alpine:latest

# نصب ابزارهای لازم (curl و unzip)
RUN apk add --no-cache curl unzip && \
    # دانلود فایل V2Ray از GitHub
    curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    # استخراج فایل دانلود‌شده
    unzip /tmp/v2ray.zip -d /usr/bin && \
    # تنظیم مجوز اجرایی برای فایل‌های V2Ray
    chmod +x /usr/bin/v2ray /usr/bin/v2ctl && \
    # حذف فایل زیپ برای کاهش حجم تصویر
    rm -rf /tmp/v2ray.zip

# کپی فایل پیکربندی V2Ray به داخل تصویر
COPY config.json /etc/v2ray/config.json

# دستور اجرای V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]