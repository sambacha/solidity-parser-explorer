#!/bin/bash
set -x

BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
#VERSION=${GITHUB_REF#refs/tags/v}

# check for rust
cargo --version | exit 1 && echo "cargo not found"


# make directories
mkdir -p bin/
mkdir -p docs/

echo "Download tree-sitter.js"
wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.20.0/tree-sitter.js
mv tree-sitter.js assets/js/tree-sitter.js

npm install
echo "Generating tree-sitter requirements..."
npx tree-sitter-cli generate

echo "Building WASM Solidity Parser..."
npx tree-sitter-cli build-wasm
mv tree-sitter-solidity.wasm /assets/js/tree-sitter-solidity.wasm
chmod +x assets/js/tree-sitter-solidity.wasm

sleep 1
echo "configure LANGUAGE_BASE_URL for proper resolution"
echo $BUILD_DATE >> .build_logs

exit 0