#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

gcloud auth activate-service-account --key-file <(echo ${GCLOUD_CLIENT_SECRET} | base64 --decode)

gsutil cp -a public-read artifactory/io/projectriff/command/io.projectriff.command/*/*.tgz gs://projectriff/command-function-buildpack/
if [ "${TRAVIS_BRANCH}" = master ] ; then
    gsutil cp -a public-read artifactory/io/projectriff/command/io.projectriff.command/*/*.tgz gs://projectriff/command-function-buildpack/latest.tgz
fi