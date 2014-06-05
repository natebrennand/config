#!/bin/bash

apt-get -y update

# mongo
apt-get -y install mongodb
mkdir -p /data/db/

# python
apt-get -y install python
apt-get -y install python-pip
pip install virtualenv

# node
apt-get -y update
apt-get -y install python-software-properties python g++ make
add-apt-repository ppa:chris-lea/node.js
apt-get -y update
apt-get -y install nodejs

# grunt
npm install -g grunt grunt-cli

# ruby / sass
# don't use it

# nginx
apt-get -y install nginx


exit 0

NGINX:



