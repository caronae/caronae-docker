#!/bin/sh
set -eo pipefail

if [ $# -eq 0 ]; then
    echo "TAG is not defined. Usage: $0 <TAG>"
    exit 1
fi

sudo CARONAE_ENV_TAG=$1 su
set -eo pipefail

echo "Updating caronae-docker..."
cd /var/caronae/caronae-docker
git fetch origin master
git reset --hard origin/master

echo "Updating using the tag $CARONAE_ENV_TAG"
/usr/local/bin/docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
