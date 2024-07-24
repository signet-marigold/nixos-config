
MSGTAG="Volume"
CHANGE="1%"
SOUNDPATH=""

case $1 in
  -i)
    pactl set-sink-mute @DEFAULT_SINK@ 0 # Unmute
    pactl set-sink-volume @DEFAULT_SINK@ +${CHANGE}
  ;;
  -d)
    pactl set-sink-mute @DEFAULT_SINK@ 0 # Unmute
    pactl set-sink-volume @DEFAULT_SINK@ -${CHANGE}
  ;;
  -m)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
  ;;
esac

SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
VOLUME=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
MUTE=$( pactl get-sink-mute @DEFAULT_SINK@ | grep '^Mute:' | tail -n 1 | sed -n -e 's/^.*ute: //p' )

if [[ $volume == 0 || "$MUTE" == "yes" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$MSGTAG "Volume muted"
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$MSGTAG \
    -h int:value:"$VOLUME" "Volume: ${VOLUME}%"
fi

# Play the volume changed sound
if [[ $SOUNDPATH != "" ]]; then
  paplay --d=@DEFAULT_SINK@ ${SOUNDPATH}
fi
