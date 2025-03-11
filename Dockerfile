FROM alpine:latest

# نصب V2Ray
RUN apk add --no-cache curl && \
    curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/bin && \
    chmod +x /usr/bin/v2ray /usr/bin/v2ctl && \
    rm -rf /tmp/v2ray.zip

# کپی فایل پیکربندی
COPY config.json /etc/v2ray/config.json

# اجرای V2Ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]