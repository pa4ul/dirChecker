#!bin/bash
echo -e "Welcome to $0."
read -p "Enter the absolute path of you given directory: " path
echo -e "\nHere you can see files with write rights\n"

outputRaw=($(ls -la $path | awk '{ print $1 "\t" $9}'))
#echo ${outputRaw[*]} -> to display the whole array
for ((i=1; i<=${#outputRaw[@]}; i+=2));
do
#if [[ $ ]]
echo ${outputRaw[i]}

done