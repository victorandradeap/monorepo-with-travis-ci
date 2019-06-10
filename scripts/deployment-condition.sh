#!/bin/bash

if [[ -z $TRAVIS_COMMIT_RANGE ]]; then
    echo "Commit range cannot be empty."
    exit 1
fi

if [[ -z $PROJECT ]]; then
    echo "Change path cannot be empty."
    exit 1
fi

if [[ -z $(git diff $TRAVIS_COMMIT_RANGE $PROJECT) ]]
then
    echo "Project $PROJECT is NOT changed to be deployed."
else
    echo "Project $PROJECT is changed to be deployed."
    $PROJECT/gradlew publish
fi