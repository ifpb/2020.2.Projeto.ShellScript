#!/bin/bash

usuario=$(yad --form --image ./Imagens/add-user.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Criar</b>\n<i>Usuário</i>" --text-align=center \
	       	--field="Nome" \
		--field="Senha":H \
		--field="Digite novamente":H \
		--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
		--width="500" --height="400")
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
								$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Excutado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
						
							else
								$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
							fi

						else
							senha=$(yad --form --image ./Imagens/key.png --image-on-top \
								--title="Administração de Sistemas" --center --text="<b>Senhas Diferentes\nDigite a senha novamente\n\nA senha precisa ser [A5s!mm]</b>" --text-align=center \
								--field="Senha":H \
								--field="Digite novamente":H \
								--button="Voltar":1 --button="gtk-ok":0 --buttons-layout=edge \
								--width="500" --height="400")

							passw1=$(echo $senha | cut -d'|' -f1)
							passw2=$(echo $senha | cut -d'|' -f2)
							if [ "${passw1}" == "${passw2}" ] && echo $passw1 | grep -P "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[[:punct:]]){6,}" &> /dev/null;then
								echo $senha | cut -d'|' -f1,2 | tr -s '|' '\n' > /tmp/.senhas1.txt
								for i in $(seq 1 6);do echo " " >> /tmp/.senhas1.txt ; done
								$(adduser $user < /tmp/.senhas1.txt &>/dev/null)
								if [ $? -eq 0 ];then
									$(chage -I 10 -M 50 $user &>/dev/null)
									$(yad --title="System" --center --image ./Imagens/sucess.png --image-on-top --text="<b>Excutado com Sucesso</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
								else
									$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Executar</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
								fi
							else
								$(yad --title="System" --center --image ./Imagens/info.png --image-on-top --text="<b>Falha ao Excutar </b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
							fi
						fi
					else
						$(yad --title="System" --center --image ./Imagens/error.png --image-on-top --text="<b>ERROR - Parâmetro não Encontrado</b>" --text-align=center --button="gtk-ok":0 --buttons-layout=center --width="500" --height="400")
					fi
					;;

				1)

					;;

			esac
