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
ln -s $here/.my_aliases.sh ~/.my_aliases.sh
ln -s $here/.git_aliases.sh ~/.git_aliases.sh

vim +BundleInstall +qall


git submodule update --init --recursive
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    sudo apt-get update -y
    sudo apt-get install -y CMake build-essential python-dev libclang-dev
fi

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer --system-libclang

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

