#!/bin/bash

source $QRY_HOME/commands/validators/select_validator.sh
source $QRY_HOME/lib/string.sh

#TODO use a filter to filter through the given stream
#Useage:
#	cmd::select "$selection" INPUT_STREAM
#	TODO: cmd::select "$selection" "splitter" INPUT_STREAM

function cmd::select {
	select_validate "$@"

	local selection="$1"
	local inp_stream_ref="$2"
	
	local result=""

	for token in "${!inp_stream_ref}"
	do
		# echo "$token"
		result="$(substring_regex "$token" "$selection")"
		echo "$result"
	done
	

	# case "$selection" in
	# 	"\*")
	# 			echo "${!inp_stream_ref}" #change this
	# 			return 0
	# 			;;
	# 	*)
	# 			echo "Invalid token near select"
	# 			return 1
	# 			;;
	# esac
}

#TODO for now take input from user later to be supplied by supervising command
# result=("hello world" "hello World")
# "$@" result[@]