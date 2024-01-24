#!/bin/bash
# Setup environment for circleci builds.
set -ueo pipefail

export CURRENT_USER="$(whoami)"
export WORKDIR=${WORKDIR:-${CIRCLE_WORKING_DIRECTORY:-"${HOME}/workspace"}}

# Map circle env
export CI_BRANCH=${CI_BRANCH:-${CIRCLE_BRANCH:-}}
export CI_TAG=${CI_TAG:-${CIRCLE_TAG:-}}
export CI_BUILD_NUMBER=${CI_BUILD_NUMBER:-${CIRCLE_PIPELINE_NUM:-}}
export CI_COMMIT=${CI_COMMIT:-${CIRCLE_SHA1:-}}
export CI_PULL_REQUEST=${CI_PULL_REQUEST:-${CIRCLE_PULL_REQUEST:-}}

# Configurations
export ENV="release"
export GRADLE_BASE_OPTS="--no-daemon --stacktrace"
export PACKAGING_DIR="${WORKDIR}/packaging"

# AWS Config
export S3_CI_SHARED_RESOURCES="s3://rundeck-ci-resources/shared/resources"

# Import functions
source "${WORKDIR}/scripts/circleci/packaging-functions.sh"
source "${WORKDIR}/scripts/circleci/dependencies-functions.sh"
