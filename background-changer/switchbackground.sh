#!/bin/bash

# Image size is 7680 x 1440
threemonitors="file:///home/dominikschmitt/Bilder/Krita/test4.png"

# Image size is 7680 x 3600
fourmonitors="file:///home/dominikschmitt/Bilder/Krita/test3.png"

#top screen
if [ -z "$(xrandr --verbose |grep -o 'HDMI-0 connected')" ]
    then
        echo "Monitor 4k not connected"
        screen4=false
else
	echo "Monitor 4k connected"
	screen4=true
fi

#middle
if [ -z "$(xrandr --verbose |grep -o 'DP-4 connected')" ]
    then
        echo "DP-4 not connected"
        screen1=false
else
	echo "DP-4 connected"
	screen1=true
fi

#left side
if [ -z "$(xrandr --verbose |grep -o 'DP-2 connected')" ]
    then
        echo "DP-2 not connected"
        screen2=false
else
	echo "DP-2 connected"
	screen2=true
fi

#right side
if [ -z "$(xrandr --verbose |grep -o 'DP-0 connected')" ]
    then
        echo "DP-0 not connected"
        screen3=false
else
	echo "DP-0 connected"
	screen3=true
fi

if [[ $screen1 == true && $screen2 == true && $screen3 == true && $screen4 == false ]]
then
	gsettings set org.gnome.desktop.background picture-uri $threemonitors
fi

if [[ $screen1 == true && $screen2 == true && $screen3 == true && $screen4 == true ]]
then
	gsettings set org.gnome.desktop.background picture-uri $fourmonitors
else
	#no valid config found using the smaller size
	gsettings set org.gnome.desktop.background picture-uri $threemonitors

fi
