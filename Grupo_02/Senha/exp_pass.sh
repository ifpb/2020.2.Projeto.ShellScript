user=$(zenity --forms --title="Exibir Data de Expiração da Senha" --text="Informe: " \
				--add-entry="Usuário: " --width="600" --height="400")
			case $? in
				0)
					if [ -n "$user" ];then
						$(zenity --info --title="Data" --text="$(chage -l xico | tr -d '[\t]' | awk -F':' 'BEGIN {print "Data de Expiração: \n"}{if(NR >=2 && NR <=2) print $2}')" --width="600" --height="400" )
					else
						$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

					fi
					;;
				1)
					;;
			esac

