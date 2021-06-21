#!/bin/sh

# Fonts
xset fp+ /usr/local/share/fonts
xset +fp $HOME/.fonts


xset s off
xset fp rehash
xset b off
xset m 15/10 1


# Keyboard layout
setxkbmap \
  -layout 'de(nodeadkeys)' \
  -option 'grp:shifts_toggle,compose:menui,terminate:ctrl_alt_bksp'
  -model  'pc105'


[ -s ~/.Xresources ] && xrdb -load ~/.Xresources
[ -s ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -s ~/.xbindkeysrc ] && xbindkeys -f ~/.xbindkeysrc


# Color temperature
sct 4400 2>&- || :

xbacklight -set 15

unclutter -keystroke -idle 2 -noevents &


#exec dbus-launch --exit-with-session runsvdir-wandsas -P $HOME/service
# GNOME Keyring
#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
#export GPG_AGENT_INFO SSH_AUTH_SOCK
#dbus-update-activation-environment --all DISPLAY

exec startxfce4
# Sway
#XKB_DEFAULT_LAYOUT=de exec sway -V >> ~/.cache/sway/log-$(date +'%F-%k-%M-%S') 2>&1
