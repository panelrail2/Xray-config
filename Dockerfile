FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    curl \
    wget \
    unzip \
    ca-certificates \
    nano

RUN mkdir -p /usr/local/bin

RUN wget -O /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip /tmp/xray.zip -d /tmp/xray && \
    mv /tmp/xray/xray /usr/local/bin/xray && \
    chmod +x /usr/local/bin/xray && \
    rm -rf /tmp/xray /tmp/xray.zip

COPY config.json /etc/xray/config.json

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 443
EXPOSE 8080
EXPOSE 8081
EXPOSE 1323
EXPOSE 6165
EXPOSE 8443
EXPOSE 2052
EXPOSE 2053
EXPOSE 22
EXPOSE 2233
EXPOSE 2083
EXPOSE 2082
EXPOSE 8088
EXPOSE 1080
EXPOSE 2026

CMD ["/start.sh"]
