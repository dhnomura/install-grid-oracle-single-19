#!/bin/bash

function check_dir {
    DIR=$VAL
    if [ -d "$DIR" ]; then
        ### Take action if $DIR exists ###
        chown $RDBMS_GROUP:$PRODUCT_GROUP $DIR
        chmod 775 $DIR 
    else
        ###  Control will jump here if $DIR does NOT exists ###
        mkdir -p $DIR
        chown $RDBMS_GROUP:$PRODUCT_GROUP $DIR 
        chmod 775 $DIR
    fi
}


TFA_HOME=`cat parameters.json | jq '.operating_system.directories.tfa_home'|sed -e 's/^"//' -e 's/"$//'`
ORAIVENTORY=`cat parameters.json | jq '.operating_system.directories.oraInventory'|sed -e 's/^"//' -e 's/"$//'`
GRID_BASE=`cat parameters.json | jq '.operating_system.directories.grid_base'|sed -e 's/^"//' -e 's/"$//'`
ORACLE_BASE=`cat parameters.json | jq '.operating_system.directories.oracle_base'|sed -e 's/^"//' -e 's/"$//'`
GRID_HOME=`cat parameters.json | jq '.operating_system.directories.grid_home'|sed -e 's/^"//' -e 's/"$//'`
ORACLE_HOME=`cat parameters.json | jq '.operating_system.directories.goracle_homerid_home'|sed -e 's/^"//' -e 's/"$//'`
PRODUCT_GROUP=`cat parameters.json | jq '.operating_system.os_groups.product_group'|sed -e 's/^"//' -e 's/"$//'`
RDBMS_GROUP=`cat parameters.json | jq '.operating_system.os_groups.rdbms_group'|sed -e 's/^"//' -e 's/"$//'`
GRID_GROUP=`cat parameters.json | jq '.operating_system.os_groups.grid_group'|sed -e 's/^"//' -e 's/"$//'`
GRID_OWNER=`cat parameters.json | jq '.operating_system.os_users.grid_owner'|sed -e 's/^"//' -e 's/"$//'`
RDBMS_OWNER=`cat parameters.json | jq '.operating_system.os_users.database_owner'|sed -e 's/^"//' -e 's/"$//'`

cat parameters.json \
    |jq '.operating_system.directories' \
    |sed -e 's/^"//' -e 's/"$//' \
    |awk -F ":" '{print $2}' \
    |sed -e 's/"//' -e 's/",//' \
    |awk 'NF' \
    |while read VAL 
    do
        check_dir
    done