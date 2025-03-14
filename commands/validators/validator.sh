#!/bin/bash

#Usage:
#   validate $source $args_to_be_validated

function validate {
    local cmd=$1
    local args=$2

    case $cmd in 
        "cmd::select")
            return "$( select_validator \"$args\" )"
            ;;
        "cmd::from")
            return "$( from_validator \"$args\" )"
            ;;
        "cmd::where")
            return "$( where_validator \"$args\" )"
            ;;
        *)
            echo "Validation request coming from unknown source"
            return 1
            ;;
    esac
}