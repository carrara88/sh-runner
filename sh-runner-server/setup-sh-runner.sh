#!/bin/bash

################################################################
# Server setup for 'sh-runner'
# run this script with:
# $ curl https://raw.githubusercontent.com/carrara88/sh-runner/main/sh-runner-server/setup-sh-runner.sh -o setup-sh-runner.sh
# $ ./setup-sh-runner.sh
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
echo "-> clone: sh-runner repo"
sudo rm -rf /var/www/sh-runner
if [[ "$1" -eq "dev" ]]; then  # force installation remove previous installer status file
    echo "-> clone dev branch"
    git clone --branch dev https://github.com/carrara88/sh-runner.git /var/www/sh-runner
else
    git clone https://github.com/carrara88/sh-runner.git /var/www/sh-runner
fi

echo "################################################################"
echo "-> move:  /var/www/sh-runner/sh-runner-app/. -> /var/www/html/runner/ "
sudo rm -rf /var/www/html/runner
sudo mkdir /var/www/html/runner
sudo cp -a /var/www/sh-runner/sh-runner-app/ /var/www/html/runner/
echo "################################################################"
echo "-> Setup completed!"

