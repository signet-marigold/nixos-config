SOUNDPATH=""
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
FILENAME="$SCREENSHOT_DIR/$(date +%Y-%m-%d_%I-%M-%S)_ksnip.png"

KSNIP_RET=$(ksnip --rectarea --saveto "$FILENAME")

# Exit early if no screenshot was taken
if [[ $KSNIP_RET == "" ]]; then
  exit
fi

# Play the screenshot taken sound
if [[ $SOUNDPATH != "" ]]; then
  paplay --d=@DEFAULT_SINK@ ${SOUNDPATH}
fi

DUNST_ACTION=$(dunstify -a ksnip -i "$FILENAME" -A "view,View Screenshot" Screenshot "New screenshot")

case "$DUNST_ACTION" in
     "view")
           pqiv --hide-info-box "$FILENAME"
     ;;
esac
