#!/bin/bash

ESC_SEQ="\033" # `\033`: more compatible than `\e`

# font style
NORMAL="[0;"
BOLD="[1;"
FAINT="[2;"
ITALIC="[3;"
UNDERLINE="[4;"

# foreground colors
FG_BLACK="30m"
FG_RED="31m"
FG_YELLOW="33m"
FG_GREEN="32m"
FG_CYAN="36m"
FG_GREY="90m"

# reset style
END_STYLE="$ESC_SEQ[0m"

# symbols
SYMBOL_CHECKMARK="\xE2\x9C\x94"
SYMBOL_CROSSOUT="\xE2\x9D\x8C"
SYMBOL_WARNING="\xE2\x9A\xA0"

# style variants
STYLE_ERROR="$ESC_SEQ$BOLD$FG_RED$SYMBOL_CROSSOUT "
STYLE_WARN="$ESC_SEQ$BOLD$FG_YELLOW$SYMBOL_WARNING "
STYLE_SUCCESS="$ESC_SEQ$BOLD$FG_GREEN$SYMBOL_CHECKMARK "
STYLE_TIP="$ESC_SEQ$NORMAL$FG_CYAN "
STYLE_VERBOSE="$ESC_SEQ$NORMAL$FG_GREY " #$FG_BLACK

is_valid_invocation=true

# Use: echo_styled style-variant function_name text
function echo_styled() {
    local variant=$1
    local path=$2
    local text=$3

    case $variant in
        WARN)
            style=$STYLE_WARN
            ;;
        ERROR)
            style=$STYLE_ERROR
            ;;
        SUCCESS)
            style=$STYLE_SUCCESS
            ;;
        TIP)
            style=$STYLE_TIP
            ;;
        VERBOSE)
            style=$STYLE_VERBOSE
            ;;
        *)
            echo_styled "ERROR" "$FUNCNAME" "Wrong Varient Specified"
            is_valid_invocation=false
            ;;
    esac

    if [[ $is_valid_invocation == true ]]
    then
        # echo -e "${style}$text${END_STYLE}"
        # echo -e "${style}[$variant] $text${END_STYLE}"
        echo -e "${style}[$path] $text${END_STYLE}"
    fi
}

# "$@"