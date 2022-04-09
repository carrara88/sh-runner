#!/bin/bash

################################################################
# Server buildsetup for 'sh-runner'
# load this script with:
# 
# curl https://raw.githubusercontent.com/carrara88/sh-runner/main/sh-runner-server/buildsetup-runner.sh -o buildsetup-sh-runner.sh
# ./buildsetup-sh-runner.sh
################################################################

echo "################################################################"
echo "-> buildsetup for sh-runner (extra-setup: npm + @angular/cli)"

echo "################################################################"
echo "-> setup: npm"
sudo apt-get install npm -y

echo "################################################################"
echo "-> setup: @angular/cli"
if command -v ng &> /dev/null
then
    echo "@angular/cli is installed, skipping..."
else
    sudo npm install -g @angular/cli -y
fi

echo "################################################################"
echo "-> npm install
npm install

echo "################################################################"
echo "-> ng build
ng build