FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/xray-config


RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    openssl \
    nginx \
    gettext-base \
    python3 \
    python3-pip \
    ca-certificates \
    bash \
    procps \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt .


RUN pip3 install \
    --break-system-packages \
    -r requirements.txt


COPY . .


RUN chmod +x \
    entrypoint.sh \
    healthcheck.sh \
    scripts/*.sh


RUN mkdir -p \
    /etc/xray/cert \
    /var/www/html


RUN rm -f /etc/nginx/sites-enabled/default


COPY nginx.conf /etc/nginx/conf.d/default.conf


RUN echo '<html><body><h1>Welcome</h1></body></html>' \
> /var/www/html/index.html


EXPOSE 443
EXPOSE 9000


ENTRYPOINT ["/opt/xray-config/entrypoint.sh"]
