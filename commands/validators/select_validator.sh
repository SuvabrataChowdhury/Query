#!/bin/bash

source $QRY_HOME/lib/var.sh

#for now no use but will be used if selection criterion is implemented
#Usage: select_validate $selection $input_stream
function select_validate {
    if [[ $# -ne 2 ]]
    then
        exit 1
    fi
    
    IFS=" " read -r -a args <<< "$@"

    # echo ${args[@]}

    local selection="${args[*]:1}"
    local inp_stream_ref="$1"

    echo "Selection: $selection"
    echo "Input stream: $inp_stream_ref"

    #TODO check these validations
    if ! declare -p "$(echo "$inp_stream_ref" | cut -d "[" -f 1 )" &>/dev/null
    then
        echo_styled "ERROR" "$FUNCNAME" "Input stream is not set"
        exit 1
    fi

    if [[ "${#selection}" -gt 3 ]]
    then
        echo_styled "ERROR" "$FUNCNAME" "Selection arguments are too long"
        exit 1
    fi

    if [[ "${#selection}" -eq 3 ]]
    then
        if ! [[ "$selection" =~ .\ +(,?[0-9]+-*[0-9]*)+ ]]
        then
            echo_styled "ERROR" "$FUNCNAME" "Wrong selection partition argument given"
            exit 1
        fi
    fi

    if ! [[ "${#selection}" -eq 1 && "$selection" =~ \(.*\) ]]
    then
        echo_styled "WARN" "$FUNCNAME" "Selection regex is not in brackets. Use brackets to avoid globbing"
    fi

    return 0
}