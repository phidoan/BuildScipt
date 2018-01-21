#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
. $settingFile

#run script npm or node in here
if [ $? -gt 0 ]; then
	cd $SOURCE_FOLDER_PATH/$USER_ID/$WEBSITE_NAME/$REPO_NAME
	npm watch
if
