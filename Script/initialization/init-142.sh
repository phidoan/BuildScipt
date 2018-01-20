#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SCRIPT_FOLDER_PATH/setting.conf
logFile=result.log

. $settingFile
. $SCRIPT_FOLDER_PATH/checkSystem.sh

FULL_GIT_HTTP_URL_APILOOKUP="${FULL_GIT_HTTP_URL_APILOOKUP:0:8}$USERNAME:$PASSWORD@${FULL_GIT_HTTP_URL_APILOOKUP:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL_APILOOKUP"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/log/$USER_ID
mkdir -p $USER_LOG_PATH

cd $SOURCE_FOLDER_PATH/$USER_ID/$WEBSITE_NAME
# call api to get docker file.
git clone --progress -b master $FULL_GIT_HTTP_URL_APILOOKUP >> "$USER_LOG_PATH/$logFile" 2>&1
if [ $? -eq 128 ]; then
  cd $REPO_NAME
  git pull --progress $GIT_REMOTE_API >> "$USER_LOG_PATH/$logFile" 2>&1
fi

cd $SOURCE_FOLDER_PATH/$USER_ID/$WEBSITE_NAME/$REPO_NAME/backend
#build system
npm install >> "$USER_LOG_PATH/$logFile" 2>&1

nodejs .