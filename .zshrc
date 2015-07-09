#Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

source ~/.zprezto/init.zsh

# aliases
source ~/.my_aliases.sh
source ~/.git_aliases.sh

# oh-my-zsh
plugins=(git brew lol pip sublime zsh-syntax-highlighting vi-mode)
ZSH_THEME="robbyrussell"

# (neo)vim
if hash nvim 2>/dev/null;
then
    export EDITOR=nvim
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR

# Go path
GOPATH=~/go
export GOPATH

# PATH Variable
PATH=/bin
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:~/.vim
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/heroku/bin         # Added by the Heroku Toolbelt
PATH=$PATH:$GOPATH                       # Add go
PATH=$GOPATH/bin:$PATH                   # Add go executables
PATH=/usr/texbin:$PATH                   # Add tex
export PATH

# Docker (will find the IP if it is running)
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

# MOTD
# cat /etc/motd

# Takes a filetype suffix as an argument and finds all instances in the underlying filetree
#   great for deep filetrees with few files (java/scala)
svim () {
    res=$(find .  -name \*.$1 -not -path "*Godeps*" | peco)
    if [[ -n $res ]]; then
        # open w/ neovim if it's installed
        if hash nvim 2>/dev/null; then
            echo "$res" | xargs nvim -O
        else
            echo "$res" | xargs vim -O
        fi
    fi
}

start_redis() {
    redis-server /usr/local/etc/redis.conf &
}

stop_redis() {
    kill $(cat /usr/local/var/run/redis.pid)
}

# fucking scala.....
export BT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"

# OPAM configuration
. /Users/natebrennand/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# sublime
alias subl='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'



# work stuff
source ~/.bash_profile
