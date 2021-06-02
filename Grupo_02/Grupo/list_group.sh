#!/bin/bash

$(awk -F":" '{if( $3 >= 1000 && $3  <= 29999) print $1}' /etc/group > /tmp/.group_list.txt)
$(yad --form --image ./Imagens/list.png --image-on-top \
	--title"Administração de Sistemas" --text="<b>Lista de\nGrupo(s)</b>\n\n<i>$(awk '{print $1 }' /tmp/.group_list.txt)</i>" --text-align=center \
	--button="gtk-ok":0 --buttons-layout=center \
	--width="500" --height="400")
