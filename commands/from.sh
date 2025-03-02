#!/bin/zsh

stream=()

#TODO: Move the split string logic to a library function

function cmd::from(){
	local string=$1
	local delim=$2

	#string=$(echo $string | tr "$delim" "\n")
	
	local length=${#string}

	local subStr=""
	
	for (( i=0 ; i<length ; i++ ))
	do
		chr=${string:$i:1}
	
		if [[ $chr != $delim ]]
		then
			subStr="$subStr$chr"
		else
			stream+=("$subStr")
			subStr=""
		fi
	done

	stream+=("$subStr")
}


echo "Enter source:"
read src

echo "Enter delim:"
read delim

cmd::from "$src" "$delim"

for item in ${stream[@]}; do
	echo $item
done

echo ${#stream[@]}
