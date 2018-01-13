#!/bin/bash

settingFile=.../setting.conf
logFile=result

. $settingFile

fullGitHttpUrl="${gitHttpUrl:0:8}$username:$password@${gitHttpUrl:8}"
repoNameWithDotGit=`basename "$fullGitHttpUrl"`
repoName="${repoNameWithDotGit:0:-4}"

cd "$repoName/$buildFolder"

git pull origin gh-pages -s recursive -X ours > "../../$logFile" 2>&1
git add . >> "../../$logFile" 2>&1
git commit -m "%datetime%" >> "../../$logFile" 2>&1
git push origin HEAD:gh-pages >> "../../$logFile" 2>&1