#!/usr/bin/sh 

echo "$(free --mebi | sed -n '2{p;q}' | awk '{print ($3/$2)*100}' | cut -c1-2)%"
