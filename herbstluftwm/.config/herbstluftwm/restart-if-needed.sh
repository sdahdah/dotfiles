#!/usr/bin/env bash

pkill -f .config/herbstluftwm/hook_panel.sh
killall stalonetray

feh --bg-tile ~/Pictures/Wallpaper/pattern_146.gif ~/Pictures/Wallpaper/pattern_146.gif

# find the panel
panel=~/.config/herbstluftwm/hook_panel.sh
# panel=~/.config/herbstluftwm/panel.sh
[ -x "$panel" ] || panel=/etc/xdg/herbstluftwm/panel.sh
for monitor in $(herbstclient list_monitors | cut -d: -f1) ; do
    # start it on each monitor
    /usr/bin/env bash "$panel" "$monitor" &
done

sleep 1
stalonetray &
