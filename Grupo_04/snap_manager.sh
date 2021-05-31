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


#VARIÁVIES

nome="Snap Manager 1.0"

export nome

#Solicitando a senha de administrador

if [ "$(id -nu)" != "root" ]; then
        sudo -k
	senha=$(yad --window-icon=tux_mengao.png --title="$nome - Policy" --center --text="Olá $USER, por favor autentique para continuar:" --width="300" --entry --hide-text)
        exec sudo -S -p '' "$0" "$@" <<< "$senha"
	exit -1
fi


#FUNÇÕES DO SCRIPT

snap_find(){ 	
	
	rm /tmp/snap_install /tmp/snap_install_resultado &> /dev/null
	chave=$(yad --window-icon=tux_mengao.png --title="$nome - Buscar" --text="Digite o nome do pacote:" --entry --center)
	
	if [ -n "$chave" ] && [ "$chave" != 1 &> /dev/null ]; then
	       yad --window-icon=tux_mengao.png --title="$nome - Busca" --text="Resultado da busca por <i>$chave</i>" --list --center --width="500" --height="500"  --separator=" " --button=gtk-cancel:1 --button=gtk-add:0 --checklist --column "Instalar " --column "Snap" --column "Versão" $(snap find "${chave}" 2> /dev/null | awk 'NR>1 {printf "FALSE "$1" "$2" "}') | awk '{print $2}' > /tmp/snap_install 2> /dev/null
	fi
	
	if [ -e /tmp/snap_install ]; then
		
		for linha in $(cat /tmp/snap_install); do
			sudo snap install $linha | yad --progress --auto-kill --auto-close --percentage=0 --pulsate --progress-text="Instalando $linha, aguarde..." --title="$nome" --width="300" --center --no-buttons --window-icon=tux_mengao.png
			
			if [ $? == "0" ]; then
				echo -e "$linha instalado com sucesso!" >> /tmp/snap_install_resultado
			else
				echo -e "erro: $linha não foi instalado!" >> /tmp/snap_install_resultado
			fi
		done
	fi
	
	if [ -e /tmp/snap_install_resultado ]; then
		yad --text="$(cat /tmp/snap_install_resultado)" --center --title="$nome" --button=gtk-ok:0 --window-icon=tux_mengao.png
	fi
}

snap_upgrade(){
	sudo snap refresh &> /tmp/snap_manager
	yad --text="$(cat /tmp/snap_manager)" --center --title --title="$nome" --button=gtk-close:0 --window-icon=tux_mengao.png

}

snap_list(){
	rm /tmp/snap_remove /tmp/snap_remove_resultado &> /dev/null
	yad --window-icon=tux_mengao.png --title="$nome - Meus Snaps" --list --center --width="500" --height="500"  --separator=" " --button=gtk-cancel:1 --button=gtk-remove:0 --checklist --column "Remover" --column "Snap" --column "Versão" $(snap list | awk 'NR>1 {printf "FALSE "$1" "$2" "}') | awk '{print $2}' > /tmp/snap_remove
	if [ -e /tmp/snap_remove ]; then
		
		for linha in $(cat /tmp/snap_remove); do
			sudo snap remove $linha | yad --progress --auto-kill --auto-close --percentage=0 --pulsate --progress-text="Removendo $linha, aguarde..." --title="$nome" --width="300" --center --no-buttons --window-icon=tux_mengao.png
			
			if [ $? == "0" ]; then
				echo -e "$linha removido com sucesso!" >> /tmp/snap_remove_resultado
			else
				echo -e "Erro: $linha não foi removido!" >> /tmp/snap_remove_resultado
			fi
		done
	fi
	
	if [ -e /tmp/snap_remove_resultado ]; then
		yad --text="$(cat /tmp/snap_remove_resultado)" --center --title="$nome" --button=gtk-ok:0 --window-icon=tux_mengao.png
	fi
}

snap_version(){
	snap --version &> /tmp/snap_version.txt
	yad --title="$nome" --text="Criadores:\nLeonardo Carneiro\nMarcos Ugulino\nAdrieny Dantas" --text-info --back="gainsboro" </tmp/snap_version.txt --image=tux3.png --image-on-top --width=300 --height=320 --borders=8 --button=gtk-close:0 &> /dev/null
}

#Expotando as funções

export -f snap_find snap_list snap_upgrade snap_version


#Tela de apresentação
yad --title="$nome" --image tela_inicial.jpeg --image-on-top \
	--center --no-buttons --timeout=2 --window-icon=tux_mengao.png


#Tela principal do programa
yad --form --center --title="$nome - Gerenciador de pacotes Snap"  \
	--width="600" --height="300" \
	--image tela_inicial.jpeg --image-on-top \
	--text "<big><b>Snap Manager</b></big>\n\nGerenciador de <b>Snaps</b> para o <big><b>Linux</b></big>\n\nVersão 1.0" --text-align=center\
	--field="_MEUS SNAPS":BTN "@bash -c snap_list" \
	--field="_ATUALIZAR":BTN "@bash -c snap_upgrade" \
	--field="_PESQUISAR":BTN "@bash -c snap_find" \
	--field="_SOBRE":BTN "@bash -c snap_version" \
	--columns=2 --button=gtk-close:1 \
	--window-icon=tux_mengao.png
