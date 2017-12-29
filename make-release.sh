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
    tar xf "${bin}.tar" "$name"
    gzip "${bin}.tar"
    rm "$name"
done
