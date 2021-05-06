#!/bin/bash

while true; do
	opcao=$(zenity --list \
		--title="Menu-Group" \
		--text="Selecione" \
		--column="ID" --column="Opções" \
		"01" "Criar Grupo" \
		"02" "Excluir Grupo" \
		"03" "Adicionar Grupo ao Usuário" \
		"04" "Remover Grupo do Usuário" \
		"05" "Alterar Grupo de uma Arquivo ou Diretório" \
		"06" "Exit" --width="600" --height="400")
	opcao1=$(echo $opcao)

	case $opcao1 in
		01)
			grupo=$(zenity --forms --title="Criando Grupo " \
				--add-entry="Informe o nome do grupo " --width="600" --height="400")
			case $? in
				0)
					
					$(addgroup $grupo) &> /dev/null
					if [ $? -eq 127 ];then
						$(zenity --info --title="System" --text="Grupo Criado Com Sucesso!" --width="600" --height="400")
						
					fi
					;;
				1)
					$(zenity --error --text="Nenhum grupo informado !" --width="600" --height="400")
					;;

			esac
			;;
			
		02)
			grupo=$(zenity --forms --title="Excluindo Grupo " \
				--add-entry="Informe o nome do grupo " --width="600" --height="400")	
			if [ ! -z $grupo ] && [ $? -eq 0 ];then
				$(groupdel $grupo ) &> /dev/null
				$(zenity --info --text="Grupo Excluido com Sucesso !" --width="600" --height="400")

			else
				$(zenity --error --text="Nenhum Grupo Informado !" --width="600" --height="400")

			fi
			;;
		03)
			opcao=$(zenity --forms --title="Adicionar Usuário ao Grupo" \
				--add-entry="Informe o nick do usuário " \
				--add-entry="Informe o nome do grupo " --width="600" --height="400")
			user=$(echo $opcao | cut -d'|' -f1)
			grupo=$(echo $opcao | cut -d'|' -f2)
			$(adduser $user $grupo) &> /dev/null
			$(zenity --info --title="System" --text="Adicionado o usuário $user ao grupo $grupo com sucesso!" \
			--width="600" --height="400")
			;;
		04)
			opcao=$(zenity --forms --title="Removendo Usuário do Grupo" \
				--add-entry="Informe o nick do usuário " \
				--add-entry="Informe o nome do grupo " --width="600" --height="400")
			user=$(echo $opcao | cut -d'|' -f1)
			grupo=$(echo $opcao | cut -d'|' -f2)
			$(gpasswd -d $user $grupo) &> /dev/null
			$(zenity --info --title="System" --text="Removendo o usuário $user do grupo $grupo !" --width="600" --height="400")
				
			;;
		05)
			opcao=$(zenity --forms --title="Alterando Grupo Proprietário" \
				--add-entry="Informe o nome do grupo " \
				--add-entry="Informe o nome do arquivo ou diretório " --width="600" --height="400")
			grupo=$(echo $opcao | cut -d'|' -f1)
			arq_dir=$(echo $opcao | cut -d'|' -f2)
			$(chgrp $grupo $arq_dir) &> /dev/null
			$(zenity --info --title="System" --text="Alterando o grupo de $arq_dir para o grupo $grupo !" \
			--width="600" --height="400")	
			;;

		06)
			$(zenity --info --title="System" --text="Saindo do Menu de Grupos" --width="600" --height="400")
			break		


					


	esac
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi



done
