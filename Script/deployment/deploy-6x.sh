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

function updateCNAME() {
	cd $4
	echo "$1" > CNAME
	git add CNAME
	git commit -m "update CNAME to $1"
	git push --progress $2 HEAD:$3 >> "$USER_LOG_PATH/$logFile" 2>&1
}

if [ ! -z "$CNAME_DOMAIN_DEMO"] then
	updateCNAME $CNAME_DOMAIN_DEMO $CNAME_GIT_ROMOTE_DEMO $CNAME_GIT_BRANCH_DEMO $CNAME_PATH_DEMO
fi

if [ ! -z "$CNAME_DOMAIN_PROD"] then
	updateCNAME $CNAME_DOMAIN_PROD $CNAME_GIT_ROMOTE_PROD $CNAME_GIT_BRANCH_PROD $CNAME_PATH_PROD
fi



