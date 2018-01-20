#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
. $settingFile

FULL_GIT_HTTP_URL="${GIT_HTTP_URL:0:8}$USERNAME:$PASSWORD@${GIT_HTTP_URL:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_DEPLOYMENT/log/$USER_ID
mkdir -p $USER_LOG_PATH

#pull code
cd $SOURCE_FOLDER_PATH/$USER_ID/$WEBSITE_NAME/$REPO_NAME/$buildFolder
git pull --progress $GIT_REMOTE >> "$USER_LOG_PATH/$logFile" 2>&1

