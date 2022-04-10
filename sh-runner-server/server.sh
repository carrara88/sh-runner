#!/bin/bash


INSTALLER_DIR="/var/www/sh-installer/installers"
INSTALLERS_EXTENSION=".installer.sh"
AVAILABLE_INSTALLERS=( ${INSTALLER_DIR}/*${INSTALLERS_EXTENSION} )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]##*/}" )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]%${INSTALLERS_EXTENSION}}" )

printf -v INSTALLERS_LIST "\',\'%s" "${AVAILABLE_INSTALLERS[@]}"
INSTALLERS_LIST=${INSTALLERS_LIST:3} 

HOSTNAME=$(eval "hostname -I")
HOSTDATA=($HOSTNAME)
HOST_IP=${HOSTDATA[0]}


SERVER_INFO(){
    echo "{ 'ip':'${HOST_IP}', 'installer_dir':'${INSTALLER_DIR}', 'installers_extension':'${INSTALLERS_EXTENSION}', 'installers':['${INSTALLERS_LIST}'] }"
}

SERVER_STATUS(){
    echo "{ 'ip':'${HOST_IP}', 'installer_dir':'${INSTALLER_DIR}', 'installers_extension':'${INSTALLERS_EXTENSION}', 'installers':['${INSTALLERS_LIST}'] }"
}

case "$1" in
    "server_info")
        SERVER_INFO
    ;;
    "server_status")
        SERVER_STATUS
    ;;
    "server_auth")
        echo "{ 'auth':'cookies' } "
    ;;
esac