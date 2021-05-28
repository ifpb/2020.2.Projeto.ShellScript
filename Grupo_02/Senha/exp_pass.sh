opcao=$(yad --form --image ./Imagens/time.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Data de Expiração da Senha do</b>\n<i>Usuário</i>" --text-align=center \
		--field="Nome do Usuário" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

			case $? in
				0)
					user=$(echo $opcao | cut -d"|" -f1)
					if [ -n "$user" ];then		
						$(yad --form --image ./Imagens/time.png --image-on-top \
							--title"Administração de Sistemas" --text="<b>Data de\nExpiração</b>\n\n<i>$(chage -l $user | tr -d '[\t]' | awk -F':' '{if(NR >=2 && NR <=2) print $2}')</i>" --text-align=center \
							--button="gtk-ok":0 --buttons-layout=center \
							--width="500" --height="400")
					else
						$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")

					fi
					;;
				1)
					;;
			esac

