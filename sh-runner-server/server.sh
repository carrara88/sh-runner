#!/bin/bash

total=0
for n in /var/www/sh-installer/installers/*.installer.sh
do
    ti=`grep while ${n} | wc -l`
    ti=$(($ti + 0))
    if [[ $ti -gt 0 ]]
    then
        total=$(($total+$ti))
    fi
done

echo "Total:" $total

case "$1" in
    "server_info")
        echo "{ 'status':'running' }"
    ;;
    "server_status")
        echo "{ 'auth':'cookies' } "
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac