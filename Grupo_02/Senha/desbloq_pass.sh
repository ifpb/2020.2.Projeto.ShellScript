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


