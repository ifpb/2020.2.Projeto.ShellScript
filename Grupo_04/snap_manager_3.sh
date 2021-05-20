#!/bin/bash

#Gerenciador de pacotes Snap (Snap-Manager YAD)
#find : mostra snaps que podem ser instalados.
#info : mostra informações detalhadas sobre os snaps.
#install : instala snaps no sistema.
#list : mostra os snaps instalados.
#refresh : atualiza snaps.
#remove : remove snaps instalados.
#revert : reverte o estado de um snap.
#start : inicializa serviços.
#stop : para serviços.
#-h ou −−help  : mostra opções do comando.
#−−version : mostra informações sobre o programa.

#funções para trabalhar os comandos do snap

nome="Snap-Manager BETA"

snap_find(){ 	
	
#tá massa mas ainda falta colocar barra de progresso par quando tiver instalando os snaps mostrar... tem como fazer!

	rm /tmp/snap_install &> /dev/null
	chave=$(yad --title="Snap-Manager - Buscar" --text="Digite o nome do pacote:" --entry --center)
	yad --title="Snap Manager - Busca" --text="Resultado da busca por <i>$chave</i>" --list --center --width="500" --height="600"  --separator=" " --button=gtk-instalar:0 --checklist --column " " --column "Snap" --column "Descrição" $(snap find "${chave}" | awk 'NR>1 {printf "FALSE "$1" "$5" "}') | awk '{print $2}' > /tmp/snap_install
	#yad --text="$(cat /tmp/snap_install)" #programas a serem instalados	
	if [ -e /tmp/snap_install ]; then
		for linha in $(cat /tmp/snap_install); do
			sudo snap install $linha &> /tmp/snap_install_resultado
		done
	fi
	if [ -e /tmp/snap_install_resultado ]; then
		yad --text="$(cat /tmp/snap_install_resultado)"
	fi
}

snap_install(){
	pacote=$(yad --title="Instalar Snap" --text="Digite o nome do pacote:" --entry --center) 
	sudo snap install $pacote &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" 	 	#a solicitação de senha está aparecendo no terminal

}

snap_list(){
	yad --title="Snaps Instalados" --text="$(snap list)" --center
}

snap_upgrade(){
	sudo snap refresh &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" --center --timeout=2 --no-buttons
}

snap_remove(){
	rmv=$(yad --title="Remover Snap" --text="Digite o nome do pacote:" --entry --center)
	sudo snap remove $rmv &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" --center	#a solicitação de senha está aparecendo no terminal
}

snap_version(){
	yad \
		--title="Sobre" \
		--text="$(snap --version)" --center \
		--button="Ok"
}

#expotando as funções

export -f snap_find snap_install snap_list snap_upgrade snap_remove snap_version

#tela de apresentação
yad --title='Snap-Manager-Beta' --image tela_inicial.jpeg --image-on-top \
	--center --no-buttons --timeout=2
	#--width="300" --height="300" \
	#--text="Snap-Manager Beta\n\nBem vindo $USER" --text-align=center \
	
#tela principal do programa
yad --form --center --title='Snap-Manager - Gerenciador de pacotes Snap'  \
	--width="560" --height="300" \
	--image tela_inicial.jpeg --image-on-top \
	--text "<big><b>Snap-Manager BETA</b></big>\n\nGerenciador de <b>Snaps</b> para o <big><b>Linux</b></big>" \
	--field="_ATUALIZAR":BTN "@bash -c snap_upgrade" \
	--field="BUSCAR":BTN "@bash -c snap_find" \
	--field="_MEUS SNAPS":BTN "@bash -c snap_list" \
	--field="_VERSÃO":BTN "@bash -c snap_version" \
	--columns=2 --button="_Sair":1

