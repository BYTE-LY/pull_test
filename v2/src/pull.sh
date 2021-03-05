#!/bin/sh

if [ -z "$1" ] ; then
	echo '$1 -> directory'
	exit 1
fi

# output directory
output_dir="$1"
mkdir -p "$output_dir"

# hard coded link
index_link="https://raw.githubusercontent.com/BYTE-LY/pull_test/master/v2/files/index.json"

# temp file for the index
index="$(mktemp)"

# pull the index
#wget -q --show-progress -O $index $index_link
wget -q --show-progress -O $index $index_link

## pull the files ##

# make the dirs
cat $index | jq -r '.directories[]' |
	while read line ; do
		mkdir -p $output_dir/$line
	done

# pull the files
cat $index | jq -r '.files[]' |
	while read line ; do
		wget -q --show-progress -O "$output_dir$line" "https://raw.githubusercontent.com/BYTE-LY/pull_test/master/v2/files$line"
	done

# remove the temp file
rm $index
