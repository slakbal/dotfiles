#!/bin/sh

echo "Setting up php 7.3 and 8.0 environment..."

sudo -v

## Update Repos
# sudo apt -y update

# Clean Up
# sudo apt-get purge 'php7*'
# sudo apt-get autoclean && sudo apt-get autoremove

sudo apt install software-properties-common && sudo add-apt-repository ppa:ondrej/php

# PHP 7.4 SETUP
sudo apt install php7.4-{common,gd,opcache,cli,bz2,curl,intl,bcmath,redis,mbstring,zip,mysql,readline,xml} openssl -y

# PHP 8.0 SETUP
sudo apt install php8.0-{common,gd,opcache,cli,bz2,curl,intl,bcmath,redis,mbstring,zip,mysql,readline,xml} openssl -y

php -v

php -m

#valet use