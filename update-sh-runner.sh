#!/bin/bash

# curl https://raw.githubusercontent.com/carrara88/sh-runner/dev/update-sh-runner.sh -o update-sh-runner.sh
# sudo chmod 755 update-sh-runner.sh

sudo rm -f /var/www/sh-runner/sh-runner-server/server.sh
sudo curl https://raw.githubusercontent.com/carrara88/sh-runner/dev/sh-runner-server/server.sh > /var/www/sh-runner/sh-runner-server/server.sh
chmod 755 /var/www/sh-runner/sh-runner-server/server.sh