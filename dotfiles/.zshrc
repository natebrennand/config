#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

plugins=(git brew lol pip sublime zsh-syntax-highlighting vi-mode web-search)
ZSH_THEME="robbyrussell"

export EDITOR=vim
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/usr/local/share/python
export PATH=$PATH:~/.vim/
export PATH=$PATH:~/.vimbundles/

source $ZSH/oh-my-zsh.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# Example aliases
alias zshconfig="vim ~/.zshrc"
alias mou='open /Applications/Mou.app'
alias clic='ssh nsb2142@clic-lab.cs.columbia.edu'
alias cunix='ssh nsb2142@cunix.cc.columbia.edu'
alias gtree='git log --oneline --graph --decorate --all'
alias ll='ls -alF'
alias l='ls -1h'
alias less="/usr/share/vim/vim73/macros/less.sh"


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


