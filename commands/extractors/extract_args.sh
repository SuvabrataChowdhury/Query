#!/bin/bash

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/lib/string.sh
source $QRY_HOME/lib/array.sh

function extract_args {
    if [[ $# != 1 ]]
    then
        echo "Wrong number of arguments are given"
        exit 1
    fi

    if declare -p select_args &>/dev/null && declare -p from_args &>/dev/null && declare -p where_args &>/dev/null
    then
        local cmd=$1
        # local select_args_ref=$2
        # local from_args_ref=$3
        # local where_args_ref=$4

        local select_pattern="select"
        local from_pattern="from"
        local where_pattern="where"

        # echo "Splitting string"

        declare -a splt_cmd
        split_string "$cmd" "\"" splt_cmd

        local select_index=$(find_in_array "$select_pattern" "splt_cmd[@]")
        local from_index=$(find_in_array "$from_pattern" "splt_cmd[@]")
        local where_index=$(find_in_array "$where_pattern" "splt_cmd[@]")

        if [[ $select_index -ge 0 ]] && [[ $from_index -ge 0 ]] && [[ $where_index -ge 0 ]]
        then
            # echo "$select_index $from_index $where_index"

            local offset=$((from_index-select_index))

            select_args="${splt_cmd[*]:$((select_index+1)):$((offset-1))}"
            # echo "Select args: $select_args"

            offset=$((where_index-from_index))
            # echo "Offset: $offset"

            from_args="${splt_cmd[*]:$((from_index+1)):$((offset-1))}"
            # echo "From args: $from_args"

            where_args="${splt_cmd[*]:$((where_index+1))}"
            # echo "Where args: $where_args"


            # resource_file="$QRY_HOME/resources/pre_qry_args.lst"

            # echo "${splt_cmd:$select_index:$(("$from_index"-"$select_index"))}" > $resource_file
            # echo "${splt_cmd:$fom_index:$(("$where_index"-"$from_index"))}" >> $resource_file
            # echo "${splt_cmd:$where_index}" >> $resource_file
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