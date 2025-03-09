#!/bin/bash

#Use: split_string $string $delim result

function split_string {
	local string=$1
	local delim=$2
	local result_ref=$3

	string="${string//$'\n'/$delim}"

	IFS="$delim" read -ra "${result_ref?}" <<< "$string"
}

# ## Driver code for testing
# result=()
# i
# # "$@"

# split_string "Hello World.

# abc" "." result

# for token in "${result[@]}"
# do
# 	echo "$token"
# done
