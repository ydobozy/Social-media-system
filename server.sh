#!/bin/bash

spipe="server.pipe"

if [ ! -p "$spipe" ]; then
        mkfifo "$spipe"
fi

while true; do

read -a command < "$spipe"

clientId="${command[0]}"
cpipe="$clientId.pipe"
unset command[0]

##case if only 1 request passed as arg and different from shutdown
if [ "${#command[@]}" -eq 1 ] && [ ! "${command[@]}" = "shutdown" ]; then
        echo "Error: bad request"
        exit 1
fi
req="${command[1]}"

chat="${command[@]:4}"

##passing args to execute commands and sending stdout including stderr to customer pipes
   case "${command[1]}" in
        create)
                output="$(./create.sh "${command[2]}" 2>&1)"
		echo "$output" > "$cpipe"
                ;;
        add)
                output="$(./add.sh "${command[2]}" "${command[3]}"2>&1)"
                echo "$output" > "$cpipe"
		;;

        post)
                output="$(./post.sh "${command[2]}" "${command[3]}" "$chat" 2>&1)"
		echo "$output" > "$cpipe"
		;;

        show)
                output="$(./show.sh "${command[2]}" 2>&1)"
		echo "$output" > "$cpipe"
		;;

        shutdown)
                echo "Server correctly shutdown" > "$cpipe"
		rm $spipe
		exit 0
                ;;

        *)
                echo "Error: bad request"
                exit 1
   esac

done
