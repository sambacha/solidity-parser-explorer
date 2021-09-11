#!/bin/bash
set -x
ls output/ || exit 1 && echo "Run Setup first!"
rm -rf output/
bundle exec jekyll build -d output/
echo "site ready in output/ directory!"
exit 0
