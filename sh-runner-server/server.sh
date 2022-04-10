#!/bin/bash

for x in /var/www/sh-installer/installers/*.installer.sh
do
    echo -n "$x "
done

HOSTNAME=$(eval "hostname -I")
HOSTDATA=($HOSTNAME)
HOST_IP=$HOSTDATA[0]
echo "HOSTNAME: ${HOST_IP}"

case "$1" in
    "server_info")
        echo "{ 'status':'running', 'serv':'${HOST_IP}' }"
    ;;
    "server_status")
        echo "{ 'auth':'cookies' } "
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac