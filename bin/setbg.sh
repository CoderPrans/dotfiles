#!/bin/sh

path="$(pwd)/$1"

[ "$1" ] && feh --bg-scale "$path" && echo $path > ~/.local/mybg 
