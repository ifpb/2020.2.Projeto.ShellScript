#!/bin/bash

while true; do
	opcao=$(zenity --list \
		--title="Menu" \
		--column="ID" --column="Opções" \
		"01" "Criar Usuário" \
		"02" "Excluir Usuário" \
		"03" "Trocar Grupo" \
	 	"04" "Criar Grupo" \
		"05" "Sair" --width="600" --height="400")
	opcao1=$(echo $opcao)
	case $opcao1 in
		'Sair'|05)
			zenity --info --title="Finalizando o programa" --text="Até a proxima" --ellipsize
			break
			;;
		'Criar Usuário'|01)
			usuario=$(zenity --forms --title="Criando Usuário" \
				--add-entry="Nome do user: " \
				--add-password="Digite a senha: " \
				--add-password="Digite novamente: ")
			user=$(echo $usuario | cut -d'|' -f1)
			$(sudo adduser --disabled-login $user) &> /dev/null
			echo $usuario | cut -d'|' -f2,3 | tr -s '|' '\n' > /tmp/senhas.txt
			zenity --info --title="System" --text="Usuário Criado Com Sucesso!"
			passw1=$(echo $usuario | cut -d'|' -f2)
			passw2=$(echo $usuario | cut -d'|' -f3)
			zenity --text="Deseja habilitar a senha?" --question
			a=$(echo $?)
			if [ $passw1 -eq $passw2 -a $a -eq 0 ]; then
				$(sudo passwd $user < /tmp/senhas.txt)
				echo "sucesso"
				zenity --info --title="System" --text="Senha Habilitada Com Sucesso!"
			else
				echo "falha"

			fi
			;;
		'Excluir Usuário'|02)
			remove=$(zenity --title="Remover user" --text="Informe o nick do usuário" --entry)
			$(sudo userdel $remove)
			zenity --info --title="System" --text="Usuário excluido Com Sucesso!"
			;;
		'Criar Grupo'|04)
			grupo=$(zenity --forms --title="Criando Grupo" \
				--add-entry="Informe o nome do grupo: " )
			case $? in
				0)
					$(sudo addgroup $grupo) &> /dev/null
					if [ $? -eq 127 ];then
						zenity --info --title="System" --text="Grupo Criado Com Sucesso!"
						
					fi
					;;
				1)
					zenity --error --text="Nenhum grupo informado! "
			esac
			;;
	esac
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi
done


