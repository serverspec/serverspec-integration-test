#!/bin/sh

cat << _EOT_ > /etc/systemd/system/docker-tcp.socket
[Unit]
Description=Docker Socket for the API

[Socket]
ListenStream=2375
BindIPv6Only=both
Service=docker.service

[Install]
WantedBy=sockets.target
_EOT_

systemctl stop docker.socket
systemctl disable docker.socket
systemctl stop docker
systemctl enable docker-tcp.socket
systemctl start docker-tcp.socket
systemctl start docker

docker pull ubuntu:trusty


