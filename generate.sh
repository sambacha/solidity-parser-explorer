#!/bin/bash
set -x
ls output/ || exit 1 && echo "Run Setup first!"
rm -rf output/
bundle install
bundle exec jekyll build -d output/
