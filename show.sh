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

## critical section display wall  semaphores used
./P.sh "$user"/wall
echo "wallStart"

#while read -r line
#do
#echo "$line"
cat "$user"/wall

echo "wallEnd"
./V.sh "$user"/wall
## Everything went well
exit 0
