#!bin/bash

echo -e "Welcome to $0."
read -p "Enter the absolute path of you given directory: " path
echo -e "\nHere you can see files with write rights\n"

outputRaw=($(ls -l $path | awk '{ print $1 "\t" $9}'))
echo ${outputRaw[*]}