
#!/bin/bash

ORACLE_BASE=`cat parameters.json | jq '.operating_system.directories.oracle_base'|sed -e 's/^"//' -e 's/"$//'`
PRODUCT_GROUP=`cat parameters.json | jq '.operating_system.os_groups.product_group'|sed -e 's/^"//' -e 's/"$//'`
ORAIVENTORY=`cat parameters.json | jq '.operating_system.directories.oraInventory'|sed -e 's/^"//' -e 's/"$//'`

ASM_DISKGROUP_DATA_NAME=`cat parameters.json | jq -c '.grid.diskgroups[]|select(.dg_uso|contains("rdbms_data_cdb"     )).dg_name'|sed -e 's/^"//' -e 's/"$//'`
ASM_DISKGROUP_DATA_REDUNDANCY=`cat parameters.json | jq -c '.grid.diskgroups[]|select(.dg_uso|contains("rdbms_data_cdb"     )).dg_redundancy'|sed -e 's/^"//' -e 's/"$//'`

TFA_HOME=`cat parameters.json | jq '.operating_system.directories.tfa_home'|sed -e 's/^"//' -e 's/"$//'`
GRID_BASE=`cat parameters.json | jq '.operating_system.directories.grid_base'|sed -e 's/^"//' -e 's/"$//'`
GRID_HOME=`cat parameters.json | jq '.operating_system.directories.grid_home'|sed -e 's/^"//' -e 's/"$//'`
ORACLE_HOME=`cat parameters.json | jq '.operating_system.directories.oracle_home'|sed -e 's/^"//' -e 's/"$//'`
RDBMS_GROUP=`cat parameters.json | jq '.operating_system.os_groups.rdbms_group'|sed -e 's/^"//' -e 's/"$//'`
GRID_GROUP=`cat parameters.json | jq '.operating_system.os_groups.grid_group'|sed -e 's/^"//' -e 's/"$//'`
GRID_OWNER=`cat parameters.json | jq '.operating_system.os_users.grid_owner'|sed -e 's/^"//' -e 's/"$//'`
RDBMS_OWNER=`cat parameters.json | jq '.operating_system.os_users.database_owner'|sed -e 's/^"//' -e 's/"$//'`
ORACLE_SID=`cat parameters.json | jq '.oracle_rdbms.sid_name'|sed -e 's/^"//' -e 's/"$//'`

GRID_HOME=`cat parameters.json | jq '.grid.directories.grid_home'|sed -e 's/^"//' -e 's/"$//'`

echo " 
oracle.install.responseFileVersion=/oracle/install/rspfmt_crsinstall_response_schema_v19.0.0
INVENTORY_LOCATION=$ORAIVENTORY
oracle.install.option=CRS_SWONLY
ORACLE_BASE=$ORACLE_BASE
oracle.install.asm.OSDBA=$PRODUCT_GROUP
oracle.install.asm.OSOPER=$PRODUCT_GROUP
oracle.install.asm.OSASM=$PRODUCT_GROUP
oracle.install.asm.SYSASMPassword=oracle
oracle.install.asm.diskGroup.name=$ASM_DISKGROUP_DATA_NAME
oracle.install.asm.diskGroup.redundancy=$ASM_DISKGROUP_DATA_REDUNDANCY
oracle.install.asm.diskGroup.AUSize=4
oracle.install.asm.diskGroup.FailureGroups=
oracle.install.asm.diskGroup.disksWithFailureGroupNames=
oracle.install.asm.diskGroup.disks=
oracle.install.asm.diskGroup.quorumFailureGroupNames=
oracle.install.asm.diskGroup.diskDiscoveryString=
oracle.install.asm.monitorPassword=
oracle.install.asm.gimrDG.name=
oracle.install.asm.gimrDG.redundancy=
oracle.install.asm.gimrDG.AUSize=
oracle.install.asm.gimrDG.FailureGroups=
oracle.install.asm.gimrDG.disksWithFailureGroupNames=
oracle.install.asm.gimrDG.disks=
oracle.install.asm.gimrDG.quorumFailureGroupNames=
oracle.install.asm.configureAFD=true
oracle.install.crs.configureRHPS=false
">/tmp/install_oracle/reponse_files/setupgrid.rsp
chown $GRID_OWNER:$PRODUCT_GROUP /tmp/install_oracle/reponse_files/setupgrid.rsp