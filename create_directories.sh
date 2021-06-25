#!/bin/bash

declare -i group_counter=1001
declare -i user_counter=1001

function check_dir {
    DIR=$1
    if [ -d "$DIR" ]; then
        ### Take action if $DIR exists ###
        echo "Installing config files in ${DIR}..."
    else
        ###  Control will jump here if $DIR does NOT exists ###
        echo "Error: ${DIR} not found. Can not continue."
        exit 1
    fi
}


TFA_HOME=`cat parameters.json | jq '.operating_system.directories.tfa_home'|sed -e 's/^"//' -e 's/"$//'`
ORAIVENTORY=`cat parameters.json | jq '.operating_system.directories.oraInventory'|sed -e 's/^"//' -e 's/"$//'`
GRID_BASE=`cat parameters.json | jq '.operating_system.directories.grid_base'|sed -e 's/^"//' -e 's/"$//'`
ORACLE_BASE=`cat parameters.json | jq '.operating_system.directories.oracle_base'|sed -e 's/^"//' -e 's/"$//'`
GRID_HOME=`cat parameters.json | jq '.operating_system.directories.grid_home'|sed -e 's/^"//' -e 's/"$//'`
ORACLE_HOME=`cat parameters.json | jq '.operating_system.directories.goracle_homerid_home'|sed -e 's/^"//' -e 's/"$//'`

cat parameters.json \
    |jq '.operating_system.directories' \
    |sed -e 's/^"//' -e 's/"$//' \
    |awk -F ":" '{print $2}' \
    |sed -e 's/"//' -e 's/",//' \
    |awk 'NF' \
    |while read $1 
    do
        check_dir
    done