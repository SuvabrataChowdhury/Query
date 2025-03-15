#!/bin/bash

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"
source "$QRY_HOME/lib/expression.sh"

#Usage:
#   validate tokens_ref "$expression" result_ref

function validate {
    if [[ $# != 3 ]]
    then
        echo "Invalid number of arguments passed to where"
        exit 1
    fi

    local exprss="$1"
    local stream_ref="$2"
    local result_ref="$3"

    echo "$exprss"

    if declare -p "$result_ref" &>/dev/null && declare -p "$stream_ref" &>/dev/null
    then
        if is_valid_expression "$exprss"
        then
            return 0
        fi
    else
        echo "Global variables are not set properly"
    fi

    exit 1
}