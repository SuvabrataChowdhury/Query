#!/bin/bash

#Use: split_string $string $delim result

function split_string {
	local string=$1
	local delim=$2
	local result_ref=$3
	
	IFS="$delim" read -ra "${result_ref?}" <<< "$string"
}

result=()

"$@"

for token in "${result[@]}"
do
	echo "$token"
done
