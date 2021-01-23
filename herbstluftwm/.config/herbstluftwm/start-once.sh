#!/usr/bin/env bash

numlockx
dunst &
tresorit --hidden &
cbatticon &
nm-applet &
pasystray &
redshift-gtk &
xfce4-clipman &
# xcompmgr -c -r 0 -o 100 &
caffeine &
# picom --backend glx --vsync --no-use-damage --experimental-backends &
# picom --backend glx --vsync --no-use-damage &
# picom --no-use-damage &
xcompmgr -a &
secret-tool lookup 'keepass' 'default' | /usr/bin/keepassxc --pw-stdin ~/Tresors/KeePass/personal.kdbx
