export COLOR1='#d32f2f'
export VISUAL='vim'
export EDITOR='vim'
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
sleep 1 && notify-send "Welcome Back!" &
exec mplayer /home/dimitris/.sounds/windows98.m4a </dev/null >/dev/null 2>&1 &
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'
ibus-daemon -drx &
exec xmonad
