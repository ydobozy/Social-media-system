spipe="server.pipe"

##checking if server pipe created
if [ ! -p "$spipe" ]; then
	echo "Error:server not running"
	exit 1
fi

##checking if 2 args are passed at least
if [ $# -lt 2 ]; then
        echo "Error: Parameters problem"
	exit 1
fi

clientId="$1"
cpipe="$clientId.pipe"

##in case content still in client pipes echo and rm pipe
if [ -p "$cpipe" ]; then
	read output < $cpipe; echo "$output"
	rm "$cpipe"
fi

req="$2"

##for each rqst check args create pipe if valid send rqst to server pipe and read stdout in customer pipe
##rm pipe when done

   case "$req" in
        create)
                user="$3"
                if [ -z "$clientId" ] || [ -z "$user" ]; then
		echo "Error: client id and/or user name missing"
		exit 1

                else
                mkfifo "$cpipe"
		echo "$clientId $req $user" > "$spipe"
                read output < $cpipe; echo "$output"
                rm $cpipe
		exit 0
                fi
		;;
	add)
                user="$3"
                friend="$4"
                if [ -z "$clientId" ] || [ -z "$user" ] || [ -z "$friend" ]; then
                echo "Error: client id, user name and/or friend name missing"
                exit 1

                else
                mkfifo "$cpipe"
		echo "$clientId $req $user $friend" > "$spipe"
                read output < $cpipe; echo "$output"
                rm $cpipe
		exit 0
                fi
                ;;

        post)
                receiver="$3"
                sender="$4"
		command=( "$@" )
		chat="${command[@]:4}"
		if [ -z "$clientId" ] || [ -z "$receiver" ] || [ -z "$sender" ] || [ -z "$chat" ]; then
                echo "Error: client id, user name, a friend name and/or a message missing"
                exit 1

                else
                mkfifo "$cpipe"
		echo "$clientId $req $receiver $sender $chat" > "$spipe"
		read output < $cpipe; echo "$output"
                rm $cpipe
		exit 0
                fi
                ;;

        show)
                user="$3"
                if [ -z "$clientId" ] || [ -z "$user" ]; then
                echo "Error: client id and/or user name missing"
                exit 1

		else
                mkfifo "$cpipe"
		echo "$clientId $req $user" > "$spipe"
		cat < $cpipe
                rm $cpipe
		exit 0
                fi
                ;;

        shutdown)
		mkfifo "$cpipe"
		echo "$clientId $req" > "$spipe"
                read output < $cpipe; echo "$output"
		rm $cpipe
		exit 0
                ;;


        *)
                echo "Error: bad request"
                exit 1
   esac

