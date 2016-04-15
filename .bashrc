#!/usr/bin/env bash

# http://bashrcgenerator.com/
# time-short + ' ' + directory(basename) + ' >'
export PS1="\[\033[38;5;21m\]\A\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;202m\]\W\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;21m\]>\[$(tput sgr0)\]"

