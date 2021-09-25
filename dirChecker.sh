#!bin/bash
echo "
       ___      ________              __            
  ____/ (_)____/ ____/ /_  ___  _____/ /_____  _____
 / __  / / ___/ /   / __ \/ _ \/ ___/ //_/ _ \/ ___/
/ /_/ / / /  / /___/ / / /  __/ /__/ ,< /  __/ /    
\__,_/_/_/   \____/_/ /_/\___/\___/_/|_|\___/_/ by pa4ul
                                                    
"
read -p "Enter the absolute path of you given directory: " path #implement REGEX VALIDATION!!!
echo -e "\n"

echo -e "Additinal options available"
echo -e "\t1) List everything"
echo -e "\t2) List only Files"
echo -e "\t3) List only Directorys"

function listEverything {
    outputRaw=($(ls -la $path | awk '{ print $1 "\t" $9}'))
    #echo ${outputRaw[*]} -> to display the whole array
    for ((i=1; i<=${#outputRaw[@]}; i+=2));
        do
        if [[ ${outputRaw[i]:1:2} = "rw" ]]
            then
            #echo -e ${outputRaw[i]}"\t"${outputRaw[i+1]} -> lists all filenames INCLUSIVE their rights
            echo ${outputRaw[i+1]}
        fi
    done
}

function listFiles {
    outputRaw=($(ls -la $path | awk '{ print $1 "\t" $9}'))
    #echo ${outputRaw[*]} -> to display the whole array
    for ((i=1; i<=${#outputRaw[@]}; i+=2));
        do
        if [[ ${outputRaw[i]:0:3} = "-rw" ]]
            then
            echo ${outputRaw[i+1]}
            #echo ${outputRaw[i]:0:3}
        fi
    done
}

function listDirectorys {
    outputRaw=($(ls -la $path | awk '{ print $1 "\t" $9}'))
    #echo ${outputRaw[*]} -> to display the whole array
    for ((i=1; i<=${#outputRaw[@]}; i+=2));
        do
        if [[ ${outputRaw[i]:0:3} = "drw" ]]
            then
            echo ${outputRaw[i+1]}
        fi
    done
}

read -p "Select your option: " opt
echo -e "\n"

case $opt in
"1") listEverything ;;
"2") listFiles ;;
"3") listDirectorys ;;
esac
#echo -e "\nHere you can see files with write rights\n"

