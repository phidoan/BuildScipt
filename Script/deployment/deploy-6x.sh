#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
. $settingFile

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_DEPLOYMENT/log/$USER_ID
mkdir -p $USER_LOG_PATH

GIT_REMOTE=$CNAME_GIT_ROMOTE_DEMO
GIT_BRANCH=$CNAME_GIT_BRANCH_DEMO


function updateCNAME() {
	echo "$CNAME_DOMAIN" > CNAME
	git add CNAME
	git commit -m "update CNAME to $CNAME_DOMAIN"
	git push --progress $GIT_REMOTE HEAD:$GIT_BRANCH >> "$USER_LOG_PATH/$logFile" 2>&1
}

updateCNAME
