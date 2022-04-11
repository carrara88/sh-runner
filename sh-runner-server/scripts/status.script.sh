#!/bin/bash


SERVER_INFO(){
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

cat << EOF | sudo tee /var/www/html/runner/sh-runner/server_info.json
{ 
    "ip":"${HOST_IP}", "user":"$USER", "all_users":"${ALL_USERS}", "loggable_users":"${LOGGABLE_USERS}","installer_dir":"${INSTALLER_DIR}", "installers_extension":"${INSTALLERS_EXTENSION}", "installers":["${INSTALLERS_LIST}"] 
}
EOF
}


SERVER_STATUS(){
AUTHENTICATE
if [ "$AUTHENTICATED" == "true" ] ; then
    # RUNNING SERVICES
    RUNNING_SERVICES=($(exec systemctl --type=service --plain | grep running | grep  -v '\\' | awk '{print $1}' | grep .service))
    printf -v RUNNING_SERVICES_LIST "\",\"%s" "${RUNNING_SERVICES[@]}"
    RUNNING_SERVICES_LIST=${RUNNING_SERVICES_LIST:3} 
    # EXITED SERVICES
    EXITED_SERVICES=($(exec systemctl --type=service --plain | grep exited | grep  -v '\\' | awk '{print $1}' | grep .service))
    printf -v EXITED_SERVICES_LIST "\",\"%s" "${EXITED_SERVICES[@]}"
    EXITED_SERVICES_LIST=${EXITED_SERVICES_LIST:3} 

    cat << EOF | sudo tee /var/www/html/runner/sh-runner/server_status.json
{ 
    "running_services":["${RUNNING_SERVICES_LIST}"], "exited_services":["${EXITED_SERVICES_LIST}"]
}
EOF
else
    echo "{ \"status\":false}"
fi
}