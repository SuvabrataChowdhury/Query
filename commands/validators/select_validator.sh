#!/bin/bash

source $QRY_HOME/lib/var.sh

#for now no use but will be used if selection criterion is implemented
#Usage: select_validate $selection $input_stream
function select_validate {
    if [[ $# -ne 2 ]]
    then
        exit 1
    fi

    local selection="$1"
    local inp_stream_ref="$2"

    #  if ! [[ "$selection" =~ \(.*\) ]]
    #     then
    #         echo_styled "WARN" "$FUNCNAME" "Selection is not in brackets \n Use brackets to avoid globbing"
    #     fi

    #     return 0

    if ! declare -p "$(echo "$inp_stream_ref" | cut -d "[" -f 1 )" &>/dev/null
    then
        echo_styled "ERROR" "$FUNCNAME" "Input stream is not set"
        exit 1
    fi

    if ! [[ "$selection" =~ \(.*\) ]]
    then
        echo_styled "WARN" "$FUNCNAME" "Selection is not in brackets. Use brackets to avoid globbing"
    fi

    return 0
}