#!/bin/bash

cd "$(dirname "$0")"
cd ./..
ROOT_DIR="$(pwd)"
echo "ROOT directory: ROOT_DIR"
rm -rf "ROOT_DIR/_build" "$ROOT_DIR/deps" "$ROOT_DIR/apps/block_scout_web/assets/node_modules" "$ROOT_DIR/apps/explorer/node_modules"