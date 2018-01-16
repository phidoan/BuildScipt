#!/bin/bash

settingFile=../setting.conf
logFile=result.log

. $settingFile
. ../checkSystem.sh

FULL_GIT_HTTP_URL="${GIT_HTTP_URL:0:8}$USERNAME:$PASSWORD@${GIT_HTTP_URL:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"
currentFolder=`pwd`


cd "$repoName/$buildFolder"


git pull origin gh-pages -s recursive -X ours > "$currentFolder/log/$1/$logFile" 2>&1
git add . >> "$currentFolder/log/$1/$logFile" 2>&1
git commit -m "%datetime%" >> "$currentFolder/log/$1/$logFile" 2>&1
git push origin HEAD:gh-pages >> "$currentFolder/log/$1/$logFile" 2>&1