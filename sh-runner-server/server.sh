#!/bin/bash

# SERVER VARIABLES

# INSTALLERS
INSTALLER_DIR="/var/www/sh-installer/installers"
INSTALLERS_EXTENSION=".installer.sh"
AVAILABLE_INSTALLERS=( ${INSTALLER_DIR}/*${INSTALLERS_EXTENSION} )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]##*/}" )
AVAILABLE_INSTALLERS=( "${AVAILABLE_INSTALLERS[@]%${INSTALLERS_EXTENSION}}" )


source "./scripts/auth.script.sh"


# USERS
ALL_USERS=($(eval cut -d: -f1 /etc/passwd))
LOGGABLE_USERS=($(eval getent passwd {$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)} | cut -d: -f1 ))
# INSTALLERS
printf -v INSTALLERS_LIST "\",\"%s" "${AVAILABLE_INSTALLERS[@]}"
INSTALLERS_LIST=${INSTALLERS_LIST:3} 
# IP
HOSTNAME=$(eval "hostname -I")
HOSTDATA=($HOSTNAME)
HOST_IP=${HOSTDATA[0]}
# RUNNING SERVICES
RUNNING_SERVICES=($(exec systemctl --type=service --plain | grep running | grep  -v '\\' | awk '{print $1}' | grep .service))
printf -v RUNNING_SERVICES_LIST "\",\"%s" "${RUNNING_SERVICES[@]}"
RUNNING_SERVICES_LIST=${RUNNING_SERVICES_LIST:3} 
# EXITED SERVICES
EXITED_SERVICES=($(exec systemctl --type=service --plain | grep exited | grep  -v '\\' | awk '{print $1}' | grep .service))
printf -v EXITED_SERVICES_LIST "\",\"%s" "${EXITED_SERVICES[@]}"
EXITED_SERVICES_LIST=${EXITED_SERVICES_LIST:3} 

correct=$( < sudo egrep -v - /etc/shadow | awk -v user=admin -F : 'user == $1 {print $2}')
prefix=${correct%"${correct#\$*\$*\$}"}

echo "DDC: ${correct}"

AUTHENTICATE(){
    FILE='/etc/shadow'
    read -p 'Enter user name: ' USER_NAME
    read -sp 'Enter password: ' USER_PASSWORD
    echo ""
    ORIGINAL_PASSWORD=$(sudo awk -F: -v pattern="^$USER_NAME" '$0 ~ pattern {print $2}' "$FILE" )
    IFS='$' read -a PWD_ARRAY <<< "$ORIGINAL_PASSWORD"
    ENTERED_PASSWORD=$(openssl passwd -${PWD_ARRAY[1]} -salt ${PWD_ARRAY[2]} $USER_PASSWORD)
    if [ $ENTERED_PASSWORD == $ORIGINAL_PASSWORD ] ; then
    echo "Authenticated"
    else
    echo "Not Authenticated"
    fi
}

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