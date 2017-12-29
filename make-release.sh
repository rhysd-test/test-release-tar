#! /bin/bash

set -e

name=github-release-test

rm -rf release
gox -verbose
mkdir -p release
mv ${name}_* release/
cd release
for bin in *; do
    mv "$bin" "$name"
    zip "${bin}.zip" "$name"
    rm "$name"
done
