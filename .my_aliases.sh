alias code='cd ${CODE_HOME}'

# vim
alias vi='vim'
alias vim='vim -O'

# aliases
alias zshconfig="vim ~/.zshrc"
alias l='ls -1h'
alias ll='ls -alF'
alias less="/usr/share/vim/vim73/macros/less.sh" # coloring while using less
alias server='python -m SimpleHTTPServer'
alias latex='/usr/texbin/pdflatex'
alias nosetests='nosetests -v'

# git aliases
alias gtree='git log --oneline --graph --decorate --all'
alias gap="git add --patch"
alias glog='git log --stat --oneline'
alias glg='git lg'
alias gd='git diff --word-diff'
alias gl='git pull --rebase'
alias grc='git rebase --continue'
alias gdf='git diff --color | diff-highlight | diff-so-fancy'

# motd aliases
alias etodo='sudo vim /etc/motd'

# tarring
alias untar='tar -zxvf'

# choo choo
alias sl='\sl'

alias ghpr='hub pull-request'
