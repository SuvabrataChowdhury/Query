#!/bin/bash

QRY_HOME="/Users/I578071/MiniProjects/SystemsProgramming/Query"

source $QRY_HOME/commands/select.sh
source $QRY_HOME/commands/from.sh
source $QRY_HOME/commands/where.sh
source $QRY_HOME/commands/extractors/extract_args.sh


declare -a STREAM
declare -a RESULT

num_arg=0

select_args=""
from_args=""
where_args=""

cmd="$@"

echo "Command: $cmd, num args: $#"
extract_args $cmd

# #TODO: For future release, read from 
# #get the args from the resource file for now..
# while IFS=$'\n' read -r line|| [ -n "${line}" ]
# do 
#     case $num_arg in
#         0)
#             select_args="$line"
#             ;;
#         1)
#             from_args="$line"
#             ;;
#         2)
#             where_args="$line"
#             ;;
#         *)
#             echo "Wrong number of args provided"
#             exit 1
#             ;;
#     esac

#     ((num_arg++))
# done < "$QRY_HOME/resources/pre_qry_args.lst"

echo "From Args: $from_args"
echo "Where Args: $where_args"
echo "Select Args: $select_args"

cmd::from $from_args "STREAM"
cmd::where "$where_args"    #STREAM --<Filter>--> RESULT
cmd::select "$select_args" "RESULT[@]"