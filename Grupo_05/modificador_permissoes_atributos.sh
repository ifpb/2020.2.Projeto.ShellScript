#!/bin/bash

#################################################################################################
#Script Name	: Modificador de Permissões e Atributos Avançadas				#
#Description	: Realizar alterações na permissões e atributos de arquivos			#
#Args		: 										#
#Author		: Mateus Mota Mercẽs, Valesca Melo de Oliveira e Lucas Ferreira Prazere		#
#Email		: mateusmota0100@gmail.com, .. , .. #						#
#################################################################################################



Inicio() {
	zenity	--info \
		--width=450 \
		--height=300 \
		--title="Bem-vindo" \
		--text="Script para Modificação de Permissões e Atributos" 
	
	Menu_Principal
}

Menu_Principal() {
	escolha=$(zenity --list	\
		--width=450 \
		--height=350 \
		--title="Script para Modificação de Permissões e Atributos" \
		--text="Escolha uma das opções abaixo"                      \
		--radiolist                                                 \
		--hide-column=2                                             \
       		--column="Marque" --column="" --column="Opções" false 0 "Modificar Permissão" false 1 "Modificar Atributo" false 2 "Help Stick Bits" false 3 "Help Chatrir")				

case $escolha in
	0)	
		opcao="$(Menu_Secundario)"
		if [ "$opcao" == "0" ]; then
			arquivo="$(Selecionar_Arquivo)"
			permissoes="$(Menu_Permissoes)"
		fi
		
		if [ "$opcao" == "1" ]; then
			arquivos="$(Selecionar_Arquivos)"
			permissoes="$(Menu_Permissoes)"	
		fi
	
		if [ "$opcao" == "2" ]; then 
			diretorio="$(Selecionar_Diretorio)"
			permissoes="$(Menu_Permissoes)"
		fi
		;;
	1)
		opcao="$(Menu_Secundario)"
		if [ "$opcao" == "0" ]; then
			arquivo="$(Selecionar_Arquivo)"
			atributos="$(Menu_Atributos)"
		fi

		if [ "$opcao" == "1" ]; then
			arquivos="$(Selecionar_Arquivos)"
			atributos="$(Menu_Atributos)"

		fi

		if [ "$opcao" == "2" ]; then
			diretorio="$(Selecionar_Diretorio)"
			atributos="$(Menu_Atributos)"
		fi
		;;
	2)	
		echo "Você escolheu visualizar o help sobre Stick Bits";;
	3)	
		echo "Você escolheu visualizr o help sobre Chattr"

esac

Inicio

