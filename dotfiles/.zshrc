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
PATH=/usr/local/share/python:$PATH
PATH=~/.vim:$PATH
PATH=~/.vimbundles:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
### Added by the Heroku Toolbelt
PATH=/usr/local/heroku/bin:$PATH
PATH=~/github/config/scripts:$PATH

export PATH

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias mou='open /Applications/Mou.app'
alias gtree='git log --oneline --graph --decorate --all'
alias ll='ls -alF'
alias l='ls -1h'
alias less="/usr/share/vim/vim73/macros/less.sh"
alias mtr="sudo mtr"
alias gap="git add --patch"
alias glog='git log --stat --oneline'
alias nodemon='/usr/local/share/npm/lib/node_modules/nodemon/nodemon.js'
alias glg='git lg'


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/

# RUBY ON RAILS
#export PATH=$PATH:/usr/bin/ruby
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
#eval "$(rbenv init -)"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#source $HOME/.rvm/scripts/rvm

# Python shell auto-completion
export PYTHONSTARTUP="$HOME/.pythonrc"

# Z
. ~/dvlpmnt/Z/z.sh

