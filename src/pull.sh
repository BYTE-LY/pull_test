#!/bin/sh

index_link="https://raw.githubusercontent.com/BYTE-LY/pull_test/master/files/index.txt"
index="$(mktemp)"


# Download the index
curl -o $index $index_link
