#!/bin/bash

# PARAMETERS
LOAD_PARAMETERS(){
    while [ $# -gt 0 ]; do
        case "$1" in
            --user|-u=*)
            _USERNAME="${1#*=}"
            ;;
            --password|-p=*)
            _PASSWORD="${1#*=}"
            ;;
            --request|-req=*)
            _REQUEST="${1#*=}"
            ;;
            *)
            # echo "Error: Invalid argument."
            exit 1
        esac
        shift
    done
}