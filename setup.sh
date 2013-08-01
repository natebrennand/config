#!/bin/bash

mkdir ~/dotfile_backup

mv  ~/.gitignore \
    ~/.gitconfig \
    ~/.pythonrc \
    ~/.vimrc \
    ~/.vim \
    ~/.zshrc \
        ~/dotfile_backup

ln -s dotfiles/.*   ~
ln -s .vim ~

echo "Your old dotfiles are saved in ~/dotfile_backup"

