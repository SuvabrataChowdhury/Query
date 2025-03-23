#!/bin/bash

#TODO: evaluate any/all expressions

# QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/commands/validators/where_validator.sh
source $QRY_HOME/lib/expression.sh

#Use: cmd::where $condition
#	Set global variables STREAM and RESULT beforehand
function cmd::where {
	# echo "Where Args: $@"
	where_validate "$@" STREAM RESULT

	local exprss="$1"
	
	# echo "Stream: ${STREAM[@]}"
	# echo "Token: $exprss"

	# echo "valid expression"
	
	RESULT=()
	
	for token in "${STREAM[@]}"
	do
		# echo "token: $token expression: $exprss"
		
		if evaluate_expression "$token" "$exprss"
		then
			# echo "expression satisfied"
			RESULT+=("$token")
		fi
	done
}

# echo "This is where"

# STREAM=("Hello World" " abc")
# RESULT=()
# cmd::where "$1"

# unset QRY_HOME

# echo "filtered items:"
# for item in "${RESULT[@]}"
# do
# 	echo "$item"
# done
