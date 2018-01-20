#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
# read file setting.conf
. $settingFile
. $SCRIPT_FOLDER_PATH/checkSystem.sh


FULL_GIT_HTTP_URL_CMS="${FULL_GIT_HTTP_URL_CMS:0:8}$USERNAME:$PASSWORD@${FULL_GIT_HTTP_URL_CMS:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL_CMS"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/log/$USER_ID
mkdir -p $USER_LOG_PATH


cd $SOURCE_FOLDER_PATH/$USER_ID/$WEBSITE_NAME
git clone --progress -b gh-pages $FULL_GIT_HTTP_URL_CMS >> "$USER_LOG_PATH/$logFile" 2>&1
if [ $? -eq 128 ]; then
  cd $REPO_NAME
  git pull --progress $GIT_REMOTE_CMS >> "$USER_LOG_PATH/$logFile" 2>&1
fi