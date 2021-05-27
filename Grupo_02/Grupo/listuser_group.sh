#!/bin/bash

listgrupo=$(zenity --forms --title="Lista de Grupos do Usuário" --text="Informe: " \
				--add-entry="Nome do Usuário " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$listgrupo" ];then
						$(groups ${listgrupo} &>/dev/null)
						if [ $? -eq 0 ];then
							$(groups ${listgrupo} | tr -s ' ' '\n' | awk '{if (NR >=3) print $1}' > /tmp/.group_user.txt)
							$(zenity --info --title="Lista" --text="$(cat /tmp/.group_user.txt | awk 'BEGIN{print "Grupo(s) do Usuário: ""'$listgrupo'\n" }{print $1}')" --width="600" --height="400")
						else
							$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						fi
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

					fi

					;;
				1)
					$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					;;
			esac

