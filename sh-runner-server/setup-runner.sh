#!/bin/bash

##
# Server setup for 'sh-runner'
# run this script with:
# $ curl https://raw.githubusercontent.com/carrara88/sh-runner/sh-runner-server/setup-runner.sh -o setup-runner.sh
# $ ./setup-runner.sh
######
echo "Setup (Node.js + nginx)"

echo "-> nodejs"
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "-> nginx"
sudo apt install nginx -y

echo "Setup completed!"

cd /var/www
git clone https://github.com/carrara88/sh-runner.git /var/www/html/runner


