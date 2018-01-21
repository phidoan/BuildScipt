#!/bin/bash

#----------------------------------------------------------------
#SCRIPT_FOLDER_PATH="/var/jenkins_home/gitRepo/BuildScript/Script"
#----------------------------------------------------------------

settingFile=$SETTING_CONFIG_FILE_FULL_PATH
logFile=result.log
. $settingFile

#run deloy-51.sh
. $SCRIPT_FOLDER_PATH/$FOLDER_DEPLOYMENT/deloy-51.sh

#create folder log
USER_LOG_PATH=$SCRIPT_FOLDER_PATH/$FOLDER_DEPLOYMENT/log/$USER_ID
mkdir -p $USER_LOG_PATH
GIT_HTTP_URL_CLIENT="$GIT_HTTP_URL_CLIENT/$USER_PROJECT.git"
#add remote other git
FULL_GIT_HTTP_URL_CLIENT="${GIT_HTTP_URL_CLIENT:0:8}$USERNAME_CLIENT:$PASSWORD_CLIENT@${GIT_HTTP_URL_CLIENT:8}"
git remote add $GIT_REMOTE_CLIENT $FULL_GIT_HTTP_URL_CLIENT 
git push --progress $GIT_REMOTE_CLIENT master >> "$USER_LOG_PATH/$logFile" 2>&1

#create CNAME and push to github pages
FILE_CNAME=$SOURCE_FOLDER_PATH/$USER_ID/$WEBSITE_NAME/$buildFolder
#format {PROJECTNAME}.{ACCOUNT}.easywebhub.me
. $SCRIPT_FOLDER_PATH/$FOLDER_DEPLOYMENT/deloy-6x.sh "$WEBSITE_NAME.$USER_ID.$DOMAIN" $FILE_CNAME $GIT_REMOTE_CLIENT



