#!/bin/bash

#----------------------------------------------------------------
SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SCRIPT_FOLDER_PATH/setting.conf
logFile=result.log
. $settingFile

#run deloy-51.sh
. $SCRIPT_FOLDER_PATH/$FOLDER_INITIATE/deloy-51.sh


#add remote other git
FULL_GIT_HTTP_URL_CLIENT="${GIT_HTTP_URL_CLIENT:0:8}$USERNAME_CLIENT:$PASSWORD_CLIENT@${GIT_HTTP_URL_CLIENT:8}"
git remote add $GIT_REMOTE_CLIENT $FULL_GIT_HTTP_URL_CLIENT 
git push --progress $GIT_REMOTE_CLIENT master >> "$USER_LOG_PATH/$logFile" 2>&1