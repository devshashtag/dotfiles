#!/usr/bin/env bash

run() {
  if ! pgrep "$1" ; then
    "$@"&
  fi
}

# run nm-applet
# run dbus-launch update-checker
# run light-locker
# run pulseaudio -D
# run compton --shadow-exclude '!focused'
# run xcape -e 'Super_L=Super_L|Shift_L|p'
# run /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
# run thunar --daemon
# run xfce4-power-manager
# run pa-applet
# run xrdb merge ~/.Xresources
# run xfsettingsd
# run gnome-keyring-daemon
# run urxvtd

# compositor
# run picom
# network manager
run nm-applet
# clipboard manager
run copyq
# sound system
# run pluseaudio -D
# desktop wallpaper
# run nitrogen --restore

setxkbmap -layout us,ir
setxkbmap -option 'grp:alt_shift_toggle'
