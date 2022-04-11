#!/bin/bash

# SERVER VARIABLES

# INSTALLERS
SERVER_DIR="/var/www/sh-runner/sh-runner-server"
INSTALLER_DIR="/var/www/sh-installer/installers"
INSTALLERS_EXTENSION=".installer.sh"
AVAILABLE_INSTALLERS=( ${INSTALLER_DIR}/*${INSTALLERS_EXTENSION} )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]##*/}" )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]%${INSTALLERS_EXTENSION}}" )

source "${SERVER_DIR}/scripts/parameters.script.sh"
LOAD_PARAMETERS $1 $2 $3 $4 $5 $6 $7 $8 $9
source "${SERVER_DIR}/scripts/status.script.sh"
source "${SERVER_DIR}/scripts/auth.script.sh"






case "$_REQUEST" in
    "server_info")
        # status.script.sh
        SERVER_INFO
    ;;
    "server_status")
        # status.script.sh
        SERVER_STATUS
    ;;
    "server_auth")
        # auth.script.sh
        AUTHENTICATE
    ;;
    "server_restart")
        _RESTART
    ;;
esac