#!/bin/bash

settingFile=../setting.conf
logFile=result

. $settingFile

fullGitHttpUrl="${gitHttpUrl:0:8}$username:$password@${gitHttpUrl:8}"
repoNameWithDotGit=`basename "$fullGitHttpUrl"`
repoName="${repoNameWithDotGit:0:-4}"

# clone repo
git clone --progress $fullGitHttpUrl > "$logFile" 2>&1
cd $repoName

# create and clone gh-pages branch
mkdir -p $buildFolder
cd $buildFolder
git clone --progress -b gh-pages $fullGitHttpUrl . >> "../../$logFile" 2>&1

# build command
