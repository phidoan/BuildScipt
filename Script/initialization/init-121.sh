#!/bin/bash
settingFile=../setting.conf
logFile=result.log

. ../checkSystem.sh
. $settingFile

GIT_URL_121="https://github.com/vinaas/easyquiz-cms.git"
USER_ID=$1
currentFolder=`pwd`

#create folder log. The subfolder is by userID.
mkdir -p "$currentFolder/log/$USER_ID"

# get build from webforms (git)
git clone --progress -b gh-pages $GIT_URL_121 > "$currentFolder/log/$USER_ID/$logFile" 2>&1
check_status

