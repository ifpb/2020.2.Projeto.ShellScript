#!/bin/bash

altuser=$(zenity --forms --title="Alterando Usuário Proprietário" --text="Informe: "\
				--add-entry="Nome do usuário " \
				--add-entry="Nome do arquvivo/diretório" --width="600" --height="400")
			case $? in
				0)
					user=$(echo $altuser | cut -d'|' -f1)
					arq_dir=$(echo $altuser | cut -d'|' -f2)
					if [ -n "$user" ] && [ -n "$arq_dir" ];then
						if [ -f $arq_dir ] || [ -d $arq_dir ];then
							$(chown $user $arq_dir &>/dev/null)
							if [ $? -eq 0 ];then
								$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Excutado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

							else
								$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

							fi
						else
							$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

						fi
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado!</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					fi
					;;
				1)
					$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado!</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

					;;
			esac

