# ~/.xinitrc wandsas start xserver

setxkbmap \
    -model "pc105" \
    -layout "de" \
    -variant "nodeadkeys" \
    -option "terminate:ctrl_alt_bksp"

if [ -s ~/.config/Xresources ]; then
    xrdb -load ~/.config/Xresources
fi

xsetroot -cursor_name left_ptr
xrandr --dpi 96         # set DPI
xset r rate 300 80      # key repeat
xset m 4 1              # fast mouse
xset s noblank          # don't blank the video device
xset s off              # disable screensaver
xset -b                 # disable bell
xset -dpms              # disable DPMS (Energy Star) features

#[ -e "$SXHKD_FIFO" ] && rm $SXHKD_FIFO
#mkfifo $SXHKD_FIFO
#sxhkd -s $SXHKD_FIFO &

#if ! tmux has-session -t sxhkd 2> /dev/null ; then
#	tmux new-session -s sxhkd -d
#	printf '%s\n' '. "$XDG_CONFIG_HOME"/sxhkd/functions' | tmux load-buffer -
#	tmux paste-buffer -t sxhkd
#fi

#exec startfluxbox
#exec bspwm
exec i3
