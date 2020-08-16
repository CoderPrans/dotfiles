#!/bin/bash

# take screenshot
import -window root /tmp/screenshot.png

case "$1" in
    "")
        # blur it 
        convert /tmp/screenshot.png -blur 0x5 \
            "$HOME/.config/i3/token.png" -gravity center \
            -composite /tmp/screenshotblur.png
        rm /tmp/screenshot.png
        ;;
    -d)
        # blur it
        convert /tmp/screenshot.png -scale 10% -scale 1000% \
            "$HOME/.config/i3/token.png" -gravity center \
            -composite /tmp/screenshotblur.png
        rm /tmp/screenshot.png
        ;;
esac;

# lock the screen
i3lock -fe -i /tmp/screenshotblur.png

# sleep 1 adds a small delay to prevent possible race condition with suspend
sleep 1

exit 0
