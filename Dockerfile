FROM ubuntu:24.04


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    ca-certificates \
    python3 \
    python3-pip \
    procps \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY requirements.txt .


RUN pip3 install \
    --break-system-packages \
    -r requirements.txt


COPY app/ /app/app/

COPY scripts/ /scripts/

COPY config/ /config/


COPY entrypoint.sh /

COPY healthcheck.sh /


RUN chmod +x \
    /entrypoint.sh \
    /healthcheck.sh \
    /scripts/*.sh


RUN mkdir /xray


RUN curl -L \
    -o /tmp/xray.zip \
    https://github.com/XTLS/Xray-core/releases/download/v26.6.1/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /xray \
    && chmod +x /xray/xray


EXPOSE 8080


HEALTHCHECK \
    --interval=30s \
    --timeout=5s \
    CMD /healthcheck.sh


ENTRYPOINT ["/entrypoint.sh"]
