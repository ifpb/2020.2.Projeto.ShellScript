#!/bin/bash

opcao=$(yad --form --image ./Imagens/remove-user.png --image-on-top \
	--title="Administração de Sistemas" --center --text="<b>Excluir</b>\n<i>Usuário</i>" --text-align=center \
	--field="Nome do Usuário" \
	--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
	--width="600" --height="400")
			case $? in
				0)
					user=$(echo $opcao | cut -d"|" -f1)
					if [ -n "$user" ];then
						$(deluser -remove-home $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
						else
							$(zenity --info --title="System" --text="FALHA")
						fi
					else
						echo "ESPERA UM INFO YAD"
						opcao=$(yad --form --image ./Imagens/remove-user.png --image-on-top \
								--title="Administração de Sistemas" --center --text="<b>Excluir</b>\n<i>Usuário</i>" --text-align=center \
								--field="Nome do Usuário" \
								--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
								--width="600" --height="400")
						user=$(echo $opcao | cut -d"|" -f1)

						if [ -n "$user" ];then
							$(deluser -remove-home $user &>/dev/null)
							if [ $? -eq 0 ];then
								$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
							else
								$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")
							fi
						else
							$(zenity --error --title="System" --text="Error")
						fi

								
					fi
					;;


				1)
					$(zenity --info --title="System" --text="Excluir usuário cancelado !" --width="600" --height="400")
					;;
				esac

