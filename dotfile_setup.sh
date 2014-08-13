#!/bin/sh

# setting up prezto
cd
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

cd
git clone git@github.com:natebrennand/config.git
cd config

# hard link dotfiles
for filename in .*; do
	if [ -f $filename ]; then
		ln filename ~
	fi
done

# link vim directory
ln -s .vim ~

