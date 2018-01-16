#!/bin/bash
currentFolder=`pwd`
previousFolder="${currentFolder:0:-15}"
settingFile=$previousFolder/setting.conf
logFile=result.log

# read file setting.conf
. $settingFile
. $previousFolder/checkSystem.sh

FULL_GIT_HTTP_URL_CMS="${FULL_GIT_HTTP_URL_CMS:0:8}$USERNAME:$PASSWORD@${FULL_GIT_HTTP_URL_CMS:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL_CMS"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#current folder which contain this script.


#create folder log. The subfolder is by userID.
mkdir -p log
cd log
#create subfolder by userID
USER_ID=$1
mkdir -p $USER_ID


cd $currentFolder
git clone --progress -b gh-pages $FULL_GIT_HTTP_URL_CMS >> "$currentFolder/log/$USER_ID/$logFile" 2>&1
if [ $? -eq 128 ]; then
  git pull >> "$currentFolder/log/$USER_ID/$logFile" 2>&1
fi
check_status
# build command if the build standard haven't builded yet.







