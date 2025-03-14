#!/bin/bash

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/lib/string.sh
source $QRY_HOME/commands/validators/validator.sh

#TODO: Move the split string logic to a library function
#Use: Split givn stream into tokens with given delimiter
#	cmd::from "$source" "$delim" result
#	delim obtained from partition

function cmd::from {
	if validate_args "$0" "$@"
	then
		local from_arg=$1
		local delim=$2
		local result_ref=$3

		if [[ -r "$from_arg" ]]
		then
			string=$( cat "$from_arg" )
			
			split_string "$string" "$delim" "$result_ref"
		else
			echo "Invalid From argument"
			exit 1
		fi
	else
		echo "Invalid "
	fi
}

##Driver code for testing
# result=""
# "$@" result

# echo "After splittiing"
# for token in "${result[@]}"
# do 
# 	echo "$token"
# done