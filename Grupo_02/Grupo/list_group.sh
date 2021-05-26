#!/bin/bash

$(awk -F":" '{if( $3 >= 1000 && $3  <= 29999) print ($3" "$1)}' /etc/group > /tmp/.group_list.txt)
			$(zenity --info --title="Lista de Grupos" --text="$(awk 'BEGIN{print "ID Grupos"}{print $1" "$2 }' /tmp/.group_list.txt)" --width="400" --height="400")

