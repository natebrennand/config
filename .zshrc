#Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"


# aliases
source ~/.my_aliases.sh
source ~/.git_aliases.sh

# oh-my-zsh
plugins=(brew lol pip sublime zsh-syntax-highlighting vi-mode)
ZSH_THEME="robbyrussell"

# (neo)vim
if hash nvim 2>/dev/null;
then
    export EDITOR=nvim
    export GT_EDITOR=nvim
else
    export EDITOR=vim
fi
export VISUAL=$EDITOR

export GO15VENDOREXPERIMENT=1

# Go path
GOPATH=~/go
export GOPATH

# PATH Variable
PATH=/bin:$PATH
PATH=/sbin:$PATH
PATH=/usr/sbin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$PATH:~/.vim
PATH=$PATH:/usr/local/sbin
PATH=$PATH:$GOPATH                       # Add go
PATH=$GOPATH/bin:$PATH                   # Add go executables
PATH=$HOME/.cargo/bin:$PATH # add cargo for rust
PATH=/opt/homebrew/bin:$PATH
PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export PATH

bindkey -v
bindkey '^R' history-incremental-search-backward

# Docker (will find the IP if it is running)
# export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375

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
# source ~/.bash_profile
# source ~/.bashrc
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

HISTSIZE=5000           # How many lines of history to keep in memory
HISTFILE=~/.zsh_history # Where to save history to disk
SAVEHIST=5000           # Number of history entries to save to disk
HISTDUP=erase           # Erase duplicates in the history file
setopt appendhistory    # Append history to the history file (no overwriting)
setopt sharehistory     # Share history across terminals
setopt incappendhistory # Immediately append to the history file, not just when a term is killed

# fzf via Homeerew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

_has() {
  type "$1" &> /dev/null
}

# fzf + ag configuration

if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

function s3copytodev () {
    prodpath=$1

    bucket=$(echo $prodpath | cut -d/ -f 3)
    key=${prodpath#"s3://$bucket/"}

    if [[ $bucket =~ '^.*\-dev$' ]]
    then
        echo "cannot copy from *-dev bucket"
        return
    fi

    newpath="s3://$bucket-dev/$key"
    aws s3 cp --sse AES256 $prodpath $newpath >/dev/null

    echo $newpath
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.metronome_secrets
source ~/.metronomerc

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# jenv

export CONFLUENT_HOME="$HOME/.metronome/confluent-platform"
export PATH="$PATH:$CONFLUENT_HOME/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
