#!/bin/sh

echo "Setting up your environment..."

sudo -v

## Update Repos
#sudo apt -y update

## Install Basic Stuff
#sudo apt -y install curl git unzip

####################
## PHP
####################

##Install php
#sudo apt install software-properties-common
#sudo add-apt-repository ppa:ondrej/PHP
#sudo apt -y install php7.3-fpm
#sudo apt -y install php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl php7.3-gd php7.3-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-opcache php7.3-soap php7.3-zip php7.3-intl

####################
## COMPOSER
####################

##Install composer
#cd ~
#curl -sS https://getcomposer.org/installer -o composer-setup.php
#sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

####################
## NGINX
####################

##Install Nginx
#sudo apt -y install nginx

####################
## REDIS
####################

##Install Redis
#sudo apt -y install redis-server

## Config TODO
# sudo nano /etc/redis/redis.conf

# If you run Redis from upstart or systemd, Redis can interact with your
# supervision tree. Options:
#   supervised no      - no supervision interaction
#   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
#   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
#   supervised auto    - detect upstart or systemd method based on
#                        UPSTART_JOB or NOTIFY_SOCKET environment variables
# Note: these supervision methods only signal "process is ready."
#       They do not enable continuous liveness pings back to your supervisor.
# supervised systemd

# sudo systemctl restart redis.service
# sudo systemctl status redis

####################
## COMPOSER
####################

## Install global Composer packages
#sudo apt -y install network-manager libnss3-tools jq xsel
#composer global require laravel/installer cpriego/valet-linux
#echo "export PATH=$PATH:$HOME/.config/composer/vendor/bin" >> ~/.bashrc
#source ~/.bashrc

# Create a Sites directory
#DIRECTORY="$HOME/Code"
#if [ ! -d "$DIRECTORY" ]; then
#    echo "Setup Code Folder in ${DIRECTORY}..."
#    mkdir $DIRECTORY
#fi

#Setup Valet
#cd ~/Code
#valet install
#valet domain app
#cd ~

####################
## ZSH
####################

DIRECTORY="$HOME/.oh-my-zsh"
if [ ! -d "$DIRECTORY" ]; then
    echo "Installing oh-my-zsh in ${DIRECTORY}..."
    sudo apt -y install zsh
    sudo apt -y install powerline fonts-powerline
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    ## Set Zsh as default bash
    sudo chsh -s /bin/zsh

    ## Revert back to default bash
    #sudo chsh -s /bin/bash
else
    echo "Updating ${DIRECTORY}..."
    cd $DIRECTORY
    git pull origin master
    # upgrade_oh_my_zsh
fi

#install custome plugins
DIRECTORY="$HOME/.dotfiles/plugins/zsh-syntax-highlighting"
if [ ! -d "$DIRECTORY" ]; then
    echo "Installing zsh-syntax-highlighting files in ${DIRECTORY}..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/plugins/zsh-syntax-highlighting --depth 1
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
else
    echo "Updating ${DIRECTORY}..."
    cd $DIRECTORY
    git pull origin master
fi

DIRECTORY="$HOME/.dotfiles/plugins/zsh-autosuggestions"
if [ ! -d "$DIRECTORY" ]; then
    echo "Installing zsh-autosuggestions files in ${DIRECTORY}..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/plugins/zsh-autosuggestions --depth 1
    echo "source $HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$HOME/.zshrc"
else
    echo "Updating ${DIRECTORY}..."
    cd $DIRECTORY
    git pull origin master
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
#rm -rf $HOME/.zshrc
#echo "Removed old .zshrc link or file"

#ln -s $HOME/.dotfiles/.zsh_custom $HOME/.zshrc
#echo "Symlinked ~/.zskrc to ~/.dotfiles/.zsh_custom"

# Symlink the Mackup config file to the home directory
#ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg


####################
## MYSQL
####################

#sudo apt -y install mysql-server