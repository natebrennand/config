#!/bin/bash

if (( "$#" != 1 ))
    then
        echo 'Pass in the URL to the site you would like to download.'
        exit
fi

wget_args=( "--page-requisites"
            "--html-extension" "--convert-links"
            "--no-clobber" )
wget "${wget_args[@]}" $1

