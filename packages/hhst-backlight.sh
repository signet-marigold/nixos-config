MSGTAG="Backlight"
CHANGE="5"
SOUNDPATH=""

LIGHT=$( xbacklight -get )

case $1 in
  -i)
    xbacklight -perceived -fps 30 -inc ${CHANGE}
    ;;
  -d)
    if [[ $LIGHT > 1 ]]; then
      xbacklight -perceived -fps 30 -dec ${CHANGE}
    fi
    ;;
esac

LIGHT=$( xbacklight -get )

if [[ $LIGHT < 1 ]]; then
  xbacklight -set 1
  LIGHT=1
fi

# Show the volume notification
dunstify -a "changeBacklight" -u low -h string:x-dunst-stack-tag:$MSGTAG \
  -h int:value:"$LIGHT" "Backlight: ${LIGHT}%"

# Play the volume changed sound
if [[ $SOUNDPATH != "" ]]; then
  paplay --d=@DEFAULT_SINK@ ${SOUNDPATH}
fi
