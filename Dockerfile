# استفاده از تصویر آماده V2Ray
FROM v2fly/v2fly-core:latest

# کپی فایل پیکربندی V2Ray به داخل تصویر
COPY config.json /etc/v2ray/config.json

# دستور اجرای V2Ray
CMD [ "-c", "v2ray -config=/etc/v2ray/config.json"]