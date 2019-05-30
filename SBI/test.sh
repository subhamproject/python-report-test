#!/bin/bash
export USERID=$(id -u)
export PATH="$PATH:/usr/local/bin"
export GROUPID=$(id -g)
cd $(dirname $0)
[ $BRANCH_NAME == "master" ] && export NEXUS_REPO=nexus-release || export NEXUS_REPO=nexus-snapshot
docker-compose -f test-bed.yml run --rm -w "$WORKSPACE" --name maven-${BUILD_NUMBER} -e NEXUS_REPO=$NEXUS_REPO --entrypoint "SBI/runtests.sh" testpy
