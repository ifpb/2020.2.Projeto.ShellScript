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

