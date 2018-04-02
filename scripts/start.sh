#!/bin/bash
set -e

SCRIPT_DIR=$( dirname "${BASH_SOURCE[0]}" )
DOCKER_DIR="$SCRIPT_DIR/.."

echo "Starting caronae-docker using the tag $CARONAE_ENV_TAG"
/usr/local/bin/docker-compose -f "$DOCKER_DIR/docker-compose.yml" -f "$DOCKER_DIR/docker-compose.prod.yml" up -d
