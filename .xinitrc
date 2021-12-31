#!/bin/sh

info () { printf "\033[1m\033[92mINFO:\033[m $@\n"; exit 1; }

check_bin () { type -P "$1" &>/dev/null; }

check_bin xrdb       || info "xrdb not available."
check_bin xset       || info "xset not available."
check_bin xbacklight || info "xbacklight not available."
check_bin setxkbmap  || info "setxkbmap not available."
check_bin sct        || info "sct not available."

# Fonts
xset +fp ~/.fonts
xset fp+ /usr/share/fonts

# XScreensaver
xset s off
xset fp rehash
xset b off

# Screen color temperature
sct 4400
xbacklight -set 15

# Mouse
xset m 15/10 1

# Hide your X mouse cursor when you do not need it
unclutter -keystroke -idle 2 -noevents &

# Keyboard
setxkbmap \
  -layout 'de(nodeadkeys)' \
  -option 'grp:shifts_toggle,compose:menui,terminate:ctrl_alt_bksp'
  -model  'pc105'

# Load user environment setup
[ -s ~/.Xresources ]    && xrdb -load ~/.Xresources
[ -s ~/.Xmodmap ]       && xmodmap ~/.Xmodmap
[ -s ~/.Xbindkeysrc ]   && xbindkeys -f ~/.Xbindkeysrc

#exec /usr/bin/pipewire &
exec /usr/libexec/polkit-gnome-authentication-agent-1
exec nm-applet --indicator
exec dwmstatus &
dbus-launch --exit-with-session dwm

exit 1
