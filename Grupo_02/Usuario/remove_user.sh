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
							$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						else
							$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

						fi
					else
						$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						opcao=$(yad --form --image ./Imagens/remove-user.png --image-on-top \
								--title="Administração de Sistemas" --center --text="<b>Excluir</b>\n<i>Usuário</i>" --text-align=center \
								--field="Nome do Usuário" \
								--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
								--width="600" --height="400")
						user=$(echo $opcao | cut -d"|" -f1)

						if [ -n "$user" ];then
							$(deluser -remove-home $user &>/dev/null)
							if [ $? -eq 0 ];then
								$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
							else
								$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
							fi
						else
							$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						fi

								
					fi
					;;


				1)
					;;
			        esac

