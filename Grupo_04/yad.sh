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
	pacote=$(yad --title="Install" --text="Digite o nome do pacote:" --entry --center)
	sudo snap install $pacote &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" --center 	#a solicitação de senha está aparecendo no terminal
}

snap_list(){
	yad --title="Snaps Instalados" --text="$(snap list)" --center
}

snap_upgrade(){
	sudo snap refresh &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" --center
}

snap_remove(){
	rmv=$(yad --title="Unistall" --text="Digite o nome do pacote:" --entry --center)
	sudo snap remove $rmv &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" --center	#a solicitação de senha está aparecendo no terminal
}

snap_version(){
	yad --title="Versão do SNAP" --text="$(snap --version)" --width="220" --center
}

#expotando as funções

export -f snap_find snap_install snap_list snap_upgrade snap_remove snap_version

yad --title="Snap Manager" --center \
	--text="						Gerenciador de pacotes Snap (Snap-Manager YAD)

Opções:

find - mostra snaps que podem ser instalados.
install - instala snaps no sistema.
list - mostra os snaps instalados.
upgrade - atualiza todos snaps.
remove - remove snaps instalados.
version - mostra informações sobre o programa." \
	--button="find":"bash -c snap_find" \
	--button="install":"bash -c snap_install" \
	--button="list":"bash -c snap_list" \
	--button="upgrade":"bash -c snap_upgrade" \
	--button="remove":"bash -c snap_remove" \
	--button="version":"bash -c snap_version"\
	--button="Exit":0 --width:"640" --height="480"
