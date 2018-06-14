#!/usr/bin/sh

## Strips audio from given files into mp3s

if [ ! -x ./output ]; then
    mkdir ./output;
fi;

for i in "$@"; do
    file1=`echo "$i" | cut -d'.' -f 1`;
    ffmpeg -i "$i" -vcodec copy ./output/"$file1".mp3;
done;
