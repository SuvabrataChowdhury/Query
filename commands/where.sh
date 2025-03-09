#!/bin/bash

#TODO: evaluate any/all expressions
stream=("Hello World" " abc")
result=()

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/lib/expression.sh

#Use: cmd::where $condition
function cmd::where {
	local exprss="$1"
	
	if is_valid_expression "$exprss"
	then
		echo "valid expression"
		
		result=()
		
		for item in "${stream[@]}"
		do
			echo "item: $item expression: $exprss"
			
			if evaluate_expression "$item" "$exprss"
			then
				echo "expression satisfied"
				result+=("$item")
			fi
		done
	fi
}

echo "This is where"
cmd::where "$1"

unset QRY_HOME

echo "filtered items:"
for item in "${result[@]}"
do
	echo "$item"
done
