#!/bin/bash

#Use: split_string $string $delim result

function split_string {
	if [[ $# != 3 ]]
	then
		echo "Wrong number of arguments passed $#"
		exit 1
	fi

	local string=$1
	local delim=$2
	local result_ref=$3

	if declare -p "$result_ref" &>/dev/null
	then
		string="${string//$'\n'/$delim}"

		IFS="$delim" read -ra "${result_ref?}" <<< "$string"
	else
		echo "result reference is not set correctly"
		exit 1
	fi

	return 0
}

# ## Driver code for testing
# result=()
# # i
# "$@"

# # split_string "Hello World.

# # abc" "." result

# for token in "${result[@]}"
# do
# 	echo "$token"
# done
