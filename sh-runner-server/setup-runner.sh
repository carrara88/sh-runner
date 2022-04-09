#!/bin/bash

################################################################
# Server setup for 'sh-runner'
# run this script with:
# $ curl https://raw.githubusercontent.com/carrara88/sh-runner/main/sh-runner-server/setup-runner.sh -o setup-runner.sh
# $ ./setup-runner.sh
################################################################


echo "################################################################"
echo "-> setup for sh-runner (extra-setup: Node.js + nginx)"


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
echo "-> clone: sh-runner"
sudo rm -rf /var/www/sh-runner
git clone https://github.com/carrara88/sh-runner.git /var/www/sh-runner

echo "################################################################"
echo "-> build: sh-runner"
cd /var/www/sh-runner/sh-runner-app

echo "################################################################"
echo "-> Setup completed!"

