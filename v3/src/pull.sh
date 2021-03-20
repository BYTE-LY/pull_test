#!/bin/sh

[ -z "$1" ] && { echo '$1 -> directory'; exit 1; }

# output directory
output_dir="$1"
mkdir -p "$output_dir"

# hard coded link
base_link="https://raw.githubusercontent.com/BYTE-LY/pull_test/master/v3/files/"

# temp file for the index
index="$(mktemp)"

# pull the index
wget -q --show-progress -O $index "$base_link/index.txt"


# Create the directories and Download the files
cat $index | 
	while read i ; do
		[ "${i#${i%?}}" = "/" ] && { mkdir -p "$output_dir/$i" ; } || { wget -q --show-progress -O "$output_dir/$i" "$base_link/$i" ; }
	done

# remove the temp file
rm $index
