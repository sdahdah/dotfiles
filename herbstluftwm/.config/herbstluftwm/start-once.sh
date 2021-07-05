#!/usr/bin/env bash

xrdb -merge ~/.Xresources 
numlockx
xset -b  # Needed here or xinitrc?
xbindkeys
dunst &
tresorit --hidden &
cbatticon &
nm-applet &
pasystray &
# redshift-gtk &
# redshift -l 45.5017:-73.5673 &  # Workaround for geoclue
xfce4-clipman &
caffeine &
# xcompmgr -a & # Basic config to avoid bugs
# xcompmgr &
# xcompmgr -c -C & # Full client side compositing
xcompmgr -n &
secret-tool lookup 'keepass' 'default' | /usr/bin/keepassxc --pw-stdin ~/Tresors/KeePass/personal.kdbx
