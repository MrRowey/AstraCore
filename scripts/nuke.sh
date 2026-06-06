#!/bin/bash
set -e

NODE_PATH=$(dirname "$0")/../nodes/$1

if [ -z "$1" ]; then
  echo "Usage: ./nuke.sh <node-name>"
  exit 1
fi

cd "$NODE_PATH"

echo "Stopping and removing all containers for $1..."
docker compose down --remove-orphans
