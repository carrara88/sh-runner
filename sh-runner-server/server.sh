#!/bin/bash

for x in /var/www/sh-installer/installers/*.installer.sh
do
    echo -n "$x "
done

HOSTNAME=$(eval "hostname -I" | tr " " "\n")

echo "HOSTNAME:" $HOSTNAME[0]

case "$1" in
    "server_info")
        echo "{ 'status':'running', 'serv':'${HOSTNAME[0]}' }"
    ;;
    "server_status")
        echo "{ 'auth':'cookies' } "
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac