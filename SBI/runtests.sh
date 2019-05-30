#!/bin/bash
#pytest --cov=. --cov-report html:coverage
pytest --cov ./ --cov-report term-missing --cov-report xml --cov-config .coveragerc --junitxml=junit.xml

sleep 3
