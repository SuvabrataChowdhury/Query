#!/bin/bash

set -e

# QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/lib/string.sh
source $QRY_HOME/commands/validators/from_validator.sh

#TODO: Move the split string logic to a library function
#Use: Split givn stream into tokens with given delimiter
#	cmd::from "$source" "$delim" result
#	delim obtained from partition

function cmd::from {
	# echo "From Args: $@"
	from_validate "$@"
		
	local from_arg=$1
	local delim=$2
	local result_ref=$3

    # echo "FromArg: $from_arg Delim: $delim Result: $result_ref"

	string=$( cat "$from_arg" )
			
	split_string "$string" "$delim" "$result_ref"
}

#Driver code for testing
# result=""
# "$@" result

# echo "After splittiing"
# for token in "${result[@]}"
# do 
# 	echo "$token"
# done