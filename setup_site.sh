#!/bin/bash

WEBSITE_URL="https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip"
APACHE_DIR="/var/www/html"

apt update --yes
apt install apache2 unzip --yes

cd /tmp
wget $WEBSITE_URL
unzip main.zip
cd linux-site-dio-main
cp -R * $APACHE_DIR/
