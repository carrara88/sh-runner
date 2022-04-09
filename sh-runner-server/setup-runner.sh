#!/bin/bash

################################################################
# Server setup for 'sh-runner'
# run this script with:
# $ curl https://raw.githubusercontent.com/carrara88/sh-runner/main/sh-runner-server/setup-runner.sh -o setup-runner.sh
# $ ./setup-runner.sh
################################################################
echo "################################################################-> sh-runner (Node.js + npm + nginx + @angular/cli)"

echo "################################################################-> setup: nodejs"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install nodejs -y

echo "################################################################-> setup: npm"
sudo apt-get install npm -y

echo "################################################################-> setup: nginx"
sudo apt install nginx -y

echo "################################################################-> setup: @angular/cli"
npm install -g @angular/cli -y

echo "################################################################-> clone: sh-runner"
sudo rm -rvf /var/sh-runner
git clone https://github.com/carrara88/sh-runner.git /var/sh-runner

echo "################################################################-> build: sh-runner"
ng build /var/sh-runner/sh-runner-app

echo "################################################################-> Setup completed!"

