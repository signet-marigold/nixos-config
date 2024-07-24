MSGTAG="Backlight"
CHANGE="5"
SOUNDPATH=""

case $1 in
  -i)
    xbacklight -perceived -fps 30 -inc ${CHANGE}
    ;;
  -d)
    xbacklight -perceived -fps 30 -dec ${CHANGE}
    ;;
esac

LIGHT=$( xbacklight -get )

# Show the volume notification
dunstify -a "changeBacklight" -u low -h string:x-dunst-stack-tag:$MSGTAG \
  -h int:value:"$LIGHT" "Backlight: ${LIGHT}%"

# Play the volume changed sound
if [[ $SOUNDPATH != "" ]]; then
  paplay --d=@DEFAULT_SINK@ ${SOUNDPATH}
fi
