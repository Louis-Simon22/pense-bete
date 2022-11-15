#!/usr/bin/bash
set -e

mkdir -p output
cp -rf ./css ./output/css
pelican content --autoreload & (cd output; browser-sync start --server --files "../*")
