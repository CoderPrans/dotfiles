#!/bin/sh

if [ -n "$1" ]; then
    surf duckduckgo.com/?q="$1" &
else
    echo "Usage: duck.sh [searchterm]"
fi
