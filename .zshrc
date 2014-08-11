#Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

source ~/.zprezto/init.zsh
source ~/.git_aliases.sh

plugins=(git brew lol pip sublime zsh-syntax-highlighting vi-mode web-search)
ZSH_THEME="robbyrussell"

# upgraded vim
alias vim='/usr/local/Cellar/vim/7.4.052/bin/vim'
export EDITOR=vim
export VISUAL=$EDITOR

# Go path
GOPATH=~/go_projects
export GOPATH

# PATH Variable
PATH=/bin
PATH=/usr/sbin:$PATH
PATH=/sbin:/opt/X11/bin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/$HOME/bin:$PATH
PATH=~/.vim:$PATH
PATH=~/.vimbundles:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/heroku/bin:$PATH        # Added by the Heroku Toolbelt
PATH=~/github/config/scripts:$PATH
PATH=/usr/local/Cellar/go/1.2.1/bin:$PATH      # Add go
PATH=$GOPATH:$PATH      # Add go
PATH=$GOPATH/bin:$PATH      # Add go executables
PATH=~/scripts:$PATH      # Add random scripts
PATH=/usr/texbin:$PATH      # Add tex
export PATH

# Docker (will find the IP if it is running)
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

# aliases
source /Users/nate/.login_ssh.sh
source /Users/nate/.my_aliases.sh

# MOTD
cat /etc/motd

svim () {
    vim $(find . -name \*.$1 | peco)
}
