#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./health.sh <node-name>"
  exit 1
fi

cd "$(dirname "$0")/../nodes/$1"

echo "Checking health for $1..."
docker compose ps
docker stats --no-stream
