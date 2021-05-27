#!/bin/bash

delgrupo=$(zenity --forms --title="Removendo Usuário do Grupo" --text="Informe: " \
				--add-entry="Nick do usuário " \
				--add-entry="Nome do grupo " --width="600" --height="400")
			case $? in
				0)
					user1=$(echo $delgrupo | cut -d'|' -f1)
					grupo1=$(echo $delgrupo | cut -d'|' -f2)
					if [ -n "$user1" ] && [ -n "$grupo1" ];then
						$(gpasswd -d $user $grupo &>/dev/null)
						case $? in
							0)
								$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
								;;
							1|3)
								$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
								;;
						esac
					
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
											
					fi
					;;
				1)
					$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					;;
			esac

