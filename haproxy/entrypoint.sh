#!/bin/bash

haproxy -f /usr/local/etc/haproxy/haproxy.cfg &

# Check if configuration file is mounted
while [ ! -f /etc/keepalived/keepalived.conf ]; do
    sleep 1
done

# Start Keepalived
keepalived -D -f /etc/keepalived/keepalived.conf

wait
