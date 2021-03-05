#!/bin/sh

if [ -z "$1" ] ; then
	echo '$1 -> directory'
	exit 1
fi

# output directory
output_dir="$1"
mkdir -p "$output_dir"

# hard coded link
index_link="https://raw.githubusercontent.com/BYTE-LY/pull_test/master/method1/files/index.txt"

# temp file for the index
index="$(mktemp)"

# pull the index
wget -q --show-progress -O $index $index_link

# pull the Files
#while read line ; do wget -q --show-progress -P "$output_dir" "$line" ; done < $index
while read line ; do wget -P "$output_dir" "$line" ; done < $index

# remove the temp file
rm $index
