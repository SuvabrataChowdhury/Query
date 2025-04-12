#!/bin/bash

source $QRY_HOME/lib/style.sh
source $QRY_HOME/lib/string.sh

#Usage: Used to validate from arguments
# from_validator "$from_arg" "$delim" "result_ref"

function from_validate {
    # echo "From_validator args: $@"
    if [[ $# != 3 ]]
    then
        echo_styled "ERROR" "$FUNCNAME" "For from input count should be 3"
        exit 1;
    fi

    # echo "Number of args validated"

    local from_arg=$1
    local delim=$2
    local result_ref=$3

    # echo "FromArg: $from_arg Delim: $delim Result: $result_ref"

    if declare -p "$result_ref" &>/dev/null && [[ ${#delim} == 1 ]]
    then

        # local files="$( echo "$from_arg" | tr "," " ")"

        local files=""
        split_string "$from_arg" "," files

        for file in "${files[@]}"
        do
            # echo $file

            if [[ ! -r "$file" ]]
            then
                echo_styled "ERROR" "$FUNCNAME" "Given file either does not exist or is unreadable $file"
                exit 1
            fi
        done

        #for now only use 1 lengthed delim
        # if [[ -r "$from_arg" ]] && [[ ${#delim} == 1 ]]
        # then
        #     return 0
        # else
        #     echo_styled "ERROR" "$FUNCNAME" "Invalid argument near from: check from and part arguments"
        #     exit 1
        # fi

        return 0
    else
        echo_styled "ERROR" "$FUNCNAME" "Result variable is unset exitting"
        exit 1
    fi
}

# result="abc"
# "$@" result