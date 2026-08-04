FROM ubuntu:24.04


ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC


RUN apt-get update && 

apt-get install -y --no-install-recommends 

curl 

ca-certificates 

nano 

procps 

iproute2 && 

apt-get clean && 

rm -rf /var/lib/apt/lists/*


RUN useradd -m -s /bin/bash appuser


WORKDIR /app


COPY entrypoint.sh /app/
COPY start.sh /app/
COPY healthcheck.sh /app/
COPY app/ /app/app/


RUN chmod +x /app/.sh && 

chmod +x /app/app/


RUN chown -R appuser:appuser /app


USER appuser


ENV PORT=8080


EXPOSE 8080


HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 

CMD /app/healthcheck.sh


ENTRYPOINT ["/app/entrypoint.sh"]
