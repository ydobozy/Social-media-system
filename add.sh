#!/bin/bash

user=$1
friend=$2

##check nbr arguments
if [ ! $# -eq 2 ]; then
        echo "Error: parameters problem" >&2
        exit 1

##check if $user user exists / directory
elif [ ! -d "$user" ]; then
        echo "Error: user does not exist" >&2
        exit 1

##check if $friend user does not exist
elif [ ! -d  "$friend" ]; then
        echo "Error: friend does not exist" >&2
        exit 1

##check if $user is already friends with $friend 
elif find . | grep -q "$friend" "$user/friends"; then
        echo "Error: user already friends with this user" >&2
        exit 1
fi

echo "$friend" >> "$user"/friends
echo "OK: friend added"
exit 0
