#!/bin/bash

altgrupo=$(yad --form --image ./Imagens/alt_folder.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Alterando Grupo</b>\n<i>Proprietário</i>" --text-align=center \
	       	--field="Nome do Grupo" \
		--field="Nome do F/D" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

			case $? in
				0)
					grupo=$(echo $altgrupo | cut -d'|' -f1)
					arq_dir=$(echo $altgrupo | cut -d'|' -f2)
					if [ -n "$grupo" ] && [ -n "$arq_dir" ];then
						if [ -f $arq_dir ];then
							$(chgrp $grupo $arq_dir &>/dev/null)
							$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						else
							if [ -d $arq_dir ];then
								$(chgrp $grupo $arq_dir &>/dev/null)
								$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
							else
								$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

							fi
						fi
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					fi
					;;
				1)

					;;
			esac

