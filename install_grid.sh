#!/bin/bash

GRID_HOME=`cat parameters.json | jq '.operating_system.directories.grid_home'|sed -e 's/^"//' -e 's/"$//'`
LOCAL_BIN_GRID=`cat parameters.json | jq '.bin_files.local_bin_grid'|sed -e 's/^"//' -e 's/"$//'`
GRID_OWNER=`cat parameters.json | jq '.operating_system.os_users.grid_owner'|sed -e 's/^"//' -e 's/"$//'`
PRODUCT_GROUP=`cat parameters.json | jq '.operating_system.os_groups.product_group'|sed -e 's/^"//' -e 's/"$//'`

chown $GRID_OWNER:$PRODUCT_GROUP $LOCAL_BIN_GRID
sudo -u $GRID_OWNER unzip $LOCAL_BIN_GRID -d $GRID_HOME