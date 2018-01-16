#!/bin/bash
settingFile=../setting.conf
logFile=result.log

# read file setting.conf
. $settingFile
. ../checkSystem.sh

FULL_GIT_HTTP_URL_APILOOKUP="${FULL_GIT_HTTP_URL_APILOOKUP:0:8}$USERNAME:$PASSWORD@${FULL_GIT_HTTP_URL_APILOOKUP:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL_APILOOKUP"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#current folder which contain this script.
currentFolder=`pwd`

#create folder log. The subfolder is by userID.
mkdir -p log
cd log
#create subfolder by userID
mkdir -p $1

cd $currentFolder
# call api to get docker file.
git clone --progress -b master $FULL_GIT_HTTP_URL_APILOOKUP >> "$currentFolder/log/$1/$logFile" 2>&1
if [ $? -eq 128 ]; then
  git pull
fi
check_status

cd $REPO_NAME/backend
#build system
npm install >> "$currentFolder/log/$1/$logFile" 2>&1
check_status

nodejs .
check_status






