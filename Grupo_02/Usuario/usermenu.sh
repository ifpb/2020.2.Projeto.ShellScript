#!/bin/bash

while true;
do
	$(yad --form --image ~/2020.2.Projeto.ShellScript/Grupo_02/Imagens/user.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Menu</b>\n<i>Usuário</i>" --text-align=center \
		--expander="Opções" \
		--field="Criar":FBTN "bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Usuario/./add_user.sh" \
		--field="Remover":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Usuario/./remove_user.sh" \
		--field="Alterar":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Usuario/./alt_user.sh" \
		--field="Listar":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Usuario/./list_user.sh" \
		--columns=2 --borders=2 \
		--button="Voltar":1  --buttons-layout=center \
	       	--width="500" --height="400")

	if [ $? -gt 0 ];then
		break
	fi
done

