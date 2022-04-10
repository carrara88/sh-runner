#!/bin/bash


INSTALLER_DIR="/var/www/sh-installer/installers"
INSTALLERS_EXTENSION=".installer.sh"
AVAILABLE_INSTALLERS=( ${INSTALLER_DIR}/*${INSTALLERS_EXTENSION} )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]##*/}" )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]%${INSTALLERS_EXTENSION}}" )

printf -v LIST "\',\'%s" "${AVAILABLES[@]}"
LIST=${LIST:3} 

HOSTNAME=$(eval "hostname -I")
HOSTDATA=($HOSTNAME)
HOST_IP=${HOSTDATA[0]}

echo "HOSTNAME: ${HOST_IP}"

case "$1" in
    "server_info")
        echo "{ 'ip':'${HOST_IP}', 'installer_dir':'${INSTALLER_DIR}', 'installers_extension':'${INSTALLERS_EXTENSION}', 'installers':['${LIST}'] }"
    ;;
    "server_status")
        echo "{ 'auth':'cookies' } "
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac