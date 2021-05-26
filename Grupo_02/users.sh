#!/bin/bash

while true; do
	opcao=$(zenity --list 
		--title="Menu-Users " \
		--text="Selecione" \
		--column="ID" --column="Opções" \
		"01" "Criar Usuário" \
		"02" "Deletar Usuário" \
		"03" "Alterar Usuario de um Arquivo ou Diretório" \
		"04" "Listar Usuários" \
	 	"05" "Sair" --width="600" --height="400")
	opcao1=$(echo $opcao)



	case $opcao1 in
		01)
			usuario=$(zenity --forms --title="Criando Usuário" --text="Informe: " \
				--add-entry="Nome do user: " \
				--add-password="Digite a senha: " \
				--add-password="Digite novamente: " --width="600" --height="400")
			case $? in
				0)
					user=$(echo $usuario | cut -d'|' -f1)
					passw1=$(echo $usuario | cut -d'|' -f2)
					passw2=$(echo $usuario | cut -d'|' -f3)
					if [ -n "$user" ];then
						if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -P "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[[:punct:]]){6,}" &>/dev/null;then
							echo $usuario | cut -d'|' -f2,3 | tr -s '|' '\n' > /tmp/.senhas.txt
							for i in $(seq 1 6);do echo " " >> /tmp/.senhas.txt ; done
							$(adduser $user < /tmp/.senhas.txt &>/dev/null)
							if [ $? -eq 0 ];then
								$(chage -I 10 -M 50 $user &>/dev/null)
								$(zenity --info --title="System" --text="Usuário Criado Com Sucesso!" --width="600" --height="400")
							else
								$(zenity --error --title="System" --text="Falha Ao Criar Usuário!" --width="600" --height="400")
							fi

						else
							$(zenity --error --text="Senhas diferentes! \nSenha Precisa Conter Ao Menos 6 Caracteres\nEx: [ Senh@123 ]" --width="600" --height="400")
							senha=$(zenity --forms --title="Digte ambas as senhas iguais!" --text="Informe: " \
								--add-password="Senha " \
								--add-password="Novamente " --width="600" --height="400")
							passw1=$(echo $senha | cut -d'|' -f1)
							passw2=$(echo $senha | cut -d'|' -f2)
							if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -P "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[[:punct:]]){6,}" &> /dev/null;then
								echo $senha | cut -d'|' -f1,2 | tr -s '|' '\n' > /tmp/.senhas1.txt
								for i in $(seq 1 6);do echo " " >> /tmp/.senhas1.txt ; done
								$(adduser $user < /tmp/.senhas1.txt &>/dev/null)
								if [ $? -eq 0 ];then
									$(chage -I 10 -M 50 $user &>/dev/null)
									$(zenity --info --title="System" --text="Usuário Criado Com Sucesso!" --width="600" --height="400")
								else
									$(zenity --error --title="System" --text="Falha Ao Criar Usuário!" --width="600" --height="400")
								fi
							else
								$(zenity --error --text="Não foi possivel criar usuário!\nTente novamente!" --width="600" --height="400")
							fi
						fi
					else
						$(zenity --error --text="Usuário não informado" --width="600" --height="400")
					fi
					;;

				1)
					$(zenity --info --title="System" --text="Criação de usuário cancelada !" --width="600" --height="400")
			esac

			;;


		02)
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


			;;

		03)
			altuser=$(zenity --forms --title="Alterando Usuário Proprietário" --text="Informe: "\
				--add-entry="Nome do usuário " \
				--add-entry="Nome do arquvivo/diretório" --width="600" --height="400")
			case $? in
				0)
					user=$(echo $altuser | cut -d'|' -f1)
					arq_dir=$(echo $altuser | cut -d'|' -f2)
					if [ -n "$user" ] && [ -n "$arq_dir" ];then
						if [ -f $arq_dir ] || [ -d $arq_dir ];then
							$(chown $user $arq_dir &>/dev/null)
							if [ $? -eq 0 ];then
								$(zenity --info --title="System" --text="Alterando o usuário proprietário de $arq_dir !" --width="600" --height="400")
							else
								$(zenity --error --title="System" --text="Falha ao alterar o proprietário do arquivo/diretório!" --width="600" --height="400")
							fi
						else
							$(zenity --error --title="System" --text="Falha ao alterar o proprietário do arquivo/diretório!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Usuário / Arquivo / Diretório não informado(s)!" --width="600" --height="400")
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Usuário / Arquivo / Diretório não informado(s)!" --width="600" --height="400")
					;;
			esac

			;;
		04)
			$(awk -F":" '{if( $4 >= 1000 && $4  <= 29999) print ($4" "$1)}' /etc/passwd > /tmp/user_list.txt)
			$(zenity --info --title="Lista de Usuários" --text="$(awk 'BEGIN{print "ID USERS"}{print $1" "$2 }' /tmp/user_list.txt)" --width="400" --height="400")

			;;

		05)
			$(zenity --info --title="System" --text="Saindo do Menu do Usuário" --width="600" --height="400")
			break
			;;		
		

		esac
		
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi

done
