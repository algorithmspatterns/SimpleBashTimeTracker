#!/bin/bash

currentdate="$(date +"%Y%m%d")"
#file="ttrackerReport.csv"
extensionfile=".csv"
file="$currentdate$extensionfile"
if [ -f "$file" ]
then
    echo "$file found."
else
    echo "$file"
    echo "Date;Time;ActiveWindowName" >> $file
fi

MYSEC="s"
if [ -z $1 ]
then
    MYTIMER="5s"
else
    MYTIMER="$1$MYSEC"
fi

while true
do
    MYSEPARATOR=";"
    GETACTIVEWINDOW=$(xdotool getwindowfocus getwindowname)
    echo -e $(date +"%d.%m.%Y;%T")$MYSEPARATOR$GETACTIVEWINDOW >> $file
#    sleep 1s
    sleep $MYTIMER
done
