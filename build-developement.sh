#!/usr/bin/bash
set -e

pelican content --autoreload & (cd output; browser-sync start --server --files "*")
