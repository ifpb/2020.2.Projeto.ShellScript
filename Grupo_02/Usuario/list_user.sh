#!/bin/bash

$(awk -F":" '{if( $4 >= 1000 && $4  <= 29999) print ($4" "$1)}' /etc/passwd > /tmp/user_list.txt)
			$(zenity --info --title="Lista de Usuários" --text="$(awk 'BEGIN{print "ID USERS"}{print $1" "$2 }' /tmp/user_list.txt)" --width="400" --height="400")


