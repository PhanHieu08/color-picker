FROM haproxy:latest

#RUN apk add --no-cache keepalived
COPY sources.list /etc/apt/sources.list

USER root

RUN apt-get update && apt-get install -y systemctl

RUN apt-get install -y keepalived

RUN mkdir -p /etc/keepalived

USER haproxy

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

COPY color-picker.pem /etc/ssl/certs/

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

