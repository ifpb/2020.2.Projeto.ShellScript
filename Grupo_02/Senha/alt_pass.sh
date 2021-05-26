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

