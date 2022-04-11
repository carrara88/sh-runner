#!/bin/bash

# SERVER VARIABLES

# INSTALLERS
SERVER_DIR="/var/www/sh-runner/sh-runner-server"
INSTALLER_DIR="/var/www/sh-installer/installers"
INSTALLERS_EXTENSION=".installer.sh"
AVAILABLE_INSTALLERS=( ${INSTALLER_DIR}/*${INSTALLERS_EXTENSION} )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]##*/}" )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]%${INSTALLERS_EXTENSION}}" )


source "${SERVER_DIR}/scripts/status.script.sh"
source "${SERVER_DIR}/scripts/auth.script.sh"




SERVER_INFO(){
cat << EOF | sudo tee -a /var/www/html/runner/sh-runner/server_info.json
{ "ip":"${HOST_IP}", "user":"$USER", "all_users":"${ALL_USERS}", "loggable_users":"${LOGGABLE_USERS}","installer_dir":"${INSTALLER_DIR}", "installers_extension":"${INSTALLERS_EXTENSION}", "installers":["${INSTALLERS_LIST}"] }
EOF
}

SERVER_STATUS(){
cat << EOF | sudo tee -a /var/www/html/runner/sh-runner/server_status.json
{ 
    "running_services":["${RUNNING_SERVICES_LIST}"], "exited_services":["${EXITED_SERVICES_LIST}"]
}
EOF
}

case "$1" in
    "server_info")
        SERVER_INFO
    ;;
    "server_status")
        SERVER_STATUS
    ;;
    "auth")
        AUTHENTICATE
    ;;
esac