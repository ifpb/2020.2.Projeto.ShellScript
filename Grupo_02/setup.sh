#!/bin/bash

if [ "$(id -nu)" != "root" ]; then
        sudo -k
        senha=$(yad --title="Autenticação" --text="Este script requer privilégios administrativos. Por favor autentique abaixo para iniciar o programa." --width="200" --entry --hide-text)
        exec sudo -S -p '' "$0" "$@" <<< "$senha"
        exit -1
fi


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

