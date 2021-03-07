# https://www.reddit.com/r/unixporn/comments/4u0onh/discovery_super_responsive_lemonbar_on/

# TODO: Moving window to other workspace does not trigger workspace update!!!

monitor=${1:-0}
geometry=( $(herbstclient monitor_rect "$monitor") )
if [ -z "$geometry" ] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi
x=${geometry[0]}
y=${geometry[1]}
panel_width=${geometry[2]}
panel_height=22
selfg='#101010'
bgcolor=$(herbstclient get frame_border_normal_color)
selbg=$(herbstclient get window_border_active_color)
sep="%{F$selbg}|%{F-}"
wnd_title=`herbstclient get_attr clients.focus.title | cut -c 1-80`

function getsplit() {
    local rawsplit=`herbstclient layout | awk '/FOCUS/{print $2}' | rev | cut -c 2- | rev`
    # local rawsplit=`herbstclient get_attr tags.focus.tiling.root.split_mode`
    case $rawsplit in
        'horizontal')
            # echo -e -n "[H]"
            # echo -e -n "\ufc26"
            # echo -e -n "\uf5c9"
            # echo -e -n "\ufb1f"
            echo -n ""
            ;;
        'vertical')
            # echo -e -n "[V]"
            # echo -e -n "\ufc27"
            # echo -e -n "\uf5d1"
            # echo -e -n "\ufb20"
            echo -n "響"
            ;;
        'grid')
            # echo -e -n "[G]"
            # echo -e -n "\ufa6f"
            # echo -e -n "\uf5ca"
            # echo -e -n "\ufc56"
            # echo -e -n "\ufa6d"
            # echo -e -n "\uf5c6"
            echo -n "﩯"
            ;;
        'max')
            # echo -e -n "[M]"
            # echo -e -n "\ufa6a"
            # echo -e -n "\uf5cd"
            # echo -e -n "\ue25d"
            # echo -n ""
            # echo -n ""
            # echo -n ""
            # echo -n ""
            echo -n "ﱢ"
            # echo -n "ﱡ"
            # echo -e -n "\ufc61"
            ;;
    esac
}

split=$(getsplit)

# Find a better way to do this
wm_infos=""
TAGS=( $(herbstclient tag_status $monitor) )
for i in "${TAGS[@]}" ; do
    case ${i:0:1} in
        '#')  # Tag viewed on monitor and is focused
            BG=$selbg
            FG=$selfg
            ;;
        '+')  # Tag viewed on monitor and is not focused
            BG="#9CA668"
            FG="#141414"
            ;;
        ':')  # Tag not empty
            BG=""
            FG="#ffffff"
            ;;
        '!')  # Tag contains urgent window
            BG="#FF0675"
            FG="#141414"
            ;;
        '-')  # Tag viewed on different monitor and is focused
            BG=""
            FG=$selbg
            ;;
        *)  # .: tag is empty, %: tag is viewed on different monitor and is not focused
            BG=""
            FG="#ababab"
            ;;
    esac
    ICON="%{A:herbstclient focus_monitor $monitor && herbstclient use ${i:1:2}:} ${i:1:2} %{A}"
    wm_infos="${wm_infos}%{F${FG}}%{B${BG}}${ICON}%{F-}%{B-}"
shift
done

