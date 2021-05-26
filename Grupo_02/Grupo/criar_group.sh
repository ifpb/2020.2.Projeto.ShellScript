#!/bin/bash

grupo=$(zenity --forms --title="Criando Grupo " --text="Informe: " \
				--add-entry="Nome do grupo " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$grupo" ]; then
						$(addgroup $grupo &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Grupo Criado Com Sucesso!" --width="600" --height="400")
						else
							$(zenity --error --title="System" --text="Falha Na Criação Do Grupo!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Nenhum Grupo Informado!" --width="600" --height="400")
					fi

					;;
				1)
					$(zenity --info --title="System" --text="Nenhum Grupo Informado!" --width="600" --height="400")
					;;

			esac

