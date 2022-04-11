#!/bin/bash

# SERVER VARIABLES
INSTALLER_DIR="/var/www/sh-installer/installers"
INSTALLERS_EXTENSION=".installer.sh"
AVAILABLE_INSTALLERS=( ${INSTALLER_DIR}/*${INSTALLERS_EXTENSION} )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]##*/}" )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]%${INSTALLERS_EXTENSION}}" )

printf -v INSTALLERS_LIST "\",\"%s" "${AVAILABLE_INSTALLERS[@]}"
INSTALLERS_LIST=${INSTALLERS_LIST:3} 

HOSTNAME=$(eval "hostname -I")
HOSTDATA=($HOSTNAME)
HOST_IP=${HOSTDATA[0]}

RUNNING_SERVICES=($(exec systemctl --type=service --plain | grep running | awk '{print $1}' | grep .service))
printf -v RUNNING_SERVICES_LIST "\",\"%s" "${RUNNING_SERVICES[@]}"
RUNNING_SERVICES_LIST=${RUNNING_SERVICES_LIST:3} 
echo "${al}"
SERVER_INFO(){
sudo rm /var/www/html/runner/sh-runner/server_info.json
sudo touch /var/www/html/runner/sh-runner/server_info.json
cat << EOF | sudo tee -a /var/www/html/runner/sh-runner/server_info.json
{ "ip":"${HOST_IP}", "installer_dir":"${INSTALLER_DIR}", "installers_extension":"${INSTALLERS_EXTENSION}", "installers":["${INSTALLERS_LIST}"], "running_services":["${RUNNING_SERVICES_LIST}"] }
EOF
}

SERVER_STATUS(){
sudo rm /var/www/html/runner/sh-runner/server_status.json
sudo touch /var/www/html/runner/sh-runner/server_status.json
cat << EOF | sudo tee -a /var/www/html/runner/sh-runner/server_status.json
{ "ip":"${HOST_IP}", "installer_dir":"${INSTALLER_DIR}", "installers_extension":"${INSTALLERS_EXTENSION}", "installers":["${INSTALLERS_LIST}"], "running_services":["${RUNNING_SERVICES_LIST}"] }
EOF
}

case "$1" in
    "server_info")
        SERVER_INFO
    ;;
    "server_status")
        SERVER_STATUS
    ;;
esac