# Format the Panel
herbstclient -i |
while read line; do

    case $line in
    layout_changed*)
        # split=`herbstclient layout | awk '/FOCUS/{print $2}' | rev | cut -c 2- | rev`
        split=$(getsplit)
        ;;

    window_title_changed*)
        wnd_title=`echo $line | awk '{$1=$2=""; print $0}' | cut -c 3-80`
        # split=`herbstclient layout | awk '/FOCUS/{print $2}' | rev | cut -c 2- | rev`
        split=$(getsplit)
        ;;

    focus_changed*)
        wnd_title=`echo $line | awk '{$1=$2=""; print $0}' | cut -c 3-80`
        # split=`herbstclient layout | awk '/FOCUS/{print $2}' | rev | cut -c 2- | rev`
        split=$(getsplit)
        # Copy-pasted
        wm_infos=""
        TAGS=( $(herbstclient tag_status $monitor) )
        for i in "${TAGS[@]}" ; do
            case ${i:0:1} in
                '#')
                    BG=$selbg
                    FG=$selfg
                    ;;
                '+')
                    BG="#9CA668"
                    FG="#141414"
                    ;;
                ':')
                    BG=""
                    FG="#ffffff"
                    ;;
                '!')
                    BG="#FF0675"
                    FG="#141414"
                    ;;
                '-')
                    BG=""
                    FG=$selbg
                    ;;
                *)
                    BG=""
                    FG="#ababab"
                    ;;
            esac
            ICON="%{A:herbstclient focus_monitor $monitor && herbstclient use ${i:1:2}:} ${i:1:2} %{A}"
            wm_infos="${wm_infos}%{F${FG}}%{B${BG}}${ICON}%{F-}%{B-}"
        done
        ;;

    tag_changed*)
        # split=`herbstclient layout | awk '/FOCUS/{print $2}' | rev | cut -c 2- | rev`
        split=$(getsplit)
        wm_infos=""
        TAGS=( $(herbstclient tag_status $monitor) )
        for i in "${TAGS[@]}" ; do
        # if [[ $i != *8 ]]; then
            case ${i:0:1} in
                '#')
                    BG=$selbg
                    FG=$selfg
                    ;;
                '+')
                    BG="#9CA668"
                    FG="#141414"
                    ;;
                ':')
                    BG=""
                    FG="#ffffff"
                    ;;
                '!')
                    BG="#FF0675"
                    FG="#141414"
                    ;;
                '-')
                    BG=""
                    FG=$selbg
                    ;;
                *)
                    BG=""
                    FG="#ababab"
                    ;;
            esac
            ICON="%{A:herbstclient focus_monitor $monitor && herbstclient use ${i:1:2}:} ${i:1:2} %{A}"
            wm_infos="${wm_infos}%{F${FG}}%{B${BG}}${ICON}%{F-}%{B-}"
        # fi
        shift
        done
        ;;


    # REFRESH_PANEL*BIG*)
    #     mail_=$(~/.mutt/new_mail.sh 2> /dev/null)
    #     t_="\ue015 "$(date +"%l:%M" | sed 's/ //')
    #     batt_="  $(~/run/herbstluftwm/panel-scripts/battery.sh) "
    # # ...
    #     ;;


    # REFRESH_PANEL*SMALL*)
    #     wifi_=`~/run/herbstluftwm/panel-scripts/wireless.sh`

    #     if [[ `mpc status | grep playing` != "" ]]; then
    #     mpc_=" \uE0EC "
    #     else
    #     mpc_=""
    #     fi
    #     ;;
    # esac


    REFRESH_PANEL*BIG*)
        # t_="\ue015 "$(date +"%{F#efefef}%H:%M%{F#909090},  %Y-%m-%{F#efefef}%d" | sed 's/ //')
        # t_=$(date +"%{F#efefef}%H:%M:%S%{F#909090}, %Y-%m-%{F#efefef}%d")
        # time=$(date +"%{F#efefef}%H:%M%{F#909090}, %Y-%m-%{F#efefef}%d")
        time=$(date +"%{F#909090}%Y-%m-%{F#efefef}%d, %H:%M")
        ;;


    REFRESH_PANEL*SMALL*)
        ;;
    esac

    echo -e "%{S${monitor}}%{l}${wm_infos} ${sep} ${split} ${wnd_title}%{r}${sep} \uf5ef ${time} ${sep} "

done | lemonbar -B "#ff000000" \
                -o -5 \
                -f "IBM Plex Mono Text:style=Text,Regular:size=10" \
                -o 0 \
                -f "BlexMono Nerd Font Mono:style=Text,Regular:size=14" \
                -g "${panel_width}x${panel_height}+${x}+${y}" 2> /dev/null | sh &
                # -f "Symbols Nerd Font:style=2048-em" \

# -f "Source Code Pro:style=Regular:size=10" \
# -f "Symbols Nerd Font:style=1000-em:size=10" \
# done | lemonbar -B "#ff000000" \
#                 -o -5 \
#                 -f "IBM Plex Mono Text:style=Text,Regular:size=10" \
#                 -o 0 \
#                 -f "BlexMono Nerd Font Mono:style=Text,Regular:size=16" \
#                 -g "${panel_width}x${panel_height}+${x}+${y}" 2> /dev/null | sh &


herbstclient pad $monitor $panel_height

# Emit hooks to keep it updating
while true; do
    herbstclient emit_hook REFRESH_PANEL BIG
    for i in {1..10}; do
    herbstclient emit_hook REFRESH_PANEL SMALL
    sleep 1
    done
done
# done &

# herbstclient layout | awk '/FOCUS/{print $2}' | rev | cut -c 2- | rev
