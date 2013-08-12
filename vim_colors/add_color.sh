#!/bin/bash

if [[ -z $1 ]]
then
    echo "pass in a colorscheme you want to add"
    exit 1
else
    echo "adding $1"
fi

cp $1 /usr/share/vim/vim73/colors/$1

echo "added $1"

exit 0

