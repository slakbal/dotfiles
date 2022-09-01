alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# alias l="ls -lF"
# alias la="ls -lFA"

# Shortcuts - pbcopy is for mac
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadcli="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Editors
alias zsh="sudo nano $HOME/.zshrc"
alias bsh="sudo nano $HOME/.bashrc"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Code"
alias siv="sites && cd akademie/"
alias sivnew="sites && cd akademie2020/"

# Laravel
alias a="php artisan"
alias r="php artisan route:pretty"
alias rcomp="php artisan route:list --compact"
alias rc="php artisan route:list --columns=method,uri,name,action"
alias fresh="php artisan migrate:fresh"
alias mf="php artisan migrate:fresh"
alias mfs="php artisan migrate:fresh --seed"
alias cu="composer update"
alias format="composer format"
alias pest="composer pest"
# alias t="./vendor/bin/phpunit"
alias p="./vendor/bin/pest --parallel"
alias tp="php artisan test --parallel"
alias t="php artisan test"
alias stan="./vendor/bin/phpstan analyse --memory-limit=2G"
alias xr="php vendor/chevere/xr/server.php"

# PHP
alias credo="composer clear-cache && rm -rf vendor/ composer.lock && composer i"
alias cfresh="composer clear-cache && rm -rf vendor/ composer.lock && composer i"
alias phpunit="vendor/bin/phpunit"
alias dusk="php artisan dusk"

# Misc
alias hostfile="sudo nano /etc/hosts"
alias sshconfig="nano ~/.ssh/config"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run watch"

# Git
alias commit="git add . && git commit -m"
alias save="git add . && git commit --allow-empty-message -m '' && git push"
alias amend="git commit --amend --no-edit"
alias amendall="git add . && amend"
alias wip="commit wip"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gremote="git config --get remote.origin.url"
alias resolve="git add . && git commit --no-edit"
alias gl="git log --oneline --decorate --color"
alias nuke="git clean -df && git reset --hard"
alias nah="git clean -df && git reset --hard"
alias pl="git pull origin"
alias gmsm="git checkout master && git pull origin && git merge stage"
alias gmds="git checkout stage && git pull origin && git merge dev"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Backblaze B2
alias b2="backblaze-b2"

# IP addresses
alias publicip="curl https://diagnostic.opendns.com/myip ; echo"
alias localip="ip addr show | grep -o 'inet \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet? (addr:)? ?/, \"\"); print }'"
