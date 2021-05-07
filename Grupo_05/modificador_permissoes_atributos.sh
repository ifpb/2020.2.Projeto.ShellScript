#!/bin/bash

#################################################################################################
#Script Name	: Modificador de Permissões e Atributos Avançadas				#
#Description	: Realizar alterações na permissões e atributos de arquivos			#
#Args		: 										#
#Author		: Mateus Mota Mercẽs, Valesca Melo de Oliveira e Lucas Ferreira Prazere		#
#Email		: mateusmota0100@gmail.com, .. , .. #						#
#################################################################################################

Principal() {
	echo "------------------------------------------------"
	echo "Script para Modificação de Permissões e Atributos"
	echo "------------------------------------------------"
	echo -e " Opções: \n"
	echo -e "1) Modificar Permissão\n2) Modificar Atributo\n3) Help Stick Bits\n4) Help Chatrir\n5) Sair do script"
	
	read -p "Escolha uma opção: " opcao

} 

Principal
