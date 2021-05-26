#!/bin/bash

while true;
do
	$(yad --form --image ~/2020.2.Projeto.ShellScript/Grupo_02/Imagens/group.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Menu</b>\n<i>Grupo</i>" --text-align=center  \
		--expander="Opções" \
		--field="Criar":FBTN "bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./criar_group.sh" \
		--field="Excluir":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./excluir_group.sh" \
		--field="Adicionar":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./add_group.sh" \
		--field="Remover":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./deluser_group.sh" \
		--field="Alterar F/D":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./alt_group.sh" \
		--field="Listar":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./list_group.sh" \
		--field="Listar G/U":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Grupo/./listuser_group.sh" \
		--columns=2 --borders=2 \
		--button="Voltar":1  --buttons-layout=center \
	       	--width="500" --height="400")

	if [ $? -gt 0 ];then
		break
	fi
done

