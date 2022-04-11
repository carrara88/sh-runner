#!/bin/bash

# USERS
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