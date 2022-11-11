#!/bin/sh

cd ~

# remove Apache
sudo apt-get remove --purge apache2 apache2-utils
sudo apt-get --purge autoremove
sudo apt update && sudo apt upgrade 

echo "Setup PHP..."

# https://tecadmin.net/how-to-install-php-on-ubuntu-22-04/
sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https unzip
sudo apt install -y software-properties-common
# LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.1 -y
sudo apt install php8.1-common php8.1-gd php8.1-opcache php8.1-cli php8.1-bz2 php8.1-fpm php8.1-curl php8.1-intl php8.1-bcmath php8.1-redis php8.1-mbstring php8.1-zip php8.1-mysql php8.1-readline php8.1-xml php8.1-sqlite3 php8.1-xdebug php8.1-sqlite3 php-sqlite3 openssl -y

echo "Setting up composer..."

cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo "Install Valet..."

cd ~
sudo apt-get install -y xsel libnss3-tools
composer global require cpriego/valet-linux

php -m
php -m | grep sqlite
php -v
cd ~
echo "Select PHP Version..."
update-alternatives --config php

valet install

# Isntall DB Beaver
sudo apt -y install default-jdk
java -version
curl -fsSL https://dbeaver.io/debs/dbeaver.gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/dbeaver.gpg
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install dbeaver-ce
apt policy dbeaver-ce

# sudo apt remove php8.1-* 