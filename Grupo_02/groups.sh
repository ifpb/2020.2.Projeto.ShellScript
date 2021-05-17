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
			;;
			
		02)
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
			;;
		03)
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
			;;
		04)
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
	
			;;
		05)
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
						
			;;

		06)
			$(zenity --info --title="System" --text="Saindo do Menu de Grupos" --width="600" --height="400")
			break		


					


	esac
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi



done
