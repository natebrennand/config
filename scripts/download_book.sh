#!/bin/bash

if (( "$#" != 1 ))
    then
        echo 'Pass in the URL to the site you would like to download.'
        exit
fi

wget_args=("--recursive" "--page-requisites"
            "--html-extension" "--convert-links"
            "--no-clobber" "--no-parent")
wget "${wget_args[@]}" $1

