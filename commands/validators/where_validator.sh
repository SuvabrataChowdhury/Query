#!/bin/bash

source $QRY_HOME/lib/expression.sh

#Usage:
#   validate tokens_ref "$expression" result_ref

function where_validate {
    # echo "where_validator: $@"

    if [[ $# != 3 ]]
    then
        echo "Invalid number of arguments passed to where $#"
        exit 1
    fi

    local exprss="$1"
    local stream_ref="$2"
    local result_ref="$3"

    # echo "$exprss"

    if declare -p "$result_ref" &>/dev/null && declare -p "$stream_ref" &>/dev/null
    then
        if is_valid_expression "$exprss"
        then
            return 0
        else
            echo "Expression is not valid"
        fi
    else
        echo "Where_validator: Global variables are not set properly"
    fi
    
    exit 1
}