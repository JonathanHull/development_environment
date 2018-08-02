#!/usr/bin/sh

## Converts Flac files to mp3s
USEAGE="Usage: `basename $0` [-o][-b] FILES"
output=./`echo $(basename $0) | cut -d. -f 1`_output
bitrate=256

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "FFmpeg Flac to mp3 conversion script."
            echo " "
            echo "$USEAGE"
            echo " "
            echo "options:"
            echo "-o, --output      Specify the output directory."
            echo "-b, --bitrate     Specify the bitrate of output mp3s."
            exit 0
            ;;

        -o|--output)
            shift
            echo "Output folder set to: $1";
            output=$1
            shift
            ;;

        -b|--bitrate)
            shift
            echo "Mp3 output bitrate set to: $1";
            bitrate=$1
            shift
            ;;

        *)
            break
            ;;
    esac
done

if [ ! -d "$output" ]; then
    mkdir "$output";
fi

echo "Starting conversion..."
echo " "

for i in "$@"; do
    filename=`echo "$i" | rev | cut -d"/" -f 1 | rev | cut -d. -f 1`
    #echo "Converting $filename"
    ffmpeg -i "$i" -acodec libmp3lame -ab "${bitrate}k" "$output/${filename}.mp3"
done
