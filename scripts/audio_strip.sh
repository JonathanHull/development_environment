#!/usr/bin/sh

## Strips audio from given files into mp3s

USEAGE="Usage: `basename $0` [-f | -mp3] FILES"
output="./output"
flac=0
mp3=0

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "ffmpeg Video to audio encoding script."
            echo " "
            echo "$USEAGE"
            echo " "
            echo "options:"
            echo "-o, --output      Specify output directory."
            echo "-f, --flac        Convert files to flac format."
            echo "-m, --mp3         Convert files to mp3 format [default]."
            exit 0
            ;;

        -o|--output)
            shift
            echo "Output folder set to: $1";
            output=$1;
            shift
            ;;

        -m|--mp3)
            mp3=1
            shift
            ;;

        -f|--flac)
            flac=1
            shift
            ;;

        -mf|-fm)
            flac=1
            mp3=1
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
    file1=`echo "$i" | cut -d'.' -f 1 | awk -F/ '{print $NF}'`

    echo "Converting $file1"

    if [ $mp3 -eq 0 ] && [ $flac -eq 0 ]; then
        ffmpeg -i "$i" -vcodec copy "$output"/"$file1".mp3

    elif [ $m3 -eq 1 ] && [ $flac -eq 1]; then
        ffmpeg -i "$i" -vcodec copy "$output"/"$file1".mp3
        ffmpeg -i "$i" -c:a flac "$output"/"$file1".flac

    elif [ $mp3 -eq 1 ]; then
        ffmpeg -i "$i" -vcodec copy "$output"/"$file1".mp3

    else
        ffmpeg -i "$i" -c:a flac "$output"/"$file1".flac
    fi
done 
