#!/bin/bash

WEBADDRESS=http://localhost

xset -dpms
xset s off
openbox-session &
start-pulseaudio-x11

x11vnc -display :0 -rfbauth /etc/.vncpasswd -bg -forever

if type chromium >/dev/null 2>&1
then
	BROWSER=chromium
else
	BROWSER=chromium-browser
fi

# Dont start browser until web server responding
while ! wget -O /dev/null $WEBADDRESS >/dev/null 2>&1
do
	sleep 3
done


$BROWSER --kiosk --incognito --disable-pinch --no-touch-pinch --overscroll-history-navigation=2 --no-first-run --no-default-browser-check $WEBADDRESS

