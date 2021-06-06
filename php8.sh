#!/bin/sh

echo "Setting up php 8.0 environment..."

sudo -v

## Update Repos
# sudo apt -y update

# Clean Up
# sudo apt-get purge 'php7*'
# sudo apt-get autoclean && sudo apt-get autoremove

# sudo apt install software-properties-common && sudo add-apt-repository ppa:ondrej/php

sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

# PHP 7.4 SETUP
# sudo apt install php7.4-{common,gd,opcache,cli,bz2,curl,intl,bcmath,redis,mbstring,zip,mysql,readline,xml,sqlite3} openssl -y

# PHP 8.0 SETUP
sudo apt install php8.0 -y

#sudo apt install php8.0-cli php8.0-fpm php8.0-bcmath php8.0-curl php8.0-gd php8.0-intl php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-sqlite3 php8.0-xml php8.0-zip -y


sudo apt install php8.0-{common,gd,opcache,cli,bz2,fpm,curl,intl,bcmath,redis,mbstring,zip,mysql,readline,xml,sqlite3} php-sqlite3 openssl -y

php -v

php -m

php -m | grep sqlite

#valet use
