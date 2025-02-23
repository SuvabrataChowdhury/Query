#!/bin/bash

function cmd::from(){
	strm_src=$1
	
	if [[ -f $strm_src ]]; then
		cat $strm_src
	elif [[ -d $strm_src ]]; then
		ls $strm_src
	else
		echo "Invalid Stream source given"
		return 1
	fi
}


read -p "Enter source: " strm_src
cmd::from $strm_src

