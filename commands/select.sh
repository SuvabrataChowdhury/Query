#!/bin/bash

source $QRY_HOME/commands/validators/select_validator.sh
source $QRY_HOME/lib/string.sh

#TODO use a filter to filter through the given stream
#Useage:
#	cmd::select "$selection" INPUT_STREAM
#	TODO: cmd::select "$selection" "splitter" INPUT_STREAM

function cmd::select {
	# echo "Select Args: $@"

	select_validate "$@"

	local selection="$2"
	local inp_stream_ref="$1"

	# echo "$inp_stream_ref"
	
	local result=""

	for token in "${!inp_stream_ref}"
	do
		# echo "$token"
		# result'="$(substring_regex "$token" "$selection")"
		result="$(perform_selection "$token" "$selection")"
		echo "$result"
	done
	
}

#TODO: move such helper functions to a seperate package for security purposes

function perform_selection {
	# echo "Entered perform_selection"

	local token="$1"
	# local selection=($2)

	IFS=" " read -r -a selection <<< "$2"

	# echo "Selection: ${selection[0]}"

	# echo "$token $selection"

	if [[ ${#selection[0]} == 1 ]]
	then
		perform_partition_selection "$token" "${selection[@]}"
	else
		perform_regex_selection "$token" "${selection[@]}"
	fi
}

function perform_regex_selection {
	# echo "Entered perform_regex_selection"

	local token="$1"
	local selection="$2"

	# echo "$token $selection"

	# echo "$token" "$selection"
	# local result="$(echo "$token" | grep -oE "$selection")"
	local result="$(substring_regex "$token" "$selection")"

	# echo "$result"
	echo "$result"
}

#TODO: Check this implementation
function perform_partition_selection {
	# echo "Entered perform_partition_selection"

	local token="$1"
	# IFS=" " read -r -a selection <<< "$2"

	local delim="${selection[0]}"
	local grp_extrct="${selection[1]}"

	# echo "Delimiter: $delim"
	# echo "Group Extraction: $grp_extrct"

	# if ! [[ "$grp_extrct" =~ (,?[0-9]+-*[0-9]*)+ ]]
	# then
	# 	echo_styled "ERROR" "$FUNCNAME" "Make Sure to give the group extraction as numbers"
	# 	exit 1
	# fi

	# IFS=":" read -r start end <<< "${selection[1]}"

	# if ! [[ ${start}${end} =~ [0-9]+ ]]
	# then
	# 	echo_styled "ERROR" "$FUNCNAME" "Make Sure to give the start and end index as numbers"
	# 	exit 1
	# fi

	# if [[ $start -lt 0 || $end -lt 0 ]]
	# then
	# 	echo_styled "ERROR" "$FUNCNAME" "Make Sure to give the start and end index as positive numbers"
	# 	exit 1
	# fi

	echo "$token" | cut -d "$delim" -f "$grp_extrct"
}

# result=("hello world" "hello World")
# "$@" "result[@]"