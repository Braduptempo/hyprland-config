#!/bin/bash

THEMES_DIR="/usr/share/sddm/themes"
CONF_FILE="/etc/sddm.conf.d/90-theme.conf"

CHOICE=$(ls "$THEMES_DIR" | wofi --dmenu --prompt "Choose a SDDM Theme" --lines 10 --width 400)

if [ -z "$CHOICE"]; then 
	exit 0
fi

echo -e "[Theme]\nCurrent=$CHOICE" | pkexec tee "$CONF_FILE" > /dev/null

if [ -f /etc/sddm.conf ]; then
	pkexec sed -i "s/^Current=.*/Current=$CHOICE/" /etc/sddm.conf

	if command -v notify-send &> /dev/null; then
		notify-send "SDDM Theme" "Succesfully changed to: $CHOICE"
	fi
else
	if command -v notify-send &> /dev/null; then
		notify-send "Wrong" "/etc/sddm.conf not found!"
	fi
fi
