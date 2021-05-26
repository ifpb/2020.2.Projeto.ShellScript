#!/bin/bash

while true;
do
	$(yad --form --image ~/2020.2.Projeto.ShellScript/Grupo_02/Imagens/password.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Menu</b>\n<i>Senha</i>" --text-align=center \
		--expander="Opções" \
		--field="Trocar":FBTN "bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Senha/./trocar_pass.sh" \
		--field="Verificar E":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Senha/./exp_pass.sh" \
		--field="Bloquear":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Senha/./bloq_pass.sh" \
		--field="Desbloquear":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Senha/./desbloq_pass.sh" \
		--field="Alterar":FBTN "@bash -c ~/2020.2.Projeto.ShellScript/Grupo_02/Senha/./alt_pass.sh" \
		--columns=2 --borders=2 \
		--button="Voltar":1  --buttons-layout=center \
	       	--width="500" --height="400")

	if [ $? -gt 0 ];then
		break
	fi
done

