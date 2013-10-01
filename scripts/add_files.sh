#!/bin/bash

for dir in ".vim" "scripts" "itermcolors"
do
    git add -f $dir
done

exit 0

