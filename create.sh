#!/bin/bash

user="$1"

##check arguments
if [ ! $# -eq 1 ]; then
	echo "Error: parameters problem" >&2
	exit 1

##check if user already exists
	elif [ -d "$user" ]; then
	echo "Error: user already exists" >&2
	exit 1
fi

##critical section create folder friends and wall semaphores used
mkdir "$user"
./P.sh "$user/"
touch "$user"/friends
touch "$user"/wall 
echo "OK: user created"
./V.sh "$user/"
exit 0
