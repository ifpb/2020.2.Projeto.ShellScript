#!/bin/bash

opcao=$(yad --form --image ./Imagens/add-group.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Criar</b>\n<i>Grupo</i>" --text-align=center \
		--field="Nome do Grupo" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

			case $? in
				0)
					grupo=$(echo $opcao | cut -d"|" -f1)
					if [ -n "$grupo" ]; then
						$(addgroup $grupo &>/dev/null)
						if [ $? -eq 0 ];then
							$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
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

