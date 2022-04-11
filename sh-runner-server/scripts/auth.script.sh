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
    sudo history -d -2--1 # removing last bash history
}