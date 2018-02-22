#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'Kein Parameter gefunden. Exit.'
    exit 1
fi

if [ -z "$1" ]
  then
    echo "Empty argument supplied"
    exit 1
fi
#Input ist vorhanden

bildschirmselected="$1"

if [[ $bildschirmselected -eq 1 ]] ; then
    key1="$(xrandr --verbose |grep DP-0 -A 5 |grep Brightness |grep -o '[0-9].*')"
    result="0.5"
    if [ $(bc <<< "$result <= $key1") -eq 1 ]
    then    # yes dp0 ist hell mach dunkel
	    xrandr --output DP-0 --brightness 0.2
    else    # nope ist dunkel mach hell
	    xrandr --output DP-0 --brightness 1.0
    fi
elif [[ $bildschirmselected -eq 2 ]] ; then
    key1="$(xrandr --verbose |grep DP-2 -A 5 |grep Brightness |grep -o '[0-9].*')"
    result="0.5"
    if [ $(bc <<< "$result <= $key1") -eq 1 ]
    then    # yes dp0 ist hell mach dunkel
	    xrandr --output DP-2 --brightness 0.2
    else    # nope ist dunkel mach hell
	    xrandr --output DP-2 --brightness 1.0
    fi
elif [[ $bildschirmselected -eq 3 ]] ; then
    key1="$(xrandr --verbose |grep DP-4 -A 5 |grep Brightness |grep -o '[0-9].*')"
    result="0.5"
    if [ $(bc <<< "$result <= $key1") -eq 1 ]
    then    # yes dp0 ist hell mach dunkel
	    xrandr --output DP-4 --brightness 0.2
    else    # nope ist dunkel mach hell
	    xrandr --output DP-4 --brightness 1.0
    fi
elif [[ $bildschirmselected -eq 4 ]] ; then
    if [ -z "$(xrandr --verbose |grep -o 'HDMI-0 connected')" ]
    then
        echo "Bildschirm nicht connected"
        exit 1
    fi
    key1="$(xrandr --verbose |grep HDMI-0 -A 5 |grep Brightness |grep -o '[0-9].*')"
    result="0.5"
    if [ $(bc <<< "$result <= $key1") -eq 1 ]
    then    # yes dp0 ist hell mach dunkel
	    xrandr --output HDMI-0 --brightness 0.2
    else    # nope ist dunkel mach hell
	    xrandr --output HDMI-0 --brightness 1.0
    fi
else
    echo "No valid screen found"
fi


