#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: ./logs.sh <node-name> <service-name>"
  exit 1
fi

cd "$(dirname "$0")/../nodes/$1"

docker compose logs -f $2
