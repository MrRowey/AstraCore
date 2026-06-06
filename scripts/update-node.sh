#!/bin/bash
set -e

NODE_PATH=$(dirname "$0")/../nodes/$1

if [ -z "$1" ]; then
  echo "Usage: ./update-node.sh <node-name>"
  exit 1
fi

cd "$NODE_PATH"

echo "Updating $1..."
docker compose pull
docker compose up -d
docker system prune -f
