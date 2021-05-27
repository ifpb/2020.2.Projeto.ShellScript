#!/bin/bash

delgrupo=$(yad --form --image ./Imagens/remove-user.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Remover Usuário do</b>\n<i>Grupo</i>" --text-align=center \
		--field="Nome do Usuário" \
		--field="Nome do Grupo" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

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
							[123])
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

