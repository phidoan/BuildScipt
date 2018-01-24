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

# cmd curl for event of webhook.. param in config.js of GIT_HTTP_URL_WEBHOOK
#curl -i POST -H "X-GitHub-Event:pull_request; X-GitHub-Delivery:1bcae6b0-0061-11e8-87f2-63418365c7ad ;X-Hub-Signature:sha1=00a6e2b6a21854772dc3e82297b7612c6346dfbc" http://103.199.18.44:8001/web-hook

