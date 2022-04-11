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