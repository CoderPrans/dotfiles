#!/bin/bash

DIALOG=${DIALOG=Xdialog}

if [$1 = ""] ; then
    echo "NO message provided"
else
    echo "YOU provided the arguments" "$1"
    $DIALOG --infobox "$1" 0 0

fi


