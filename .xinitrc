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
unclutter -keystroke -idle 2 -noevents &

##### SESSION CONFIGURATION #####

# Start runit service of local user, inform dbus.
#exec dbus-launch --exit-with-session runsvdir-wandsas -P ~/service

# Init gnome-keyring and inform dbus.
eval "$(gnome-keyring-daemon --components=pkcs11,secrets) --start"
export GNOME_KEYRING_PID GNOME_KEYRING_SOCKET
# gpg-agent starts as runit user service
#export GPG_AGENT_INFO SSH_AUTH_SOCK 
dbus-update-activation-environment --all DISPLAY
/usr/libexec/xfce-polkit &

### SESSION CONFIGURATION ### 

case "${1:-$(tty)}" in
    xfce4|*tty1)
        exec startxfce4;;
    sway|*tty2)
        XKB_DEFAULT_LAYOUT=de exec sway;;
        #XKB_DEFAULT_LAYOUT=de exec sway -V >> ~/.cache/sway/log-$(date +'%F-%k-%M-%S') 2>&1;;
    *)
        xterm -geometry 80x24-0-0
esac
