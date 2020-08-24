#!/bin/sh

path="$(pwd)/$1"

[ "$1" ] && feh --bg-center "$path" && echo $path > ~/.local/mybg 
