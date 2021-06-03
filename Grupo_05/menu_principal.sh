#!/bin/bash

source menu_permissoes.sh
source menu_atributos.sh
source funcionalidades_help.sh

Menu_Principal() {
	escolha=$(zenity --list	\
		--width=450 \
		--height=350 \
		--title="Script para Modificação de Permissões e Atributos" \
		--text="Escolha uma das opções abaixo"                      \
		--radiolist                                                 \
		--hide-column=2                                             \
       		--column="Marque" --column="" --column="Opções" false 0 "Modificar Permissão" false 1 "Modificar Atributo" false 2 "Help Stick Bits" false 3 "Help Chatrr")				

case $escolha in
	0)	
		Menu_Permissoes
		;;
	1)
		Menu_Atributos
		;;

	2)
		Help_Sticky_Bit
		;;
	3)
		Help_Chattr

esac
}
