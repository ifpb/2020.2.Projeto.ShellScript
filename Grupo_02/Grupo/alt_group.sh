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
							$(zenity --info --title="System" --text="Alterando o grupo de $arq_dir para o grupo $grupo !" --width="600" --height="400")
						else
							if [ -d $arq_dir ];then
								$(chgrp $grupo $arq_dir &>/dev/null)
								$(zenity --info --title="System" --text="Alterando o grupo de $arq_dir para o grupo $grupo !" --width="600" --height="400")
							else
								$(zenity --error --title="System" --text="Falha ao tentar trocar grupo proprietário!" --width="600" --height="400")
							fi
						fi
					else
						$(zenity --info --title="System" --text="Grupo / Arquivos / Diretório não informado(s)!" --width="600" --height="400" )
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Grupo / Arquivos / Diretório não informado(s)!" --width="600" --height="400" )
					;;
			esac

