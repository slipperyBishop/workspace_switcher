# workspace switcher
This is a script I wrote to switch between workspaces in gnome 

```
Dependencies: xdotool, wmctlr
```
I also use dconf to set some of the keybindings and tweaks to set the number of workspaces.

# Easy installation
use 'dconf load / < settings.ini' 
This should set everything up perfectly, if not follow the steps below. 

# configuration
	1. move ws_switcher.sh into a folder that is in the PATH variable
	2. use dconf and go to '/org/gnome/shell/keybindings/switch-to-application-9', now set each 'switch-to-application-x' option to empty 
	3. open up tweaks 
		- go to workspaces and set 'Number of Workspaces' to 12, go to extensions
		- find dash to dock and click on the settings go to 'behavior' and disable the setting 'Use keyboard shortcuts to activate apps'
	4. open up keyboard shortcuts
		- go to the system section and disable 'show the notification list'
		- create custome keybindings at the very bottom:
			- for workspaces 0-8 using command 'ws_switcher.sh [num]' and keybinding 'Super+[num]`
			- for workspace 9 using command 'ws_switcher.sh MUSIC' and keybinding 'Super+m'
			- for workspace 10 using command 'ws_switcher.sh BROWSER' and keybinding 'Super+b'
			- for workspace 11 using command 'ws_switcher.sh CODE' and keybinding `Super+c`
			- for switching to last workspace directly using command 'ws_switcher.sh LAST' and keybinding 'Super+t'
	5. open up dnconf and go to '/org/gnome/desktop/wm/keybindings/' 
		- set 'move-to-workspace-[num]' to 'Super+Shift+[num] for workspaces 1-9 
		- and set 'move-to-workspace-9' to 'Super+Shift+m'
		- and set 'move-to-workspace-10' to 'Super+Shift+b' 
		- and set 'move-to-workspace-11' to 'Super+Shift+c'
