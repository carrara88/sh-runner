#!/bin/bash

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

