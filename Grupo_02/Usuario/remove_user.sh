#!/bin/bash

user=$(zenity --forms --title="Excluir Usuário" --text="Informe: " \
				--add-entry="Informe o nome do usuário " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$user" ];then
						$(deluser -remove-home $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
						else
							$(zenity --error --text="Não foi possivel excluir usuário!\nInforme o nome correto!" --width="600" --height="400")
							user=$(zenity --forms --title="Excluir Usuário"  --text="Informe: "\
								--add-entry="Informe o nome do usuário " --width="600" --height="400")
							if [ -n "$user" ];then
								$(deluser -remove-home $user &>/dev/null)
								if [ $? -eq 0 ];then
									$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
								else
									$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")
								fi
								
							fi
						fi

					else
						$(zenity --error --text="Não foi possivel excluir usuário!\nInforme o nome correto!" --width="600" --height="400")
						user=$(zenity --forms --title="Excluir Usuário" --text="Informe: "\
							--add-entry="Informe o nome do usuário " --width="600" --height="400")
						if [ -n "$user" ];then
							$(deluser -remove-home $user &>/dev/null)
							if [ $? -eq 0 ];then
								$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
							else
								$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")
		
							fi
						fi
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Excluir usuário cancelado !" --width="600" --height="400")
					;;
				esac

