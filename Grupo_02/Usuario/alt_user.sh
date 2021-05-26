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
								$(zenity --info --title="System" --text="Alterando o usuário proprietário de $arq_dir !" --width="600" --height="400")
							else
								$(zenity --error --title="System" --text="Falha ao alterar o proprietário do arquivo/diretório!" --width="600" --height="400")
							fi
						else
							$(zenity --error --title="System" --text="Falha ao alterar o proprietário do arquivo/diretório!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Usuário / Arquivo / Diretório não informado(s)!" --width="600" --height="400")
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Usuário / Arquivo / Diretório não informado(s)!" --width="600" --height="400")
					;;
			esac

