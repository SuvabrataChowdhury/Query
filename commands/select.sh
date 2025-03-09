#!/bin/bash

#TODO use a filter to filter through the given stream
function cmd::select() {
	local selection=$1
	local stream=$2

	case "$selection" in
		'*')
				echo "$stream"
				return 0
				;;
		*)
				echo "Invalid token near select"
				return 1
				;;
	esac
}

#TODO for now take input from user later to be supplied by supervising command
"$@"