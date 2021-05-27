#!/bin/bash

altgrupo=$(zenity --forms --title="Alterando Grupo Proprietário" --text="Informe: " \
				--add-entry="Nome do grupo " \
				--add-entry="Nome do arquivo/diretório" --width="600" --height="400")
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
					$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					;;
			esac

