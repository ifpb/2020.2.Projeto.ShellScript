#!/bin/bash

$(awk -F":" '{if( $4 >= 1000 && $4  <= 29999) print $1}' /etc/passwd > /tmp/user_list.txt)
$(yad --form --image ./Imagens/list.png --image-on-top \
	--title"Administração de Sistemas" --text="<b>Lista de\nUsuário(s)</b>\n\n<i>$(awk '{print $1}' /tmp/user_list.txt)</i>" --text-align=center \
	--button="gtk-ok":0 --buttons-layout=center \
	--width="500" --height="400")


