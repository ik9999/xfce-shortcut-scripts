#!/bin/bash
# Minimizes window and focuses a window under the cursor

window_id=$(xdotool getactivewindow)
xdotool windowminimize "$window_id"
new_window_id=$(xdotool getmouselocation | cut -d" " -f 4 | cut -d":" -f 2)
if [[ $new_window_id == ?(-)+([[:digit:]]) ]]; then
  xdotool windowfocus "$new_window_id"
fi
