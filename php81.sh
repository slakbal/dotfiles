#!/bin/sh

echo "Purging the current php environment..."
sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`

#https://computingforgeeks.com/how-to-install-php-on-ubuntu-linux-system/

echo "Setting up php 8.0 environment..."
sudo -v
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt install php8.0 -y
sudo apt install php8.0-{common,gd,opcache,cli,bz2,fpm,curl,intl,bcmath,redis,mbstring,zip,mysql,readline,xml,sqlite3,xdebug} php-sqlite3 openssl -y

php -v
php -m
php -m | grep sqlite

valet restart
