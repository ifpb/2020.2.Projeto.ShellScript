#!/bin/bash

while true; do
	opcao=$(zenity --list \
		--title="Menu-Users " \
		--text="Selecione" \
		--column="ID" --column="Opções" \
		"01" "Criar Usuário" \
		"02" "Deletar Usuário" \
	 	"03" "Adicionar Grupo ao Usuário" \
		"04" "Remover Grupo do Usuário" \
		"05" "Sair do Menu do Usuário" --width="600" --height="400")
	opcao1=$(echo $opcao)



	case $opcao1 in
		01)
			usuario=$(zenity --forms --title="Criando Usuário" \
				--add-entry="Nome do user: " \
				--add-password="Digite a senha: " \
				--add-password="Digite novamente: " --width="600" --height="400")
			user=$(echo $usuario | cut -d'|' -f1)
			passw1=$(echo $usuario | cut -d'|' -f2)
			passw2=$(echo $usuario | cut -d'|' -f3)
			if [ ${passw1} -eq ${passw2} ];then
				echo $usuario | cut -d'|' -f2,3 | tr -s '|' '\n' > /tmp/senhas.txt
				for i in $(seq 1 6);do echo " " >> /tmp/senhas.txt ; done
				$(adduser $user < /tmp/senhas.txt) &> /dev/null
				$(chage -I 10 -M 30 $user) &> /dev/null
				$(zenity --info --title="System" --text="Usuário Criado Com Sucesso!" --width="600" --height="400")

			else
				$(zenity --error --text="Senhas diferentes, por favor digite novamente as corretamente!" --width="600" --height="400")
				senha=$(zenity --forms --title="Digte ambas as senhas iguais!" \
					--add-password="Senha " \
					--add-password="Novamente " --width="600" --height="400")
				echo $senha | cut -d'|' -f1,2 | tr -s '|' '\n' > /tmp/senhas1.txt
				for i in $(seq 1 6);do echo " " >> /tmp/senhas1.txt ; done
				$(adduser $user < /tmp/senhas1.txt) &> /dev/null
				$(chage -I 10 -M 30 $user) &> /dev/null
				$(zenity --info --title="System" --text="Usuário Criado Com Sucesso!" --width="600" --height="400")

			fi
			;;
		02)
			user=$(zenity --forms --title="Excluir Usuário" \
				--add-entry="Informe o nome do usuário " --width="600" --height="400")
			$(deluser -remove-home $user) &> /dev/null
			$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
			;;

		03)
			opcao=$(zenity --forms --title="Adicionar Usuário ao Grupo" \
				--add-entry="Informe o nick do usuário " \
				--add-entry="Informe o nome do grupo " --width="600" --height="400")
			user=$(echo $opcao | cut -d'|' -f1)
			grupo=$(echo $opcao | cut -d'|' -f2)
			$(adduser $user $grupo) &> /dev/null
			$(zenity --info --title="System" --text="Adicionado o usuário $user ao grupo $grupo com sucesso!" --width="600" --height="400")
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
			$(zenity --info --title="System" --text="Saindo do Menu do Usuário" --width="600" --height="400")
			break		
		

		esac
		
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi

done
