#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Available Styles
# >> Created and tested on : rofi 1.6.0-1
#
# column_circle     column_square     column_rounded     column_alt
# card_circle     card_square     card_rounded     card_alt
# dock_circle     dock_square     dock_rounded     dock_alt
# drop_circle     drop_square     drop_rounded     drop_alt
# full_circle     full_square     full_rounded     full_alt
# row_circle      row_square      row_rounded      row_alt

theme="card_square"
dir="$HOME/.config/rofi/powermenu"

# random colors
#styles=($(ls -p --hide="colors.rasi" $dir/styles))
#color="${styles[$(( $RANDOM % 8 ))]}"

# comment this line to disable random colors
#sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

# comment these lines to disable random style
#themes=($(ls -p --hide="powermenu.sh" --hide="styles" --hide="confirm.rasi" --hide="message.rasi" $dir))
#theme="${themes[$(( $RANDOM % 24 ))]}"

# dark
ALPHA="#21242B9f"
BG="#0000009f"
FG="#FFFFFFff"
SELECT="#101010ff"

# light
#ALPHA="#00000000"
#BG="#FFFFFFff"
#FG="#000000ff"
#SELECT="#f3f3f3ff"

# accent colors
COLORS=('#EC7875' '#61C766' '#FDD835' '#42A5F5' '#BA68C8' '#4DD0E1' '#00B19F' \
		'#FBC02D' '#E57C46' '#AC8476' '#6D8895' '#EC407A' '#B9C244' '#6C77BB')
ACCENT="${COLORS[$(( $RANDOM % 14 ))]}ff"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  #86ACE0;
	}
EOF

uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/$theme"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown) systemctl poweroff
#		ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
#			systemctl poweroff
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
#        else
#			msg
#        fi
        ;;
    $reboot) systemctl reboot
#		ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
#			systemctl reboot
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
#        else
#			msg
#        fi
        ;;
    $lock)
		if [[ -f /usr/bin/i3lock ]]; then
			i3lock
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $suspend) systemctl suspend
#		ans=$(confirm_exit &)
#		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
#			mpc -q pause
#			amixer set Master mute
#			systemctl suspend
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
#        else
#			msg
#        fi
        ;;
    $logout) exit 0
#		ans=$(confirm_exit &)
#	2	if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
#			if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
#				openbox --exit
#			elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
#				bspc quit
#			elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
#				i3-msg exit
#			fi
#		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
#			exit 0
#        else
#			msg
#        fi
        ;;
esac
