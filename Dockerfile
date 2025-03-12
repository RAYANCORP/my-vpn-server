# استفاده از تصویر پایه Debian
FROM debian:bullseye-slim

# نصب ابزار curl
RUN apt-get update && apt-get install -y curl

# دانلود فایل v2ray از Google Drive
RUN curl -L -o /usr/bin/v2ray "https://drive.google.com/uc?export=download&id=1-iY66CnUSgR0UIOtH3te1Y5RRCmyMwHs" && \
    chmod +x /usr/bin/v2ray

# کپی فایل پیکربندی V2Ray به داخل تصویر
COPY config.json /etc/v2ray/config.json

# دستور اجرای V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]