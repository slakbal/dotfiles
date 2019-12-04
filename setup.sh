#!/bin/sh

echo "Setting up your environment..."

sudo -v

BREW="$HOME/linuxbrew/.linuxbrew/bin"

if [ ! -d "$BREW" ]; then

    #echo "Updating ${BREW}..."
    #brew update

    ## Remove Brew
    brew remove --force $(brew list) --ignore-dependencies
    brew cleanup
    brew cask --remove $(brew cask list)

#else

 #   echo "Installing brew in ${BREW}..."
 #   sudo apt-get install build-essential curl file git
 #   sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
 #   test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
 #   test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
 #   test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
 #   echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

fi


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
composer global require cpriego/valet-linux

# Create a Sites directory
#mkdir $HOME/Code
DIRECTORY="$HOME/Code"
if [ ! -d "$DIRECTORY" ]; then
    echo "Setup Code Folder in ${DIRECTORY}..."
    mkdir $HOME/Code
fi

#Setup Valet



DIRECTORY="$HOME/.oh-my-zsh"
if [ ! -d "$DIRECTORY" ]; then
    echo "Installing oh-my-zsh in ${DIRECTORY}..."
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    echo "Updating ${DIRECTORY}..."
    cd $DIRECTORY
    git pull origin master
fi


#install custome plugins
DIRECTORY="$HOME/.dotfiles/plugins/zsh-syntax-highlighting"
if [ ! -d "$DIRECTORY" ]; then
    echo "Installing zsh-syntax-highlighting files in ${DIRECTORY}..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.dotfiles/plugins/zsh-syntax-highlighting
else
    echo "Updating ${DIRECTORY}..."
    cd $DIRECTORY
    git pull origin master
fi

DIRECTORY="$HOME/.dotfiles/plugins/zsh-autosuggestions"
if [ ! -d "$DIRECTORY" ]; then
    echo "Installing zsh-autosuggestions files in ${DIRECTORY}..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/plugins/zsh-autosuggestions
else
    echo "Updating ${DIRECTORY}..."
    cd $DIRECTORY
    git pull origin master
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
echo "Removed old .zshrc link or file"

ln -s $HOME/.dotfiles/.zsh_custom $HOME/.zshrc
echo "Symlinked ~/.zskrc to ~/.dotfiles/.zsh_custom"

# Symlink the Mackup config file to the home directory
#ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg