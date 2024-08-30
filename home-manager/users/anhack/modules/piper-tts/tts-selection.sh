# Text to speech on the most recent text selection

MSGTAG="PiperTTS"
basedir="/home/anhack/.models/piper/"
model="en_US-lessac-high.onnx"
config="en_US-lessac-high.onnx.json"


# Also accepts stdin as input
if [ -z "$1" ]; then
  in="$(xclip -o)"
else
  in="$1"
fi
# Remove extra spaces
#in=$(echo $in | xargs echo -n)
# Remove extra spaces, Remove capital letters
in=$(echo $in | tr -s " " | tr '[:upper:]' '[:lower:]')
# Remove non ascii characters
#in=$(echo $in | iconv -f utf-8 -t ascii)

length=${#in}
timeout=$((length*65+5000))
textsnippet=$(head -c 80 <<<$in)

printf "Timeout: ${timeout}ms\n"
printf "Input text: \n\"$in\"\n"

# Start tts
echo $in | \
  piper --model "$basedir$model" --config "$basedir$config" --output-raw | \
  aplay -r 22050 -f S16_LE -t raw - &

# Show notification
DUNST_ACTION=$(dunstify -a "playSpeach" -u low -t $timeout -h string:x-dunst-stack-tag:$MSGTAG \
  -A "stop,Stop Piper" "Piper TTS" "Now Reading: \"$textsnippet...\"")

# Stop tts if middle mouse clicked on notification panel
case "$DUNST_ACTION" in
  "stop")
    exec killall piper
    ;;
esac
