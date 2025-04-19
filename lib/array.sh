#!/bin/bash

source $QRY_HOME/lib/var.sh
source $QRY_HOME/lib/style.sh

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

function copy_array {
    local src_ref=$1
    local dest_ref=$2

    if is_defined "$src_ref" && is_defined "$dest_ref"
    then
        eval "$dest_ref=(\"\${$src_ref[@]}\")"

        return 0
    fi
    
    echo_styled "ERROR" "$FUNCNAME" "Source or Destination array is not defined"
    return 1
}

# arr=("Hello" "World" "abc" "def" "ghi jkl")
# dest=()

# copy_array "arr" "dest"

# for i in "${dest[@]}"
# do
#     echo "$i"
# done

# echo "Source Array: ${arr[@]}"
# echo "Destination Array: ${dest[@]}"

# arr=(select "*" from file1.txt where "length 10")
# find_in_array "select" arr[@]
# find_in_array "from" arr[@]
# find_in_array "where" arr[@]