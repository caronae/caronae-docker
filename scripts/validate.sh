#!/bin/sh
set -eo pipefail

SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
DOCKER_DIR="$SCRIPT_DIR/.."

if [ ! -f /tmp/foo.txt ]; then
    touch $DOCKER_DIR/secrets/.env
fi

CARONAE_ENV_TAG="" \
AWS_LOG_GROUP="" \
AWS_LOG_REGION="" \
/usr/local/bin/docker-compose -f "$DOCKER_DIR/docker-compose.yml" -f "$DOCKER_DIR/docker-compose.prod.yml" config -q
