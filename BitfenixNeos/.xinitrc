export COLOR1='#d32f2f'
export VISUAL='/usr/bin/vim'
export EDITOR='/usr/bin/vim'
export QT_QPA_PLATFORMTHEME=gtk3
dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY &
exec mplayer /home/dimitris/.sounds/windows98.m4a </dev/null >/dev/null 2>&1 &
xrdb ~/.Xresources
xmodmap ~/.Xmodmap
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx-autostart &
sleep 1 &&notify-send "Welcome Back!" &
exec xmonad
