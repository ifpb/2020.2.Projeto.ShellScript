#!/bin/bash

# Gerenciador de pacotes Snap (Snap-Manager)

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

while true; do						# Laço Principal 
							# Exibindo as opções do gerenciador
	echo -e "
**** Snap-Manager ****			

Menu Principal:

f - find : mostra snaps que podem ser instalados.		
i - install : instala snaps no sistema.
l - list : mostra os snaps instalados.
u - upgrade : atualiza snaps.
r : remove snaps instalados.
v : mostra informações sobre o programa.
q : encerrar o programa

"
	read -p "Snap-Manager > " opc			# solicitando entrada do usuário

	if [ $opc == "f" ]; then			# lista snaps disponíveis
		snap find
	
	elif [ $opc == "i" ]; then			# instalar snap
		echo -e "\nSnaps Disponíveis para instalação:\n"
		snap find
		read -p "Qual snap você deseja instalar? " snap
		snap install ${snap} 2> /dev/null
		
		if [ $? != "0" ]; then			# Se digitar errado o nome do snap
			echo -e "\nErro: Snap não encontrado! Voltando para o menu principal...\n"
		else
			echo -e "\n${snap} instalado com sucesso!\n "
		fi
	
	elif [ $opc == "r" ]; then			# remover um snap
		echo -e "\nSnaps Disponíveis para remoção:\n"
		snap list
		read -p "Qual snap você deseja remover? " snap
		snap remove ${snap} 2> /dev/null
		
		if [ $? != "0" ]; then			# Se digitar errado o nome do snap
			echo -e "\nErro: Snap não encontrado! Voltando para o menu principal...\n"
		else
			echo -e "\n${snap} removido com sucesso!\n "
		fi


	elif [ $opc == "l" ]; then			# lista snaps instalados
		echo -e "\nSnaps instalados:\n"
		snap list
		
	elif [ $opc == "u" ]; then			# atualizar todos snaps
		snap refresh
	
	elif [ $opc == "v" ]; then			# imprime informações sobre o snap
		snap --version		
	
	elif [ $opc == "q" ]; then			# encerra o programa
		echo -e "\nEncerrando o programa...
Até Logo!\n"
		break
	
	else
		echo -e "\nOpção inválida! Voltando para o Menu Principal...\n"

	fi	

done
