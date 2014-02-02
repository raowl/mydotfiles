# Graphical audio volume control using amixer and notify-osd(leolik customizable patched version).
# made by raowl (raowls@gmail.com)

#example fluxbox keys

#Mod1 Mouse4         :ExecCommand ~/amixer.sh up 
#Mod1 Mouse5         :ExecCommand ~/amixer.sh down
#Control s           :ExecCommand ~/amixer.sh togglemute

#!/bin/sh

# User's Settings
MASTER_CONTROL="Master"
OTHER_CONTROLS="PCM"

STEP=3

# Script's Settings
STATE_FILE="/tmp/volume.state"


getVolume ()
{
    amixer get $1|tail -n1|sed -r 's/.*\[(.*)%\].*/\1/'
}


setVolume () {
       for i in $OTHER_CONTROLS; do
          if [ $1 -eq 0 ]; then
            amixer set $i 0 > /dev/null;
          else
              if [ $(getVolume $i) -eq 0 ]; then
                amixer set $i 100% > /dev/null;
            fi
          fi
       done
    amixer set $MASTER_CONTROL $1"%">/dev/null;
}


volumeUp ()
{
    VOL=$(getVolume $MASTER_CONTROL)
    [[ $VOL -ge 100 ]] && exit 0
    setVolume $((VOL + $STEP))
}


volumeDown ()
{
    VOL=$(getVolume $MASTER_CONTROL)
    [[ $VOL -le 0 ]] && exit 0
    setVolume $((VOL - $STEP))
}


mute () { echo $(getVolume $MASTER_CONTROL) > $STATE_FILE;setVolume 0; }
unmute () { setVolume $(cat $STATE_FILE);rm -f $STATE_FILE; }


# Interfaces
up () { volumeUp; osd; }
down () { volumeDown; osd; }
togglemute () { [[ -f "${STATE_FILE}" ]] && unmute || mute; osd;}
get () { getVolume $MASTER_CONTROL; }
osd ()
{
    VOL=$(getVolume $MASTER_CONTROL)
    if [ $VOL -gt 70 ]; then
         notify-send " " -i notification-audio-volume-high -h int:value:$VOL -h string:x-canonical-private-synchronous:volume &
    elif [ $VOL -gt 30 ]; then
        notify-send " " -i notification-audio-volume-medium -h int:value:$VOL -h string:x-canonical-private-synchronous:volume &
    elif [ $VOL -gt 0 ]; then
        notify-send " " -i notification-audio-volume-low -h int:value:$VOL -h string:x-canonical-private-synchronous:volume &
    elif [ $VOL = 0 ]; then
    notify-send " " -i notification-audio-volume-muted -h int:value:$VOL -h string:x-canonical-private-synchronous:volume &
    fi
}

$@
