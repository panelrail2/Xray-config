FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive


RUN apt update && apt install -y \
curl \
ca-certificates \
nano


RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)"


COPY config.json /usr/local/etc/xray/config.json


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
