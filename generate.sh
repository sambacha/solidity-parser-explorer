#!/bin/bash
set -x
ls output/ || exit 1 && echo "Generate output/ directory by running setup.sh"
bundle install
bundle exec jekyll build -d output/
echo "Output directory generated, deploy ready!"
