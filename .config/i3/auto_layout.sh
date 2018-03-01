#/bin/bash

## location of i3 configuration scripts.
config=/home/$USER/.config/i3
folder=workspaces
default_terms=3

## Workspace specific varaibles

study=/home/$USER/Desktop/bash
books=/home/$USER/Desktop/Books

## Grabs Workspace names.

if [ -f $config/config ]; then
	grep 'set $workspace*' $config/config | cut -f 2- -d" " | cut -f 2 -d"$" | \
		sed 's/ /=/' > $config/$folder/temp.sh
fi


if [ -f $config/$folder/temp.sh ]; then
	. $config/$folder/temp.sh
	rm $config/$folder/temp.sh
fi

## Generate the correct terminals

#function generate_terminals () {
#	gnome-terminal --working-directory=$1
#}

## Execute the layout specified by the approriate json file.
## Run and insert programs into generated placeholders.

## Workspace 3 - Study
i3-msg "workspace $workspace3; append_layout $config/$folder/workspace3.json"
i3-msg "workspace $workspace4; append_layout $config/$folder/workspace4.json"

gnome-terminal --working-directory=$study
gnome-terminal --working-directory=$study
#generate_terminals $study
#generate_terminals $study
gnome-terminal 
gnome-terminal
gnome-terminal

mupdf $books/Computer_Science/Linux/bash/Advanced\ Bash\ Shell\ -\ guide.pdf &
