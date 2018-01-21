DOMAIN_CNAME=$1
FILE_CNAME=$2
GIT_REMOTE=${3:-origin}
GIT_BRANCH=${4:-master}

function updateCNAME() {
	echo "$DOMAIN_CNAME" > CNAME
	git add $GIT_REMOTE CNAME
	git commit -m $GIT_REMOTE "update CNAME to $DOMAIN_CNAME"
	git push --progress $GIT_REMOTE $GIT_BRANCH >> "$USER_LOG_PATH/$logFile" 2>&1
}

updateCNAME
