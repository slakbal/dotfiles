#!/bin/sh

echo "Setting up your environment..."

sudo -v

## Update Repos
#sudo apt -y update

## Install Basic Stuff
#sudo apt -y install curl git unzip

##Install php
#sudo apt install software-properties-common
#sudo add-apt-repository ppa:ondrej/PHP
#sudo apt -y install php7.3-fpm
#sudo apt -y install php-cli php-mbstring 
#sudo apt -y install php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl
echo "************ PHP installed *************"
#php -v

##Install composer
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

## Check for Homebrew and install if we don't have it
#if test ! $(which brew); then
#  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
#fi

## Update Homebrew recipes
#brew update

## Install all our dependencies with bundle (See Brewfile)
# brew tap homebrew/bundle
#brew bundle

## Install PHP extensions with PECL
#pecl install memcached imagick

## Install global Composer packages
#/usr/local/bin/composer global require laravel/installer laravel/spark-installer laravel/valet

## Install Laravel Valet
#$HOME/.composer/vendor/bin/valet install
#composer global require cpriego/valet-linux

# Create a Sites directory
#mkdir $HOME/Code
DIRECTORY="$HOME/Code"
if [ ! -d "$DIRECTORY" ]; then
    echo "Setup Code Folder in ${DIRECTORY}..."
    mkdir $HOME/Code
fi

#Setup Valet



#DIRECTORY="$HOME/.oh-my-zsh"
#if [ ! -d "$DIRECTORY" ]; then
#    echo "Installing oh-my-zsh in ${DIRECTORY}..."
#    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#else
#    echo "Updating ${DIRECTORY}..."
#    cd $DIRECTORY
#    git pull origin master
#fi


#install custome plugins
#DIRECTORY="$HOME/.dotfiles/plugins/zsh-syntax-highlighting"
#if [ ! -d "$DIRECTORY" ]; then
#    echo "Installing zsh-syntax-highlighting files in ${DIRECTORY}..."
#    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/plugins/zsh-syntax-highlighting
#else
#    echo "Updating ${DIRECTORY}..."
#    cd $DIRECTORY
#    git pull origin master
#fi

#DIRECTORY="$HOME/.dotfiles/plugins/zsh-autosuggestions"
#if [ ! -d "$DIRECTORY" ]; then
#    echo "Installing zsh-autosuggestions files in ${DIRECTORY}..."
#    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/plugins/zsh-autosuggestions
#else
#    echo "Updating ${DIRECTORY}..."
#    cd $DIRECTORY
#    git pull origin master
#fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
#rm -rf $HOME/.zshrc
#echo "Removed old .zshrc link or file"

#ln -s $HOME/.dotfiles/.zsh_custom $HOME/.zshrc
#echo "Symlinked ~/.zskrc to ~/.dotfiles/.zsh_custom"

# Symlink the Mackup config file to the home directory
#ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg