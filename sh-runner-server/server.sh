#!/bin/bash

AVAILABLES in /var/www/sh-installer/installers/*.installer.sh

LIST=$(IFS=, ; echo "${AVAILABLES[*]}")

HOSTNAME=$(eval "hostname -I")
HOSTDATA=($HOSTNAME)
HOST_IP=${HOSTDATA[0]}

echo "HOSTNAME: ${HOST_IP}"

case "$1" in
    "server_info")
        echo "{ 'status':'running', 'ip':'${HOST_IP}', 'availables':[${LIST}] }"
    ;;
    "server_status")
        echo "{ 'auth':'cookies' } "
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac