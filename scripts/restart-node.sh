#!/bin/bash
set -e

NODE_PATH=$(dirname "$0")/../nodes/$1

if [ -z "$1" ]; then
  echo "Usage: ./restart-node.sh <node-name>"
  exit 1
fi

cd "$NODE_PATH"

echo "Restarting $1..."
docker compose down
docker compose up -d
