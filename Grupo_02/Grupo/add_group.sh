#!/bin/bash

addgrupo=$(zenity --forms --title="Adicionar Usuário ao Grupo" --text="Informe: " \
				--add-entry="Nick do usuário " \
				--add-entry="Nome do grupo " --width="600" --height="400")
			case $? in
				0)
					user=$(echo $addgrupo | cut -d'|' -f1)
					grupo=$(echo $addgrupo | cut -d'|' -f2)
					if [ -n "$user" ] && [ -n "$grupo" ];then
						$(adduser $user $grupo &>/dev/null)
						case $? in
							0)
								$(zenity --info --title="System" --text="Adicionado o usuário $user ao grupo $grupo com sucesso!" --width="600" --height="400")
								;;
							1)
								$(zenity --error --title="System" --text="Usuário ou grupo não existe!" --width="600" --height="400")
								;;
						esac
					else
						$(zenity --info --title="System" --text="Nenhum argumento informado!" --width="600" --height="400")
					fi
					;;

				1)
					$(zenity --info --title="System" --text="Nenhum argumento informado!" --width="600" --height="400")
					;;	
			esac

