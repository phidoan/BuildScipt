#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
. $settingFile

CNAME_PATH=${CNAME_PATH:-`pwd`}

function updateCNAME() {
	echo "$CNAME_DOMAIN" > CNAME
	git add CNAME
	git commit -m "update CNAME to $CNAME_DOMAIN"
	git push --progress $GIT_REMOTE HEAD:$GIT_BRANCH >> "$USER_LOG_PATH/$logFile" 2>&1
}

updateCNAME
