#!/bin/bash
TERMINAL=$TERMINAL
APP=$1
APPID=$2

if niri msg -j windows | jq -e ".[] | select(.app_id == \"$APPID\")" > /dev/null; then
    pkill -f "$TERMINAL --app-id $APPID"

else

    $TERMINAL --app-id "$APPID" \
      sh -c "$APP"

fi
