#!/bin/bash

#TODO: evaluate any/all expressions

source $QRY_HOME/commands/validators/where_validator.sh
source $QRY_HOME/lib/expression.sh

#Use: cmd::where $condition
#	Set global variables STREAM and RESULT beforehand
function cmd::where {
	# echo "Where Args: $@"
	# # echo $#
	# if [[ -z "$*" ]] || [[ $# -eq 0 ]]	#where clause does not exists in statement
	# then
	# 	return 0
	# fi

	where_validate "$@" STREAM

	local exprss="$1"
	
	# echo "Stream: ${STREAM[@]}"
	# echo "Token: $exprss"

	# echo "valid expression"
	
	result=()
	
	for token in "${STREAM[@]}"
	do
		# echo "token: $token expression: $exprss"
		
		if evaluate_expression "$token" "$exprss"
		then
			# echo "expression satisfied"
			result+=("$token")
		fi
	done

	copy_array "result" "STREAM"
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
