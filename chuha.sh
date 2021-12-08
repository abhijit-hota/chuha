#!/usr/bin/env bash

today=$(date +%d_%m_%y)

# Tweak these to change file paths
mouse_path="$HOME/.mouse/mouse_$today.txt"
touchpad_path="$HOME/.mouse/touchpad_$today.txt"

#!!!!!!!
# Must change these ids 
# Use 'xinput list' and find the ids from there
mouse_id=12
touchpad_id=15

xinput test $mouse_id | awk -v filename="$mouse_path" 'BEGIN { 
    clicks[0]=0;
    clicks[1]=0;
    clicks[2]=0;
}
/^button release/ {
    clicks[$3 - 1]++;
    printf("L:%d\nM:%d\nR:%d\n", clicks[0], clicks[1], clicks[2]) > filename;
    close(filename);
}' &

xinput test $touchpad_id | awk -v filename="$touchpad_path" 'BEGIN { 
    clicks[0]=0;
    clicks[1]=0;
    clicks[2]=0;
}
/^button release/ {
    clicks[$3 - 1]++;
    printf("L:%d\nM:%d\nR:%d\n", clicks[0], clicks[1], clicks[2]) > filename;
    close(filename);
}'
