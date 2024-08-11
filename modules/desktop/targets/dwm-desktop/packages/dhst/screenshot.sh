SOUNDPATH=""
SCREENSHOT_DIR="$HOME/Screenshots"
FILENAME="$SCREENSHOT_DIR/$(date +%Y-%m-%d_%I-%M-%S)_ksnip.png"

ksnip --rectarea --saveto "$FILENAME"

# Play the backlight changed sound
if [[ $SOUNDPATH != "" ]]; then
  paplay --d=@DEFAULT_SINK@ ${SOUNDPATH}
fi

DUNST_ACTION=$(dunstify -a ksnip -i "$FILENAME" -A "view,View Screenshot" Screenshot "New screenshot")

case "$DUNST_ACTION" in
     "view")
           pqiv --hide-info-box "$FILENAME"
     ;;
esac

