#!/bin/bash

settingFile=../setting.conf
logFile=result.log

. ../checkSystem.sh
. $settingFile

FULL_GIT_HTTP_URL="${GIT_HTTP_URL:0:8}$USERNAME:$PASSWORD@${GIT_HTTP_URL:8}"
REPO_NAME_WITH_DOT_GIT=`basename "$FULL_GIT_HTTP_URL"`
REPO_NAME="${REPO_NAME_WITH_DOT_GIT:0:-4}"

#current folder which contain this script.
currentFolder=`pwd`

#create folder log. The subfolder is by userID.
mkdir -p log
cd log
#create subfolder by userID
mkdir -p $1

cd $currentFolder
# clone repo
git clone --progress $FULL_GIT_HTTP_URL > "$currentFolder/log/$1/$logFile" 2>&1
cd $repoName

# create and clone gh-pages branch
mkdir -p $buildFolder
cd $buildFolder
git clone --progress -b gh-pages $FULL_GIT_HTTP_URL >> "$currentFolder/log/$1/$logFile" 2>&1

# build command


