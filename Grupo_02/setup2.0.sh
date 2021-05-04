#!/bin/bash

while true; do
	opcao=$(zenity --list \
		--title="Menu" \
		--column="ID" --column="Opções" \
		"01" "user" \
		"02" "Group" \
	 	"03" "Password" \
		"04" "Exit" --width="600" --height="400")
	opcao1=$(echo $opcao)
	case $opcao1 in
		04)
			zenity --info --title="Finalizando o programa" --text="Até a proxima" --ellipsize
			break
			;;
		01)
			$(./users.sh)
			;;

		02)
			$(./groups.sh)
			;;

		03)
			echo "Faltada criar"

	esac
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi
done


