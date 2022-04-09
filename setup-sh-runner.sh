#!/bin/bash

################################################################
# Server setup for 'sh-runner'
# run this script with:
# $ curl https://raw.githubusercontent.com/carrara88/sh-runner/main/setup-sh-runner.sh -o setup-sh-runner.sh
# $ sudo chmod 755 setup-sh-runner.sh
################################################################


echo "################################################################"
echo "-> setup for sh-runner (extra-setup: Node.js + nginx)"


echo "################################################################"
echo "-> setup: nodejs"
if command -v node &> /dev/null
then
    echo "node is installed, skipping..."
else
    sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install nodejs -y
fi
    sudo bash -c "cat << EOF > /etc/systemd/system/node_sh_runner.service
[Unit]
Description=sh-runner nodejs service
After=network.target

[Service]
Environment=NODE_PORT=3001
Type=simple
User=admin
WorkingDirectory=/var/www/sh-runner/sh-runner-server/
ExecStart=/usr/bin/node index.js
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF"

    sudo systemctl daemon-reload
    sudo systemctl start node_sh_runner
    sudo systemctl enable node_sh_runner

echo "################################################################"
echo "-> setup: nginx"
if command -v nginx &> /dev/null 
then
    echo "nginx is installed, skipping..."
else
    sudo apt install nginx -y
fi

echo "################################################################"
echo "-> clone: sh-installer repo"
sudo rm -rf /var/www/sh-installer
if [[ "$1" -eq "dev" ]]; then  # force installation remove previous installer status file
    echo "-> clone dev branch"
    sudo git clone --branch dev https://github.com/carrara88/sh-installer.git /var/www/sh-installer
    sudo chmod 755 /var/www/sh-installer/installer.sh
else
    sudo git clone https://github.com/carrara88/sh-installer.git /var/www/sh-installer
    sudo chmod 755 /var/www/sh-installer/installer.sh
fi

echo "################################################################"
echo "-> clone: sh-runner repo"
sudo rm -rf /var/www/sh-runner
if [[ "$1" -eq "dev" ]]; then  # force installation remove previous installer status file
    echo "-> clone dev branch"
    sudo git clone --branch dev https://github.com/carrara88/sh-runner.git /var/www/sh-runner
else
    sudo git clone https://github.com/carrara88/sh-runner.git /var/www/sh-runner
    sudo chmod 755 /var/www/sh-runner/sh-runner-server/server.sh
fi

echo "################################################################"
echo "-> move:  /var/www/sh-runner/sh-runner-app/dist/. -> /var/www/html/runner/ "
sudo rm -rf /var/www/html/runner
sudo mkdir /var/www/html/runner
sudo cp -a /var/www/sh-runner/sh-runner-app/dist/. /var/www/html/runner/
echo "################################################################"
echo "-> Setup completed!"

