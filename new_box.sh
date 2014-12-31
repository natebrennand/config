#!/bin/bash

# NOTE: this is a rough untested draft, use with caution

echo "export VISUAL=vim" >> ~/.bashrc
echo "export EDITOR=\"VISUAL\"" >> ~/.bashrc


cp ./.gitignore ./.global_gitignore ./.gitconfig ..

apt-get -y update
apt-get install -y git build-essential python-dev make CMake


mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/valoric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

pushd ~/.vim/bundle/YouCompleteMe
./install.sh
popd


