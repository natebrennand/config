#!/bin/bash

save_dir=".dotfile_backup"
mkdir -p "$HOME/$save_dir"

#######################
# .vim stuff
#######################

dir=`pwd`

for d in ".vim" ".vim/colors" ".vim/after/ftplugins"
do
    mkdir -p $HOME/$d
    mkdir -p $HOME/$save_dir/$d
done

for d in "after/ftplugins" "colors"
do
    directory=".vim/$d/*"
    for f in $directory
    do
        mv "$HOME/$f" "$HOME/$save_dir/$f"
        ln -s "$dir/.vim/$f" "$HOME/$f"
    done
done

#######################
# dot files stuff
#######################

cd 'dotfiles'

regex=".[a-z]"
dir=`pwd`

for f in .*
do
    if [[ "$f" =~ $regex ]]
    then
        mv "$HOME/$f" "$HOME/$save_dir/$f"
        ln -s "$dir/$f" "$HOME/$f"
    fi
done

exit 0

