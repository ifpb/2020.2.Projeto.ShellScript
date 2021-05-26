#!/bin/bash

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
