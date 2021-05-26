#!/bin/bash

grupo=$(zenity --forms --title="Excluindo Grupo " --text="Informe: " \
				--add-entry="Nome do grupo " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$grupo" ];then
						$(groupdel $grupo &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Grupo Excluido com Sucesso!" --width="600" --height="400")
						else
							$(zenity --error --title="System" --text="Falha Ao Tentar Excluir Grupo!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Nenhum Grupo Informado!" --width="600" --height="400")
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Nenhum Grupo Informado!" --width="600" --height="400")
					;;

			esac

