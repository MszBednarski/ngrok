#!/bin/bash
# want to get a certificate for your server?
# https://levelup.gitconnected.com/obtaining-wildcard-ssl-from-lets-encrypt-fee9ea6ef2b3
sudo snap install --classic certbot && \
sudo ln -s /snap/bin/certbot /usr/bin/certbot
# Confirm plugin containment level
sudo snap set certbot trust-plugin-with-root=ok
sudo snap install certbot-dns-google
sudo certbot certonly -d '*.example.com' --manual --preferred-challenges dns
# client ex
# $GOPATH/bin/ngrok -config=debug.yml -httpauth="main:lol" -subdomain=api 8080