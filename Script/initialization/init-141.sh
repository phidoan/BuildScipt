#!/bin/bash
settingFile=../setting.conf
logFile=result.log

. ../checkSystem.sh
. $settingFile

GIT_URL_141="https://github.com/vinaas/easyquiztest.git"
REPO_NAME_WITH_DOT_GIT=`basename "$GIT_URL_141"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"
USER_ID=$1
currentFolder=`pwd`

#create folder log. The subfolder is by userID.
mkdir -p "$currentFolder/log/$USER_ID"

# clone easy backend
git clone --progress $GIT_URL_141 > "$currentFolder/log/$USER_ID/$logFile" 2>&1
check_status

cd "$REPO_NAME/backend"
npm install
nodejs .
check_status
