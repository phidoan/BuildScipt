#!/bin/bash
settingFile=$SCRIPT_FOLDER_PATH/setting.conf
logFile=result.log
USER_ID=$1
# read file setting.conf
. $settingFile
$SCRIPT_FOLDER_PATH/checkSystem.sh

FULL_GIT_HTTP_URL_CMS="${FULL_GIT_HTTP_URL_CMS:0:8}$USERNAME:$PASSWORD@${FULL_GIT_HTTP_URL_CMS:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL_CMS"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/log/$USER_ID
mkdir -p $USER_LOG_PATH


cd $SCRIPT_FOLDER_PATH/$FOLDER_INITIATE
git clone --progress -b gh-pages $FULL_GIT_HTTP_URL_CMS >> "$USER_LOG_PATH/$logFile" 2>&1
if [ $? -eq 128 ]; then
  git pull >> "$USER_LOG_PATH/$logFile" 2>&1
fi
check_status
# build command if the build standard haven't builded yet.