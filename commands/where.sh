#!/bin/zsh

#TODO: evaluate any/all expressions

stream=("Hello World" " abc")

function cmd::where() {
	local exprss=$1
	
	
	if [[ $(is_valid_expression "$exprss") ]]
	then
		result=()
		
		for item in ${stream[@]}
		do
			if [[ $(evaluate_expr "$item" "$exprss") ]]
			then
				result+=("$item")
			fi
		done
	fi
}

#TODO make it work for compound statements
function is_valid_expression() {
	local exprss=$1
	local regex="^(like|length) "

	if [[ "$exprss" =~ "$regex" ]]
	then
		local exprs_arr=("$exprss")
		if [[ ${#exprs_arr[@]} != 2 ]]
		then
			return 0
		fi
		
		if [[ ${exprs_arr[0]} == "length" ]] && [[ ${exprs_arr[1]} =~ "[0-9]+" ]]
		then
			return 0
		fi
	fi
	
	return 1
}

#TODO make it handle more function
function evaluate_expr() {
	local tst_item=$1
	local exprss=$2
	
	local exprs_arr=("$exprss")
	
	case ${exprs_arr[0]} in
		"length")
			if [[ ${#tst_item[@]} == ${exprs_arr[1]} ]]
			then
				return 0
			fi
			;;
		"like")
		
			if [[ $tst_item =~ "${exprs_arr[1]}" ]]
			then
				return 0
			fi
			;;
		
		*)
			;;
	esac
	
	return 1
}

echo "This is where"
