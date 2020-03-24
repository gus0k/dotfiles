. ~/.keychain/`/bin/hostname`-sh

message="auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
REPO_DIR="$1"
cd ${REPO_DIR}
${GIT} add --all .
${GIT} commit -m "$message"

gitPush=$(${GIT} push -vvv 2>&1)
echo "$gitPush"

