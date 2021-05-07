#!/bin/bash

while true; do
	opcao=$(zenity --list \
		--title="Menu-Users " \
		--text="Selecione" \
		--column="ID" --column="Opções" \
		"01" "Criar Usuário" \
		"02" "Deletar Usuário" \
		"03" "Alterar Usuario de uma Arquivo ou Diretório" \
	 	"04" "Sair do Menu do Usuário" --width="600" --height="400")
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
			if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -E '\b(([A-Za-z0-9]+)|([[:punct:]]+)){6}\b' &> /dev/null;then 
				echo $usuario | cut -d'|' -f2,3 | tr -s '|' '\n' > /tmp/.senhas.txt
				for i in $(seq 1 6);do echo " " >> /tmp/.senhas.txt ; done
				$(adduser $user < /tmp/.senhas.txt) &>/dev/null
				$(chage -I 10 -M 30 $user) &>/dev/null
				$(zenity --info --title="System" --text="Usuário Criado Com Sucesso!" --width="600" --height="400")

			else
				$(zenity --error --text="Senhas diferentes! \nSenha precisa conter ao menos 6 caracteres (Aa1@)" --width="600" --height="400")
				senha=$(zenity --forms --title="Digte ambas as senhas iguais!" \
					--add-password="Senha " \
					--add-password="Novamente " --width="600" --height="400")
				passw1=$(echo $senha | cut -d'|' -f1)
				passw2=$(echo $senha | cut -d'|' -f2)
				if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -E '\b(([A-Za-z0-9]+)|([[:punct:]]+)){6}\b' &> /dev/null;then
					echo $senha | cut -d'|' -f1,2 | tr -s '|' '\n' > /tmp/.senhas1.txt
					for i in $(seq 1 6);do echo " " >> /tmp/.senhas1.txt ; done
					$(adduser $user < /tmp/.senhas1.txt) &>/dev/null
					$(chage -I 10 -M 30 $user) &>/dev/null
					$(zenity --info --title="System" --text="Usuário Criado Com Sucesso!" --width="600" --height="400")
				else
					$(zenity --error --text="Não foi possivel criar usuário!\nTente novamente!" --width="600" --height="400")
				fi	

			fi
			;;
		02)
			user=$(zenity --forms --title="Excluir Usuário" \
				--add-entry="Informe o nome do usuário " --width="600" --height="400")
			if [ -n "$user" ];then
				$(deluser -remove-home $user &>/dev/null)
				if [ $? -eq 0 ];then
					$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
				else
					$(zenity --error --text="Não foi possivel excluir usuário!\nInforme o nome correto!" --width="600" --height="400")
					user=$(zenity --forms --title="Excluir Usuário" \
						--add-entry="Informe o nome do usuário " --width="600" --height="400")
					if [ -n "$user" ];then
						$(deluser -remove-home $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
						else
							$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")
						fi
					else
						$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")

					fi
				fi
			else
				$(zenity --error --text="Não foi possivel excluir usuário!\nInforme o nome correto!" --width="600" --height="400")
				user=$(zenity --forms --title="Excluir Usuário" \
					--add-entry="Informe o nome do usuário " --width="600" --height="400")
				if [ -n "$user" ];then
					$(deluser -remove-home $user &>/dev/null)
					if [ $? -eq 0 ];then
						$(zenity --info --title="System" --text="Usuário Excluido Com Sucesso!" --width="600" --height="400")
					else
						$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")
	
					fi
				else
					$(zenity --error --text="Usuário não existe!\nTente novamente!" --width="600" --height="400")
			
				fi


			fi
			;;

		03)
			opcao=$(zenity --forms --title="Alterando Usuário Proprietário" \
				--add-entry="Informe o nome do usuário " \
				--add-entry="Informe o nome do arquvivo ou diretório " --width="600" --height="400")
			user=$(echo $opcao | cut -d'|' -f1)
			arq_dir=$(echo $opcao | cut -d'|' -f2)
			$(chown $user $arq_dir) &> /dev/null
			$(zenity --info --title="System" --text="Alterando o usuário proprietário de $arq_dir !" \
			--width="600" --height="400")
			;;

		04)
			$(zenity --info --title="System" --text="Saindo do Menu do Usuário" --width="600" --height="400")
			break
			;;		
		

		esac
		
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi

done
