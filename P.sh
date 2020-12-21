#! /bin/bash
# to to check if receiver's wall available
if [ -z "$1" ]; then
echo "Usage $0 mutex-name"
exit 1
else
# arg sent $receiver/wall link p and wall
while ! ln "$0" "$1-lock" 2>/dev/null; do
sleep 1
done
exit 0
fi
