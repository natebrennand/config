#!/bin/sh
set -e

here=$(pwd)

old_dir="$(pwd)/old"
mkdir -p old

setup_dir () {
    local f
    f=$1
    echo "setting up dir: '$f'"
    # copy existing files then remove them from HOME
    cp -r "~/$f" "$old_dir/$f" || true
    rm -rf ~/$f
    ln -s $here/$f ~
}

setup () {
    local f
    f=$1
    echo "operating on file: '$f'"

    # copy existing files then remove them from HOME
    if [[ -a ~/$f ]]; then
        cp ~/$f $old_dir/$f
        rm ~/$f
    fi

    ln -s $here/$f ~/$f
}


git submodule update --init --recursive

setup_dir .vim
setup .vimrc
setup .gitconfig
setup .global_gitignore
setup .zshrc
setup .zpreztorc
setup .my_aliases.sh
setup .git_aliases.sh
setup .zpreztorc

vim +BundleInstall +qall
vim +GoInstallBinaries +qall

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

