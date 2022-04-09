#!/bin/bash

################################################################
# Server setup for 'sh-runner'
# run this script with:
# $ curl https://raw.githubusercontent.com/carrara88/sh-runner/main/sh-runner-server/setup-runner.sh -o setup-runner.sh
# $ ./setup-runner.sh
################################################################
echo "################################################################"
echo "-> sh-runner (Node.js + npm + nginx + @angular/cli)"

echo "################################################################"
echo "echo -> setup: npm"
sudo apt-get install npm -y


echo "################################################################"
echo "-> setup: nodejs"
if command -v node &> /dev/null
then
    echo "node is installed, skipping..."
else
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install nodejs -y
fi




echo "################################################################"
echo "-> setup: nginx"
if command -v nginx &> /dev/null 
then
    echo "nginx is installed, skipping..."
else
    sudo apt install nginx -y
fi


echo "################################################################"
echo "-> setup: @angular/cli"
if command -v ng &> /dev/null
then
    echo "@angular/cli is installed, skipping..."
else
    sudo npm install -g @angular/cli -y
fi


echo "################################################################"
echo "-> clone: sh-runner"
sudo rm -rvf /var/www/sh-runner
git clone https://github.com/carrara88/sh-runner.git /var/www/sh-runner

echo "################################################################"
echo "-> build: sh-runner"
cd /var/www/sh-runner/sh-runner-app
npm install
ng build

echo "################################################################"
echo "-> Setup completed!"

