#!/bin/bash

xset -dpms
xset s off
openbox-session &
start-pulseaudio-x11

x11vnc -display :0 -rfbauth /etc/.vncpasswd -bg -forever

chromium --kiosk --incognito --disable-pinch --no-touch-pinch --overscroll-history-navigation=2 --no-first-run --no-default-browser-check http://localhost:3000
