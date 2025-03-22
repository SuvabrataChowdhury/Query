#!/bin/bash

#Usage:
#   find_in_array $pattern reference_var_name

function find_in_array {
    local pattern=$1
    local arr_ref=$2

    local index=0

    for item in "${!arr_ref}"
    do
        # echo "$item"

        if [[ $item =~ $pattern ]]
        then
            echo $index
            return 0
        fi

        ((index++))
    done

    echo "-1"
    return 1
}

# arr=(select "*" from file1.txt where "length 10")
# find_in_array "select" arr[@]
# find_in_array "from" arr[@]
# find_in_array "where" arr[@]