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

