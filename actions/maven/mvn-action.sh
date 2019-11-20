#!/usr/bin/env bash
set -e

echo "JAVA_HOME = $JAVA_HOME"
JAVA_HOME="/usr/local/openjdk-11/"
# Setup maven local repo
if [[ -n "$MAVEN_LOCAL_REPO_PATH" ]]; then
     MAVEN_REPO_LOCAL="-Dmaven.repo.local=$MAVEN_LOCAL_REPO_PATH"
fi

# Do the copyright verification
mvn $MAVEN_REPO_LOCAL -ntp $*
