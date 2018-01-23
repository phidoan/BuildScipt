#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
# read file setting.conf
. $settingFile

FULL_GIT_HTTP_URL_WEBHOOK="${GIT_HTTP_URL_WEBHOOK:0:8}$USERNAME_WEBHOOK:$PASSWORD_WEBHOOK@${GIT_HTTP_URL_WEBHOOK:8}"
REPO_NAME_WITH_DOT_GIT_WEBHOOK=`basename "$FULL_GIT_HTTP_URL_WEBHOOK"`
REPO_NAME_WEBHOOK="${REPO_NAME_WITH_DOT_GIT_WEBHOOK:0:-4}"

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_SYNCHRONIZE/log/$USER_ID
mkdir -p $USER_LOG_PATH

cd $SCRIPT_FOLDER_PATH/$FOLDER_SYNCHRONIZE

git clone --progress $FULL_GIT_HTTP_URL_WEBHOOK >> "$USER_LOG_PATH/$logFile" 2>&1
if [ $? -eq 128 ]; then
  cd $REPO_NAME_WEBHOOK
  git pull --progress $GIT_REMOTE_WEBHOOK >> "$USER_LOG_PATH/$logFile" 2>&1
fi

#run npm install and node index.js then remember change somethings in config.js
npm install
node index.js