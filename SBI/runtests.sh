#!/bin/bash
set -x
pytest --cov=. --cov-report html:coverage

sleep 3

pwd

# lets consolidate the various test results to a single dir
[ ! -d jenkins-test-results ] && mkdir jenkins-test-results

coverage=$(find . -name index.html)
if [ -n "$coverage" ]
then
    cp -p $coverage jenkins-test-results/
fi
