#!/bin/bash

while true; do
	$(yad --form --image ~/2020.2.Projeto.ShellScript/Grupo_02/Imagens/flamengo.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Bem vindo</b> <i>$(whoami)</i>" --text-align=center \
		--expander="Opções" \
		--field="Usuário":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Usuario/usermenu.sh" \
		--field="Grupo":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./groupmenu.sh" \
		--field="Senha":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Senha/./passwordmenu.sh" \
		--columns=1 --borders=2 \
		--button="gtk-stop":1  --buttons-layout=center \
	       	--width="500" --height="400")

	if [ $? -gt 0 ];then
	       	break
	fi

done

