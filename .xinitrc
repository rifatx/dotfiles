#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap tr

# xrandr profiles

# single monitor
# xrandr -s 1920x1080

# dual monitor - hd monitor right of main display
xrandr --output eDP-1 --mode 1920x1080 --output DP-1 --mode 1920x1080 --right-of eDP-1

picom &
xautolock -time 10 -locker slock &
# dwmbar &
dwmblocks &
xbindkeys
xset r rate 200 30
libinput-gestures &
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
gsettings set org.gnome.desktop.interface gtk-theme prefer-dark
exec dwm

