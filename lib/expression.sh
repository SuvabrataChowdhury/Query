#!/bin/bash

#TODO make it handle more function
function evaluate_expression {
	echo "evaluation of expression begins"
	
	local tst_item=$1
	local exprss=$2
	
	local exprs_arr=($exprss)
	
	case "${exprs_arr[0]}" in
		#TODO length is a property treat it as a property of the tokens not as an operand
		"length")
			echo "asking for length"
			
			if [[ ${#tst_item} == $(( 10#${exprs_arr[1]} )) ]]
			then
				echo "matched"
				return 0
			fi
			;;
		"like")
			echo "asking for like"
		
			if [[ "$tst_item" =~ ${exprs_arr[1]} ]]
			then
				echo "matched"
				return 0
			fi
			;;
		
		"eq")
		
			#To be done
		*)
			echo "Invalid operator"
			;;
	esac
	
	echo "not matched"
	return 1
}

#TODO make it work for compound statements
function is_valid_expression {
	echo "validation expression begins"
	
	local exprss=$1
	local regex="((like .*)|(length [0-9]+))"

	if [[ "$exprss" =~ $regex ]]
	then
		echo "valid expr"
		return 0
	fi
	
	echo "invalid expr"
	return 1 #Invalid Expression
}

"$@"
