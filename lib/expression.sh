#!/bin/bash

#TODO make it handle more function
function evaluate_expression {
	local tst_item=$1
	local exprss=$2
	
	local exprs_arr=($exprss)
	
	case "${exprs_arr[0]}" in
		#TODO length is a property treat it as a property of the tokens not as an operand
		"length")
			if [[ ${#tst_item} == $(( 10#${exprs_arr[1]} )) ]]
			then
				return 0
			fi
			;;
		"like")
			if [[ "$tst_item" =~ ${exprs_arr[1]} ]]
			then
				return 0
			fi
			;;
		*)
			;;
	esac
	
	return 1
}

#TODO make it work for compound statements
function is_valid_expression {

	local exprss=$1
	local regex="((like .*)|(length [0-9]+))"

	if [[ "$exprss" =~ $regex ]]
	then
		return 0
	fi
	
	return 1 #Invalid Expression
}

# "$@"
