#!/bin/bash

addgrupo=$(yad --form --image ./Imagens/add-user.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Adicionar Grupo ao</b>\n<i>Usuário</i>" --text-align=center \
	       	--field="Nome do Usuário" \
		--field="Nome do Grupo" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

			case $? in
				0)
					user=$(echo $addgrupo | cut -d'|' -f1)
					grupo=$(echo $addgrupo | cut -d'|' -f2)
					if [ -n "$user" ] && [ -n "$grupo" ];then
						$(adduser $user $grupo &>/dev/null)
						case $? in
							0)
								$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
								;;
							1)
								$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
								;;
						esac
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					fi
					;;

				1)

					;;	
			esac

