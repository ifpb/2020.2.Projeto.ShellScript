#!/bin/bash

USUARIO=$(ls -l | cut -d" " -f4 | tail -n 1)


while true; do
	$(yad --form --image ./Imagens/flamengo.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Bem vindo</b> <i>$USUARIO</i>" --text-align=center \
		--expander="Opções" \
		--field="Usuário":FBTN "@bash -c ./Usuario/usermenu.sh" \
		--field="Grupo":FBTN "@bash -c ./Grupo/groupmenu.sh" \
		--field="Senha":FBTN "@bash -c ./Senha/passwordmenu.sh" \
		--columns=1 --borders=2 \
		--button="gtk-stop":1  --buttons-layout=center \
	       	--width="500" --height="400")

	if [ $? -gt 0 ];then
	       	break
	fi

done

