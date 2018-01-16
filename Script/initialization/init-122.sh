#!/bin/bash
settingFile=../setting.conf
logFile=result.log

# read file setting.conf
. $settingFile
. ../checkSystem.sh

FULL_GIT_HTTP_URL_CMS="${FULL_GIT_HTTP_URL_CMS:0:8}$USERNAME:$PASSWORD@${FULL_GIT_HTTP_URL_CMS:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL_CMS"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#current folder which contain this script.
currentFolder=`pwd`

#create folder log. The subfolder is by userID.
mkdir -p log
cd log
#create subfolder by userID
mkdir -p $1

cd $currentFolder

git clone --progress -b gh-pages FULL_GIT_HTTP_URL_CMS >> "$currentFolder/log/$1/$logFile" 2>&1
# build command if the build standard haven't builded yet.







