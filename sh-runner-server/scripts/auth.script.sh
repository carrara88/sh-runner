#!/bin/bash

# AUTH
AUTHENTICATE(){
    FILE='/etc/shadow'
    ORIGINAL_PASSWORD=$(sudo awk -F: -v pattern="^$_USERNAME" '$0 ~ pattern {print $2}' "$FILE" )
    IFS='$' read -a PWD_ARRAY <<< "$ORIGINAL_PASSWORD"
    ENTERED_PASSWORD=$(openssl passwd -${PWD_ARRAY[1]} -salt ${PWD_ARRAY[2]} $_PASSWORD)
    if [ $ENTERED_PASSWORD == $ORIGINAL_PASSWORD ] ; then
    echo "{ \"auth\":true }"
    else
    echo "{ \"auth\":false }"
    fi
    #history -d -10--1
}

_RESTART(){
    sudo systemctl restart node_sh_runner.service
    echo "{ \"restart\":true }"
}