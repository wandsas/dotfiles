#!/bin/sh

# Fonts
xset +fp ~/.fonts
xset fp+ /usr/share/fonts

# XScreensaver
xset s off
xset fp rehash
xset b off

# Mouse
xset m 15/10 1

# Keyboard
setxkbmap \
  -layout 'de(nodeadkeys)' \
  -option 'grp:shifts_toggle,compose:menui,terminate:ctrl_alt_bksp'
  -model  'pc105'

# Load user environment setup
[ -s ~/.Xresources ]    && xrdb -load ~/.Xresources
[ -s ~/.Xmodmap ]       && xmodmap ~/.Xmodmap
[ -s ~/.Xbindkeysrc ]   && xbindkeys -f ~/.Xbindkeysrc

# Color temperature
sct 4400 2>&- || :

xbacklight -set 15

# Hide your X mouse cursor when you do not need it
#unclutter -keystroke -idle 2 -noevents &

session=${1:-xfce}

case "${1:-$(tty)}" in
	(xfce*|*tty1)   exec startxfce4;;
	(sway*|*tty2)   exec sway;;
    (dwm*|*tty3)    exec dwm;;
esac
# if we got here, then exec failed
exit 1
