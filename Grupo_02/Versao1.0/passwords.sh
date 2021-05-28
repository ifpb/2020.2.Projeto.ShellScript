#!/bin/bash

while true; do
	opcao=$(zenity --list \
		--title="Menu-Passwords" \
		--text="Selecione" \
		--column="ID" --column="Opções" \
		"01" "Mudar Senha do Usuário" \
		"02" "Expiração da Senha" \
		"03" "Bloquear a Conta" \
		"04" "Desbloquear a Conta" \
		"05" "Alterar Data de Expiração" \
		"06" "Sair" --width="600" --height="400")
	opcao1=$(echo $opcao)

	case $opcao1 in
		01) 
            
           
			usuario=$(zenity --forms --title="Alterando a senha do Usuário" --text="Informe: " \
				--add-entry="Nome do usuário: " \
				--add-password="Nova senha: " \
				--add-password="Digite novamente: " --width="600" --height="400")
			case $? in
				0)
					user=$(echo $usuario | cut -d'|' -f1)
					passw1=$(echo $usuario | cut -d'|' -f2)
					passw2=$(echo $usuario | cut -d'|' -f3)
					if [ -n "$user" ];then
						if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -P "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[[:punct:]]){6,}" &>/dev/null;then
							echo $usuario | cut -d'|' -f2,3 | tr -s '|' '\n' > /tmp/.passwd_1.txt
							$(passwd $user < /tmp/.passwd_1.txt &> /dev/null)
							if [ $? -eq 0];then
								$(zenity --info --title="System" --text="Senha Alterada com Sucesso!" --width="600" --height="400")
							else
								$(zenity --error --title="System" --text="Falha ao Alterar Senha!" --width="600" --height="400")
							fi
						else
							$(zenity --error --text="Senhas diferentes! \nSenha precisa conter ao menos 6 caracteres (Aa1@)" --width="600" --height="400")
							senha=$(zenity --forms --title="Digte ambas as senhas iguais!" --text="Informe: " \
								--add-password="Senha " \
								--add-password="Novamente " --width="600" --height="400")
							passw1=$(echo $senha | cut -d'|' -f1)
							passw2=$(echo $senha | cut -d'|' -f2)
							if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -P "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[[:punct:]]){6,}" &> /dev/null;then
								echo $usuario | cut -d'|' -f2,3 | tr -s '|' '\n' > /tmp/.passwd_1.txt
							    $(passwd $user < /tmp/.passwd_1.txt &> /dev/null)
								if [ $? -eq 0];then
									$(zenity --info --title="System" --text="Senha alterada Com Sucesso!" --width="600" --height="400")
								else
									$(zenity --error --title="System" --text="Falha ao Alterar Senha!" --width="600" --height="400")
								fi
							else
								$(zenity --error --text="Não foi possivel alterar senha!\nTente novamente!" --width="600" --height="400")
							fi
						fi
					else
						$(zenity --info --text="Usuário não informado" --width="600" --height="400")
					fi
					;;

				1)
					$(zenity --info --title="System" --text="Alteração de senha do usuário cancelada!" --width="600" --height="400")
			esac

			;;

		02)
			user=$(zenity --forms --title="Exibir Data de Expiração da Senha" --text="Informe: " \
				--add-entry="Usuário: " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$user" ];then
						$(zenity --info --title="Data" --text="$(chage -l xico | tr -d '[\t]' | awk -F':' 'BEGIN {print "Data de Expiração: \n"}{if(NR >=2 && NR <=2) print $2}')" --width="600" --height="400" )
					else
						$(zenity --error --title="System" --text="Falha ao exibir data de expiração!" --width="600" --height="400")
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Usuário não informado!" --width="600" --height="400")
					;;
			esac
			
			;;
		03)
			user=$(zenity --forms --title="Bloquear a Conta" --text="Informe: " \
				--add-entry="Usuário: " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$user" ];then
						$(passwd -l $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Conta Bloqueada!" --width="600" --height="400")
						else
							$(zenity --error --title="System" --text="Falha ao Bloquear Conta!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Conta não Informada!" --width="600" --height="400")
					
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Conta não Informada!" --width="600" --height="400")
					;;
			esac
				


			;;

		04)
			user=$(zenity --forms --title="Desbloquear a Conta" --text="Informe: " \
				--add-entry="Usuário: " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$user" ];then
						$(passwd -u $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Conta Desbloqueada!" --width="600" --height="400")
						else
							$(zenity --error --title="System" --text="Falha ao Desbloquear Conta!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Conta não Informada!" --width="600" --height="400")
					
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Conta não Informada!" --width="600" --height="400")
					;;
			esac


			;;
		05)
			num=$(zenity --forms --title="Alteração da Data de Expiração" --text="Informe: " \
				--add-entry="Usuário " \
				--add-entry="Quantidade de Dias " --width="600" --height="400")
			case $? in
				0)
					user=$(echo $num | cut -d'|' -f1)
					numero=$(echo $num | cut -d'|' -f2)
					if [ -n "$user" ] && [ -n "$numero" ];then
						$(chage -M $numero $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(zenity --info --title="System" --text="Data da Expiração Alterada Com Sucesso!" --width="600" --height="400")
						else
							$(zenity --error --title="System" --text="Falha ao Alterar Data de Expiração!" --width="600" --height="400")
						fi
					else
						$(zenity --info --title="System" --text="Usuário ou Data Não Informado(s)!" --width="600" --height="400")
					fi
					;;
				1)
					$(zenity --info --title="System" --text="Usuário ou Data Não Informado(s)!" --width="600" --height="400")
					;;
			esac
					
			;;
		
		06)
			$(zenity --info --title="System" --text="Saindo do Menu de Senhas" --width="600" --height="400")
			break		


					


	esac
	verf=$(echo $opcao)
	if [ -z $verf ] && [ $? -eq 0 ];then break; fi



done
