#!/bin/bash

for x in /var/www/sh-installer/installers/*.installer.sh
do
    echo -n "$x "
done

HOSTNAME=hostname -I

echo "Total:" $total

case "$1" in
    "server_info")
        echo "{ 'status':'running', 'serv':'${HOSTNAME}' }"
    ;;
    "server_status")
        echo "{ 'auth':'cookies' } "
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac