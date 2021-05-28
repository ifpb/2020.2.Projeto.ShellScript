num=$(yad --form --image ./Imagens/time.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Alterar Data de Expiração do</b>\n<i>Usuário</i>" --text-align=center \
		--field="Nome do Usuário" \
		--field="Quantidade de Dias" \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")

			case $? in
				0)
					user=$(echo $num | cut -d"|" -f1)
					numero=$(echo $num | cut -d"|" -f2)
					if [ -n "$user" ] && [ -n "$numero" ];then
						$(chage -M $numero $user &>/dev/null)
						if [ $? -eq 0 ];then
							$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Executado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						else
							$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						fi
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					fi
					;;
				1)
					;;
			esac

