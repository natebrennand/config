#!/bin/bash

mkdir ~/dotfile_backup

mv  ~/.gitignore \
    ~/.gitconfig \
    ~/.pythonrc \
    ~/.vimrc \
    ~/.zshrc \
        ~/dotfile_backup

ln .gitignore   ~/.gitignore
ln .gitconfig   ~/.gitconfig
ln .pythonrc    ~/.pythonrc
ln .vimrc       ~/.vimrc
ln .zshrc       ~/.zshrc

echo "Your old dotfiles are saved in ~/dotfile_backup"

