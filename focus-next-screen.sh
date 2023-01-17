#!/bin/bash

screen_width=$(xdpyinfo | awk '/dimensions:/ { print $2; exit }' | cut -d"x" -f1)
display_width=$(xdotool getdisplaygeometry | cut -d" " -f1)

current_x=$(xdotool getmouselocation --shell | head -1 | cut -d"=" -f 2)

new_x=$((current_x + display_width))
new_y=$(xdotool getmouselocation --shell | head -2 | tail -1 | cut -d"=" -f 2)

if [ "$new_x" -gt "$screen_width" ]; then
  new_x=$(($new_x - $screen_width))
fi

new_window_id=$(xdotool mousemove "$new_x" "$new_y" getmouselocation | cut -d" " -f 4 | cut -d":" -f 2)

if [[ $new_window_id == ?(-)+([[:digit:]]) ]]; then
  xdotool windowfocus "$new_window_id"
fi
