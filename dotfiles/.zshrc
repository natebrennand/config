#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

plugins=(git brew lol pip sublime zsh-syntax-highlighting vi-mode web-search)
ZSH_THEME="robbyrussell"

export EDITOR=vim

PATH=/bin
PATH=/usr/sbin:$PATH
PATH=/sbin:/opt/X11/bin:$PATH
PATH=/usr/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=~/.vim:$PATH
PATH=~/.vimbundles:$PATH
PATH=/usr/local/sbin:$PATH
#PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
PATH=/usr/local/heroku/bin:$PATH        # Added by the Heroku Toolbelt
PATH=~/github/config/scripts:$PATH
PATH=/usr/local/share/npm/bin:$PATH    #add npm stuff

export PATH

#installing psycopg2
#export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH
#alias psql="(. ~/.bash_profile; unset DYLD_FALLBACK_LIBRARY_PATH; psql)";

source $ZSH/oh-my-zsh.sh

# aliases
alias zshconfig="vim ~/.zshrc"
alias mou='open /opt/homebrew-cask/Caskroom/mou/latest/Mou.app'
alias ll='ls -alF'
alias l='ls -1h'
alias less="/usr/share/vim/vim73/macros/less.sh"    # coloring while using less
alias mtr="sudo mtr"                # ping on steroids
alias json='python -mjson.tool'     # pipe a json to this for pretty print
alias server='python -m SimpleHTTPServer'
alias pipes='/usr/local/Cellar/bash/4.2.45/bin/bash /Users/nate/cloned/pipes/pipes.sh'  # screensaver

# git aliases
alias gtree='git log --oneline --graph --decorate --all'
alias gap="git add --patch"
alias glog='git log --stat --oneline'
alias glg='git lg'
alias gd='git diff --word-diff'


# RUBY ON RAILS
#export PATH=$PATH:/usr/bin/ruby
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
#eval "$(rbenv init -)"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#source $HOME/.rvm/scripts/rvm

# Python shell auto-completion
export PYTHONSTARTUP="$HOME/.pythonrc"

# Z
. ~/cloned/z/z.sh

