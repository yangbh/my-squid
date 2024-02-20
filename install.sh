#!/bin/bash

HTTP_BASIC_USER="m0d9"
HTTP_BASIC_PASSWORD="fB3QVmlVkPCIa98E"
DOMAIN="p3.m0d9.me"

# Basic 认证账号密码
# apt install apache2-utils
htpasswd -bc htpasswd $HTTP_BASIC_USER $HTTP_BASIC_PASSWORD

# https 证书
acme.sh --issue -d $DOMAIN --standalone
acme.sh --installcert -d $DOMAIN --fullchainpath ./certs/$DOMAIN.crt --keypath ./certs/$DOMAIN.key --ecc
cat ./certs/$DOMAIN.crt ./certs/$DOMAIN.key > ./certs/$DOMAIN.pem

# docker up
docker-compose up -d
