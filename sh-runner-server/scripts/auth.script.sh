#!/bin/bash

AUTHENTICATED="false"
# AUTH
SIGNIN(){
    FILE='/etc/shadow'
    ORIGINAL_PASSWORD=$(sudo awk -F: -v pattern="^$_USERNAME" '$0 ~ pattern {print $2}' "$FILE" )
    IFS='$' read -a PWD_ARRAY <<< "$ORIGINAL_PASSWORD"
    ENTERED_PASSWORD=$(openssl passwd -${PWD_ARRAY[1]} -salt ${PWD_ARRAY[2]} $_PASSWORD)
    if [ $ENTERED_PASSWORD == $ORIGINAL_PASSWORD ] ; then
    echo "{ \"authentication\":true, \"user\":\"$_USERNAME\" }"
    AUTHENTICATED="true"
    else
    echo "{ \"authentication\":false, \"user\":\"$_USERNAME\" }"
    AUTHENTICATED="false"
    fi
    #history -d -10--1
}

AUTHENTICATE(){
    FILE='/etc/shadow'
    ORIGINAL_PASSWORD=$(sudo awk -F: -v pattern="^$_USERNAME" '$0 ~ pattern {print $2}' "$FILE" )
    IFS='$' read -a PWD_ARRAY <<< "$ORIGINAL_PASSWORD"
    ENTERED_PASSWORD=$(openssl passwd -${PWD_ARRAY[1]} -salt ${PWD_ARRAY[2]} $_PASSWORD)
    if [ $ENTERED_PASSWORD == $ORIGINAL_PASSWORD ] ; then
    AUTHENTICATED="true"
    else
    AUTHENTICATED="false"
    fi
}

_RESTART(){
    AUTHENTICATE
    if [ "$AUTHENTICATED" == "true" ] ; then
    sudo systemctl restart node_sh_runner.service
    echo "{ \"restart\":true}"
    else
    echo "{ \"error\":\"authentication\"}"
    fi
}