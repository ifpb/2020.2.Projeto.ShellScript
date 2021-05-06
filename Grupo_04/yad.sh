#!/bin/bash

# Gerenciador de pacotes Snap (Snap-Manager YAD)
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
	#yad --text="$(snap find)"		#A saída do comando find é muito grande
	snap find > find_tmp.txt
	yad --text="$(cat find_tmp.txt)"
}

snap_install(){
	pacote=$(yad --title="Installer" --text="Digite o nome do pacote:" --entry)
	snap install $pacote			#a solicitação de de senha está aparecendo no terminal
}

snap_list(){
	yad --title="Lista de pacotes" --text="$(snap list)"
}

snap_upgrade(){
	yad --text="$(snap upgrade)"
}

snap_remove(){
	rmv=$(yad --title="Unistaller" --text="Digite o nome do pacote:" --entry)
	snap remove $rmv			#a solicitação de senha está aparecendo no terminal
}

snap_version(){
	yad --title="Versão do SNAP" --text="$(snap --version)" --width="220"
}

#expotando as funções

export -f snap_find snap_install snap_list snap_upgrade snap_remove snap_version

yad --title="Snap Manager" --center \
	--text="Escolha a opção desejada:" \
	--button="find":"bash -c snap_find" \
	--button="install":"bash -c snap_install" \
	--button="list":"bash -c snap_list" \
	--button="upgrade" \
	--button="remove":"bash -c snap_remove" \
	--button="version":"bash -c snap_version"\
	--button="Exit":0 --width:"640" --height="140"
