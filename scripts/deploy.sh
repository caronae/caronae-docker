#!/bin/sh
set -eo pipefail

if [ $# -ne 2 ]; then
    echo "TAG or ENV are not defined. Usage: $0 <TAG> <ENV>"
    exit 1
fi

sudo CARONAE_ENV_TAG=$1 SECRETS_ENV=$2 AWS_DEFAULT_REGION=$AWS_LOG_REGION su
set -eo pipefail

cd /var/caronae/caronae-docker

echo "Updating caronae-docker..."
git fetch origin master
git reset --hard origin/master

echo "Updating the secrets for $SECRETS_ENV..."
scripts/kms decrypt "env_$SECRETS_ENV"

echo "Updating docker-compose using the tag $CARONAE_ENV_TAG..."
/usr/local/bin/docker-compose up -d
