#!/bin/bash

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/lib/string.sh
source $QRY_HOME/lib/array.sh

#Usage:
#   extract_args $command [Make sure the select_args, from_args, where_args are set correctly]

function extract_args {
    if [[ $# != 1 ]]
    then
        echo "Wrong number of arguments are given"
        exit 1
    fi

    if declare -p select_args &>/dev/null && declare -p from_args &>/dev/null && declare -p where_args &>/dev/null
    then
        local cmd=$1

        local select_pattern="select"
        local from_pattern="from"
        local where_pattern="where"

        declare -a splt_cmd
        split_string "$cmd" "\"" splt_cmd

        local select_index=$(find_in_array "$select_pattern" "splt_cmd[@]")
        local from_index=$(find_in_array "$from_pattern" "splt_cmd[@]")
        local where_index=$(find_in_array "$where_pattern" "splt_cmd[@]")

        if [[ $select_index -ge 0 ]] && [[ $from_index -ge 0 ]] && [[ $where_index -ge 0 ]]
        then

            local offset=$((from_index-select_index))
            select_args="${splt_cmd[*]:$((select_index+1)):$((offset-1))}"

            offset=$((where_index-from_index))
            from_args="${splt_cmd[*]:$((from_index+1)):$((offset-1))}"

            where_args="${splt_cmd[*]:$((where_index+1))}"
        else
            echo "Keyword Select or From or where is missing"
            exit 1
        fi
    else
        echo "Global variables are not set correctly"
        exit 1
    fi
}

#Driver code for testing

# select_args=""
# from_args=""
# where_args=""

# "$@"