#!/bin/bash

#----------------------------------------------------------------
SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SCRIPT_FOLDER_PATH/setting.conf
logFile=result.log
. $settingFile

FULL_GIT_HTTP_URL="${GIT_HTTP_URL:0:8}$USERNAME:$PASSWORD@${GIT_HTTP_URL:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/log/$USER_ID
mkdir -p $USER_LOG_PATH

#pull code
cd $SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/$REPO_NAME/$buildFolder
git add .
git commit -m "message"
git pull --progress $GIT_REMOTE >> "$USER_LOG_PATH/$logFile" 2>&1
if [ $? -gt 0 ]; then
    git push --progress $GIT_REMOTE gh-pages >> "$USER_LOG_PATH/$logFile" 2>&1
else
	#if conflict then abort
	git reset --hard $GIT_REMOTE >> "$USER_LOG_PATH/$logFile" 2>&1
fi

