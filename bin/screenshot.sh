#!/bin/bash

# take screenshot
import -window root $HOME/Pictures/Screens/shot@$( date '+%m-%d-%y_%H:%M:%S').png

# notify 
notify-send 'Screen Captured'

