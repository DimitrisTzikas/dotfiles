#!/bin/sh

# Set brightness via xbrightness when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day=69
brightness_transition=30
brightness_night=10
# Set fade time for changes to one minute
fade_time=60000

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			xbacklight -set $brightness_night -time $fade_time
			;;
		transition)
			xbacklight -set $brightness_transition -time $fade_time
			;;
		daytime)
			xbacklight -set $brightness_day -time $fade_time
			;;
	esac
fi
