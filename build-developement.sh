#!/usr/bin/bash
set -e

pelican content --autoreload & (cd docs; browser-sync start --server --files "*")
