#!/bin/bash

source $QRY_HOME/lib/style.sh

#Use: split_string $string $delim result
function split_string {
	if [[ $# != 3 ]]
	then
		echo_styled "ERROR" "$FUNCNAME" "Wrong number of arguments passed $#"
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
		echo_styled "ERROR" "$FUNCNAME" "result reference is not set correctly"
		exit 1
	fi

	return 0
}

#Use: substring_regex $string $regex
function substring_regex {
	if [[ $# != 2 ]]
	then
		echo_styled "ERROR" "$FUNCNAME" "Wrong number of arguments passed $#"
		exit 1
	fi

	local string="$1"
	local regex="$2"

	# echo "$string" "$regex"

	# local result="$(echo "$string" | grep -oE "$regex")"

	# echo "$result"

	echo "$string" | grep -oE "$regex" | tr "\n" " "
	# return 0
}

## Driver code for testing
# result=()
# # i
# "$@"

# split_string "Hello World.

# abc" "." result

# for token in "${result[@]}"
# do
# 	echo "$token"
# done
