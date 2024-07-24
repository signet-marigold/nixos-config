MSGTAG="Volume"
CHANGE="1%"
SOUNDPATH=""

case $1 in
  -i)
    pactl set-sink-mute @DEFAULT_SINK@ false # Unmute
    pactl set-sink-volume @DEFAULT_SINK@ +${CHANGE}
  ;;
  -d)
    pactl set-sink-mute @DEFAULT_SINK@ false # Unmute
    pactl set-sink-volume @DEFAULT_SINK@ -${CHANGE}
  ;;
  -m)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
  ;;
esac

VOLUME=$( pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1 )
MUTE=$( pactl get-sink-mute @DEFAULT_SINK@ | sed -n -e 's/^.*ute: //p' )

if [[ "$MUTE" == "yes" ]]; then
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
