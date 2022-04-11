#!/bin/bash

# curl https://raw.githubusercontent.com/carrara88/sh-runner/dev/update-sh-runner.sh -o update-sh-runner.sh
# sudo chmod 755 update-sh-runner.sh

sudo systemctl stop node_sh_runner
sudo systemctl start node_sh_runner
sudo rm -vf /var/www/sh-runner/sh-runner-server/server.sh
sudo touch -v /var/www/sh-runner/sh-runner-server/server.sh
sudo bash -c "curl https://raw.githubusercontent.com/carrara88/sh-runner/dev/sh-runner-server/server.sh > /var/www/sh-runner/sh-runner-server/server.sh"
sudo chmod 755 /var/www/sh-runner/sh-runner-server/server.sh