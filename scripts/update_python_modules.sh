#!/usr/bin/bash

x=$( cut -d'=' -f 1 <<< `pip freeze` );
y=$( cut -d'=' -f 1 <<< `pip2 freeze` );

for i in $x; do
    sudo pip install --upgrade $i;
done

for e in $y; do
    sudo pip2 install --upgrade $e;
done
