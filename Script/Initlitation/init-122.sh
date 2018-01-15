#!/bin/bash
settingFile=../setting.conf
logFile=result.log

# read file setting.conf
. $settingFile

# get build from webforms (git)
curl -I -X GET http://localhost:8888/demo-rest-jersey-spring/podcasts/1

# build command if the build standard haven't builded yet.







