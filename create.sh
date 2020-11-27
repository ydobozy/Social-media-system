#!/bin/bash

user=$1

##check arguments
if [ ! $# -eq 1 ]; then
	echo "Error: parameters problem" >&2
	exit 1

##check if user already exists
	elif [ -d $user ]; then
	echo "Error: user already exists" >&2
	exit 1
fi

mkdir $user
touch $user/friends
touch $user/wall 
echo "OK: user created"
exit 0
