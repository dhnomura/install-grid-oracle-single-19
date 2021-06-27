#!/bin/bash

export GRID_HOME=`cat parameters.json | jq '.operating_system.directories.grid_home'|sed -e 's/^"//' -e 's/"$//'`
export LOCAL_BIN_GRID=`cat parameters.json | jq '.bin_files.local_bin_grid'|sed -e 's/^"//' -e 's/"$//'`
export GRID_OWNER=`cat parameters.json | jq '.operating_system.os_users.grid_owner'|sed -e 's/^"//' -e 's/"$//'`
export PRODUCT_GROUP=`cat parameters.json | jq '.operating_system.os_groups.product_group'|sed -e 's/^"//' -e 's/"$//'`

chown $GRID_OWNER:$PRODUCT_GROUP $LOCAL_BIN_GRID
sudo -u $GRID_OWNER unzip $LOCAL_BIN_GRID -d $GRID_HOME
sudo -u $GRID_OWNER $GRID_HOME/gridSetup.sh -silent -responseFile /tmp/setupgrid.rsp -ignorePrereq

/u01/app/oraInventory/orainstRoot.sh

