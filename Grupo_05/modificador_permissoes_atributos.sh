#!/bin/bash

#################################################################################################
#Script Name	: Modificador de Permissões e Atributos Avançadas				#
#Description	: Realizar alterações na permissões e atributos de arquivos			#
#Args		: 										#
#Author		: Mateus Mota Mercẽs, Valesca Melo de Oliveira e Lucas Ferreira Prazere		#
#Email		: mateusmota0100@gmail.com, .. , .. #						#
#################################################################################################


source menu_principal.sh

Inicio() {
	zenity	--info \
		--width=450 \
		--height=350 \
		--title="Bem-vindo" \
		--text="Script para Modificação de Permissões e Atributos" 
	
		Menu_Principal
}

Inicio
