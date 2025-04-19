#!/bin/bash

source $QRY_HOME/lib/expression.sh
source $QRY_HOME/lib/style.sh

#Usage:
#   validate tokens_ref "$expression" "$stream_ref"

function where_validate {
    # echo "where_validator: $@"

    if [[ $# != 2 ]]
    then
        echo_styled "ERROR" "$FUNCNAME" "Invalid number of arguments passed to where $#"
        exit 1
    fi

    local exprss="$1"
    local stream_ref="$2"
    # local result_ref="$3"

    # echo "$exprss"

    if declare -p "$stream_ref" &>/dev/null
    then
        if is_valid_expression "$exprss"
        then
            return 0
        else
            echo_styled "ERROR" "$FUNCNAME" "Expression is not valid"
        fi
    else
        echo_styled "ERROR" "$FUNCNAME" "Where_validator: Global variables are not set properly"
    fi
    
    exit 1
}