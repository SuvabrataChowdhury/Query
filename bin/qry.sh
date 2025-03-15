#!/bin/bash

set -e

#For Now set QRY_HOME is set to corrent directory. Later to be changed to an env variable
QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

_QRY_HOME=${QRY_HOME:-""}

function print_err {
    local msg=$1
    echo "$msg" | tr "\[a-z\]" "\[A-Z\]"
}

function set_src {
    if [[ -d $_QRY_HOME ]]
    then
        local commands_dir=$_QRY_HOME/commands

        for cmd_file in $commands_dir/*.sh
        do
            if [[ -r "$cmd_file" ]]
            then
                source "$cmd_file"
            else
                print_err "$cmd_file is not valid or does not have read permission"
                exit 1
            fi
        done
        unset cmd_file
    else
        print_err "Query Home Directory Not Found"
        exit 1
    fi
}

function init_program {
    set_src

    return 0
}

#TODO regex is difficult to read and maintain use custom logic which runs in linear time
function retrieve_cmd_args {

    echo ""
    # local command_string=$1
    # local select_args_ref=$2
    # local from_args_ref=$3
    # local where_args_ref=$4

    # local select_pattern="select +[a-zA-Z0-9_\-\.\"\']+"
    # local from_part_pattern="from +[a-zA-Z0-9_\-\.,\"\']+ +part +[a-zA-Z0-9_\-\"\']"
    # local from_pattern="from +[a-zA-Z0-9_\-\.,\"\']+"
    # local part_pattern="part +[a-zA-Z0-9_\-\"\']"
    # local where_pattern="where +[a-zA-Z0-9_\-\.,\*\"\' ]+"

    # #TODO make a library function to do this sort of split
    # local extr_select_args=($( echo "$command_string " | grep -oE "$select_pattern" ))
    # local extr_from_part_args=($( echo "$command_string " | grep -oE "$from_part_pattern" ))
    # local extr_from_args=($( echo "$extr_from_part_args" | grep -oE "$from_pattern" ))
    # local extr_part_args=($( echo "$extr_from_part_args" | grep -oE "$part_pattern" ))
    # local extr_where_args=($( echo "$command_string " | grep -oE "$where_pattern" ))

    # declare "$select_args_ref=\"${extr_select_args[@]:1}\""
    # declare "$from_args_ref=\"${extr_from_args[@]:1}${extr_part_args[@]:1}\""
    # declare "$where_args_ref=\"${extr_where_args[@]:1}\""
}

function validate_and_process_cmds {
    local command_string=$1

    local select_args=""
    local from_args=""
    local where_args=""

    retrieve_cmd_args "$command_string" "select_args" "from_args" "where_args"

    local result=""

    echo "Select Arg: $select_args"
    echo "From Arg: $from_args"
    echo "Where arg: $where_args"

    # cmd::from "$from_args" "result"
    # cmd::where "$where_args" "result"
    # cmd::select "$select_args" "result"

    # display_result "$result"
}

function main {
    local commands=$1
    
    init_program
    validate_and_process_cmds "$commands"
}

commands=("$@")
main "commands"