#!/bin/bash

#TODO use a filter to filter through the given stream
function cmd::select() {
	stream=$1
	
	echo $stream
}

#TODO for now take input from user later to be supplied by supervising command
read -p "Enter Stream: " stream

cmd::select "$stream"
