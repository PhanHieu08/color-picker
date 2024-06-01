FROM haproxy:latest

USER root

COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y keepalived

RUN mkdir -p /etc/keepalived

COPY entrypoint.sh /var/lib/haproxy

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

COPY color-picker.pem /etc/ssl/certs/

CMD ["./entrypoint.sh"]

