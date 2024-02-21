#!/bin/bash

HTTP_BASIC_USER="m0d9"
HTTP_BASIC_PASSWORD="xxxx"
DOMAIN="p3.m0d9.me"

# Basic 认证账号密码
# apt install apache2-utils
htpasswd -bc htpasswd $HTTP_BASIC_USER $HTTP_BASIC_PASSWORD

# https 证书
acme.sh --issue -d $DOMAIN --standalone
acme.sh --installcert -d $DOMAIN --fullchainpath ./certs/squid.crt --keypath ./certs/squid.key --ecc
cat ./certs/squid.crt ./certs/squid.key > ./certs/squid.pem

# docker up
docker-compose up -d
