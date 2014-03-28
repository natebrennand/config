#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

plugins=(git brew lol pip sublime zsh-syntax-highlighting vi-mode web-search)
ZSH_THEME="robbyrussell"

# upgraded vim
alias vim='/usr/local/Cellar/vim/7.4.052/bin/vim'
export EDITOR=vim

# Go path
GOPATH=$GOPATH:~/go_projects
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
#PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
PATH=/usr/local/heroku/bin:$PATH        # Added by the Heroku Toolbelt
PATH=~/github/config/scripts:$PATH
PATH=/usr/local/share/npm/bin:$PATH     # Add npm stuff
PATH=/usr/local/opt/ruby/bin:$PATH      # Add gems
PATH=/usr/local/Cellar/go/bin:$PATH      # Add go
PATH=$GOPATH/bin:$PATH      # Add go
PATH=$GOPATH:$PATH      # Add go
# FDK_EXE="/Users/nate/bin/FDK/Tools/osx" # font builder path links
# export FDK_EXE
# PATH=${PATH}:"/Users/nate/bin/FDK/Tools/osx"
PATH=/usr/texbin:$PATH      # Add tex
export PATH

#installing psycopg2
#export DYLD_FALLBACK_LIBRARY_PATH=/Applications/Postgres.app/Contents/MacOS/lib:$DYLD_LIBRARY_PATH
#alias psql="(. ~/.bash_profile; unset DYLD_FALLBACK_LIBRARY_PATH; psql)";

source $ZSH/oh-my-zsh.sh

# aliases
source /Users/nate/.login_ssh.sh
source /Users/nate/.my_aliases.sh


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

# MOTD
cat /etc/motd
