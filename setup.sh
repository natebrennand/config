#!/bin/sh

here=$(pwd)

git submodule update --init --recursive

ln -s $here/.vim ~/.vim
ln -s $here/.vim ~/.nvim
ln -s $here/.vimrc ~/.vimrc
ln -s $here/.nvimrc ~/.nvimrc
ln -s $here/.gitconfig ~/.gitconfig
ln -s $here/.global_gitignore ~/.global_gitignore
ln -s $here/.zshrc ~/.zshrc
ln -s $here/.zpreztorc ~/.zpreztorc

vim .nvimrc -c ':PluginInstall'
cd .vim/bundle/YouCompleteMe && ./install.sh --clang-completer


