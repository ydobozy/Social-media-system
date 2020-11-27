#!/bin/bash

user="$1"

##check arguments
if [ ! $# -eq 1 ]; then
        echo "Error: parameters problem" >&2
        exit 1

##check if $user does not exist / directory
elif [ ! -d "$user" ]; then
        echo "Error: user does not exist" >&2
        exit 1

fi

echo "wallStart"

while read -r line
do
  echo "$line"
done <"$user"/wall

echo "wallEnd"

## Everything went well
exit 0
