#!/bin/bash

delgrupo=$(zenity --forms --title="Removendo Usuário do Grupo" --text="Informe: " \
				--add-entry="Nick do usuário " \
				--add-entry="Nome do grupo " --width="600" --height="400")
			case $? in
				0)
					user1=$(echo $delgrupo | cut -d'|' -f1)
					grupo1=$(echo $delgrupo | cut -d'|' -f2)
					if [ -n "$user1" ] && [ -n "$grupo1" ];then
						$(gpasswd -d $user $grupo &>/dev/null)
						case $? in
							0)
								$(zenity --info --title="System" --text="Removido o usuário $user do grupo $grupo com sucesso!" --width="600" --height="400")
								;;
							1|3)
								$(zenity --error --title="System" --text="Falha ao remover usuário do grupo!" --width="600" --height="400")
								;;
						esac
					
					else
						$(zenity --info --title="System" --text="Usuário e grupo não informados!" --width="600" --height="400")
											
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Usuário e grupo não informados!" --width="600" --height="400")
					;;
			esac

