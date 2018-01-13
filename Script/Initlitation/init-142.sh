#!/bin/bash
settingFile=../setting.conf
logFile=result

# read file setting.conf
. $settingFile
echo $gitHttpUrl
exit 0

# call api to get docker file.
curl -I -X GET http://localhost:8888/demo-rest-jersey-spring/podcasts/1

# get dockerfile name.
dockerFileName = ''

cd $buildFolder

# build docker container in current location.
docker build -t 'websiteCustomer' .

# docker run . waiting for api and command run.






