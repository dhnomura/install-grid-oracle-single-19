#!/bin/bash

REMOTE_BIN_GRID=`cat parameters.json | jq '.bin_files.remote_bin_grid'|sed -e 's/^"//' -e 's/"$//'`
REMOTE_BIN_DATABASE=`cat parameters.json | jq '.bin_files.remote_bin_database'|sed -e 's/^"//' -e 's/"$//'`
MOS_USER=`cat parameters.json | jq '.bin_files.mos_user'|sed -e 's/^"//' -e 's/"$//'`
MOS_PASS=`cat parameters.json | jq '.bin_files.mos_pass'|sed -e 's/^"//' -e 's/"$//'`
LOCAL_BIN_DEST=`cat parameters.json | jq '.bin_files.loca_bin_dest'|sed -e 's/^"//' -e 's/"$//'`

wget --http-user=$MOS_USER --password=$MOS_PASS $REMOTE_BIN_GRID -P $LOCAL_BIN_DEST
wget --http-user=$MOS_USER --password=$MOS_PASS $REMOTE_BIN_DATABASE -P $LOCAL_BIN_DEST