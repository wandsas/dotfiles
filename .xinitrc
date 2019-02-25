
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


case "${1:-$(tty)}" in
    bspwm*|*tty1)
        exec bspwm
        ;;
    i3*|*tty2)
        exec bspwm
        ;;
    *)
        xterm -geometry 90x25-00
        ;;
esac

# vim:fenc=utf-8:ft=sh:
