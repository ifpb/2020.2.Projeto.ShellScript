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

snap_find(){
	chave=$(yad --title="Snap - Find" --text="Digite o nome do pacote:" --entry --center)
	snap find $chave &> /tmp/snap_manager
	yad --title="Lista de Snaps" --text="$(cat /tmp/snap_manager)"
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

yad --form \
	--title='Snap-Manager - Gerenciador de pacotes Snap'  \
	--text="Bem vindo $USER!" \
	--field="_INSTALAR":BTN "@bash -c snap_install" \
	--field="_REMOVER":BTN "@bash -c snap_remove" \
	--field="_ATUALIZAR":BTN "@bash -c snap_upgrade" \
	--field="_MEUS SNAPS":BTN "@bash -c snap_list" \
	--field="_PROCURAR":BTN "@bash -c snap_find" \
	--field="_SOBRE":BTN "@bash -c snap_version" \
	--columns=3 --button="_Sair":1
