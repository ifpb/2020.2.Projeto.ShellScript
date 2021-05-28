#!/bin/bash

opcao=$(yad --form --image ./Imagens/list.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Listar Grupos do</b>\n<i>Usuário</i>" --text-align=center \
		--field="Nome do Usuário" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

			case $? in
				0)
					listgrupo=$(echo $opcao | cut -d"|" -f1)
					if [ -n "$listgrupo" ];then
						$(groups ${listgrupo} &>/dev/null)
						if [ $? -eq 0 ];then
							$(groups ${listgrupo} | tr -s ' ' '\n' | awk '{if (NR >=3) print $1}' > /tmp/.group_user.txt)
							$(yad --form --image ./Imagens/listuser.png --image-on-top \
	--title"Administração de Sistemas" --text="<b>Lista de Grupos do\nUsuário</b>\n\n<i>$(cat /tmp/.group_user.txt | awk '{print $1}')</i>" --text-align=center \
	--button="gtk-ok":0 --buttons-layout=center \
	--width="500" --height="400")
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

