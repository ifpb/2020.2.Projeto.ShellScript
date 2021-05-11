#!/bin/bash

#################################################################################################
#Script Name	: Modificador de Permissões e Atributos Avançadas				#
#Description	: Realizar alterações na permissões e atributos de arquivos			#
#Args		: 										#
#Author		: Mateus Mota Mercẽs, Valesca Melo de Oliveira e Lucas Ferreira Prazere		#
#Email		: mateusmota0100@gmail.com, .. , .. #						#
#################################################################################################

Principal() {
	zenity	--info \
		--width=350 \
		--height=100 \
		--title="Bem-vindo" \
		--text="Script para Modificação de Permissões e Atributos" 

}

Menu() {
	escolha=$(zenity --list	\
		--width=350 \
		--height=250 \
		--title "Script para Modificação de Permissões e Atributos" \
		--text="Escolha uma das opções abaixo"                      \
		--radiolist                                                 \
		--hide-column 2                                             \
       		--column="Marque" --column="" --column="Opções" false 0 "Modificar Permissão" false 1 "Modificar Atributo" false 2 "Help Stick Bits" false 3 "Help Chatrir")				

case $escolha in
	0)
		#Implementar funcionalidade para Modificar Permissão.
		arquivo="$(zenity --file-selection --title="Selecione o arquivo")"
		;;
	1)
		#Implementar funcionalidade para Modificar Permissão.
		arquivo="$(zenity --file-selection --title="Selecione o arquivo")"
		;;
	2)	
		echo "Você escolheu visualizar o help sobre Stick Bits";;
	3)
		echo "Você escolheu visualizr o help sobre Chattr"

esac

} 

Principal
Menu
