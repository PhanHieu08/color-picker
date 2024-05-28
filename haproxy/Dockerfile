FROM haproxy:2.9-alpine

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

COPY color-picker.pem /etc/ssl/certs/

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]

