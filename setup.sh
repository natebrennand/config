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


cd ~/.vim/bundle/YouCompleteMe

git submodule update --init --recursive
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    sudo apt-get install -y CMake build-essential python-dev libclang-common-dev
    sudo add-apt-repository ppa:fcwu-tw/ppa
    sudo apt-get update
    sudo apt-get install vim
fi

./install.sh --clang-completer --system-libclang

vim +BundleInstall +qall


sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
