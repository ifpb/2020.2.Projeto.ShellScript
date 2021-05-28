#!/bin/bash

altuser=$(yad --form --image ./Imagens/folder.png --image-on-top \
	--title="Administração de Sistemas" --center --text="<b>Alterar Usuário Proprietário</b>\n<i>Arquivos e Diretórios</i>" --text-align=center \
	--field="Nome do Usuário" \
	--field="Nome do F/D" \
	--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
	--width="500" --height="400")
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
					;;
			esac

