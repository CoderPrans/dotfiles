#!/bin/bash

DIALOG=${DIALOG=Xdialog}

if [ -z "$1" ] ; then
    echo "NO message provided"
else
    echo "Message: " "$1"
    $DIALOG --infobox "$1" 0 0

fi


