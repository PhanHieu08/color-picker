FROM haproxy:2.9-alpine

USER root

RUN apk add --no-cache keepalived

USER haproxy

RUN mkdir -p /etc/keepalived

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

COPY color-picker.pem /etc/ssl/certs/

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

