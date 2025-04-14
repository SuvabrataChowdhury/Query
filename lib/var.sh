#!/bin/bash

function is_defined {
    local var_ref="$1"

    if declare -p "$var_ref" &>/dev/null
    then
        return 0
    else
        return 1
    fi
}