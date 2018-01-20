#!/bin/bash

#----------------------------------------------------------------
SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SCRIPT_FOLDER_PATH/setting.conf
logFile=result.log
. $settingFile

#run int-131.sh
. $SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/int-131.sh

#run script npm or node in here
cd $SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/$REPO_NAME
if [ $? -gt 0 ]; then
	npm start
if
