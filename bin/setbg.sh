#!/bin/sh

path="$(pwd)/$1"

[ "$1" ] && feh --bg-fill "$path" && echo $path > ~/.local/mybg 
