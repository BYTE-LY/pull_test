# Pull Test
This repo is a test for pulling the files from github (raw)

## version 1
In this version I wrote the full links in the index.txt, then pulled the files.
this method is too simple and does not support directories.

## version 2
In this version I put the output of the command 'find -type (d/f)', into a index.json.
make the directories and then pull the files into their directories.

## version 3
In this version I put the directory names followed by '/' and then the files into a index.txt.
the script loops through the index and checks the last char of in each line if it's a '/' then the script treats it as a directory otherwise it's a file.
