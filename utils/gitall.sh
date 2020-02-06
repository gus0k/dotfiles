#!/bin/sh

export SSH_AGENT_PID="$(ps axww | grep -v grep | grep ssh-agent | grep -v ' -s' | awk '{print $1}')"
export SSH_AUTH_SOCK="$(find /run/user -path '*keyring-*' -name '*ssh*' -print 2>/dev/null)"

message="auto-commit from $USER@$(hostname -s) on $(date)"
GIT=`which git`
REPO_DIR="$1"
cd ${REPO_DIR}
${GIT} add --all .
${GIT} commit -m "$message"

gitPush=$(${GIT} push -vvv 2>&1)
echo "$gitPush"

