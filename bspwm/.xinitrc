xrdb -merge "$HOME/.Xresources"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap us -variant altgr-intl -option eurosign:5 -option caps:escape
xset r rate 320 32
xset s off -dpms

exec bspwm
