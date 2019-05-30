#!/bin/bash
set -x
#pytest --cov=. --cov-report html:coverage
pytest --cov ./ --cov-report term-missing --cov-report xml --cov-config .coveragerc --junitxml=junit.xml

sleep 3

pwd

# lets consolidate the various test results to a single dir
[ ! -d jenkins-test-results ] && mkdir jenkins-test-results

coverage=$(find ./coverage -name index.html)
if [ -n "$coverage" ]
then
    cp -p $coverage jenkins-test-results/
fi
