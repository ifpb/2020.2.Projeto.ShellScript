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

