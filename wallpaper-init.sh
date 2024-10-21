#!/usr/bin/env bash

nohup $HOME/.local/bin/swww-daemon > $HOME/.local/share/.swwwlog 2>&1 &
hours=$(date +%H)
$HOME/.local/bin/swww img "$HOME/.local/share/sunpaper/images/cliffs/${hours}.jpg" -t none
# Run indefinitely
while true; do
    # Get the current seconds
    seconds=$(date +%S)

    # If it's the start of a new minute (00 seconds)
    if [ "$seconds" -eq "00" ]; then
        # Execute your command
        echo "Running command at full minute $(date +%H:%M:%S)"

        # Example: your swww command
        hours=$(date +%H)
        $HOME/.local/bin/swww img "$HOME/.local/share/sunpaper/images/cliffs/${hours}.jpg" --transition-type wipe --transition-angle 220 > $HOME/.cache/swww.log 2>&1 &

        # Wait for the next minute to prevent multiple executions in the same minute
        sleep 60
    fi

    # Sleep for a second before checking again
    sleep 1
done
