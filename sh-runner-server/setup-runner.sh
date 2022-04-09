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
if which node > /dev/null
    then
        echo "node is installed, skipping..."
    else
        curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
        sudo apt-get install nodejs -y
    fi




echo "################################################################"
echo "-> setup: nginx"
sudo apt install nginx -y

echo "################################################################"
echo "-> setup: @angular/cli"
sudo npm install -g @angular/cli -y

echo "################################################################"
echo "-> clone: sh-runner"
sudo rm -rvf /var/sh-runner
git clone https://github.com/carrara88/sh-runner.git /var/www/sh-runner

echo "################################################################"
echo "-> build: sh-runner"
npm install
ng build /var/www/sh-runner/sh-runner-app

echo "################################################################"
echo "-> Setup completed!"

