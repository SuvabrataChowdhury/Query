#!/bin/bash

#TODO use a filter to filter through the given stream
#Useage:
#	cmd::select "$condition" RESULT_STREAM

function cmd::select() {
	
	local selection=$1
	local result_ref=$2

	case "$selection" in
		"\*")
				echo "${!result_ref}" #change this
				return 0
				;;
		*)
				echo "Invalid token near select"
				return 1
				;;
	esac
}

#TODO for now take input from user later to be supplied by supervising command
# "$@"