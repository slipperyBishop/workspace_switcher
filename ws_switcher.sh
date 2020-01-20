#!/bin/bash
# workspace changer, jumpts to specific workspaces
# 	- enables user to select the current workspace and will
#		jump to the last workspace that was active 


# file that holds the last workspace num
LAST_WS_PATH=/tmp/last_workspace_num

# mappings from workspace names to numbers
MUSIC=9
BROWSER=10
CODE=11

get_last_desktop_num () {
	if [ -e $LAST_WS_PATH ]; then
		LDN=$(cat "$LAST_WS_PATH")	
		case "$LDN" in

			# if it is a num between 0 and 9 return the num
			[0-9]*) return $LDN
			;;

			# if it is anything else then remove the file
			*) rm $LAST_WS_PATH 
			;;
		esac
	fi

	return -1
}

# get the current workspace number
DESK_NUM=$(xdotool get_desktop)	

get_last_desktop_num
LAST_DESK_NUM=$?

case "$1" in
	# return to the last workspace
	LAST) 
		NEW_WORKSPACE=$LAST_DESK_NUM		
		;;
	# go to the music workspace
	MUSIC) 
		NEW_WORKSPACE=$MUSIC		
		;;
	# go to the browser workspace
	BROWSER)
		NEW_WORKSPACE=$BROWSER
		;;
	# go to the code workspace
	CODE)
		NEW_WORKSPACE=$CODE
		;;
	# go to a numbered workspace
	[0-9])
		NEW_WORKSPACE=$1
		;;
	*)
		exit -1
		;;
esac

# switch to the last workspace if we are already on $NEW_WORKSPACE
if [ $NEW_WORKSPACE -eq $DESK_NUM ]; then
	NEW_WORKSPACE=$LAST_DESK_NUM		
fi

# set the last workspace before we switch to another
echo $DESK_NUM > $LAST_WS_PATH

wmctrl -s $NEW_WORKSPACE 

# if guake was open 
guake --hide 
