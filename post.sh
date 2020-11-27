#!/bin/bash

receiver="$1"
sender="$2"
message="$3"

##check nbr arguments
if [ ! "$#" -eq 3 ]; then
        echo "Error: parameters problem" >&2
        exit 1

##check if $receiver does not exists / directory
elif [ ! -d "$receiver" ]; then
        echo "Error: Receiver does not exist" >&2
        exit 1

##check if $sender does not exist / directory
elif [ ! -d  "$sender" ]; then
        echo "Error: Sender does not exist" >&2
        exit 1

##check if $sender is not a friend of $receiver
elif ! find . | grep -q "$sender" "$receiver"/friends ; then
        echo "Error: Sender is not a friend of receiver" >&2
        exit 1

fi

##everything went well 
echo "'$sender': '$message'" >> "$receiver"/wall
echo "Ok: Message posted to wall"
exit 0


