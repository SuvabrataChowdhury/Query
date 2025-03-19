#!/bin/bash

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/lib/string.sh

function extract_args {
    local cmd=$1
    local select_args_ref=$2
    local from_args_ref=$3
    local where_args_ref=$4

    local select_pattern="select"
    local from_pattern="from"
    local where_pattern="where"

    declare -a splt_cmd
    split_string "$cmd" "\"" splt_cmd

    local select_index=$(find_in_array "$select_pattern" "splt_cmd[@]")
    local from_index=$(find_in_array "$from_pattern" "splt_cmd[@]")
    local where_index=$(find_in_array "$where_pattern" "splt_cmd[@]")

    resource_file="$QRY_HOME/resources/pre_qry_args.lst"

    echo "${splt_cmd:$select_index:$(("$from_index"-"$select_index"))}" > $resource_file
    echo "${splt_cmd:$fom_index:$(("$where_index"-"$from_index"))}" >> $resource_file
    echo "${splt_cmd:$where_index}" >> $resource_file
}