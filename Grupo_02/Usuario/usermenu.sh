#!/bin/bash

while true;
do

	$(yad --form --image ./Imagens/user.png --image-on-top \
		--title="Administração de Sistemas" --center --text="<b>Menu</b>\n<i>Usuário</i>" --text-align=center \
		--expander="Opções" \
		--field="Criar":FBTN "bash -c ./Usuario/add_user.sh" \
		--field="Remover":FBTN "@bash -c ./Usuario/remove_user.sh" \
		--field="Alterar":FBTN "@bash -c ./Usuario/alt_user.sh" \
		--field="Listar":FBTN "@bash -c ./Usuario/list_user.sh" \
		--columns=2 --borders=2 \
		--button="Voltar":1  --buttons-layout=center \
	       	--width="500" --height="400")


	if [ $? -gt 0 ];then
		break
	fi
done

