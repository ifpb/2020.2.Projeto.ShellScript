#!/bin/bash

source funcionalidades_permissoes.sh
source menu_permissoes.sh
source help_sticky_bit.sh

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
		Menu_Permissoes
		;;
	1)
		modo_arquivo="$(Menu_Tipo_Arquivo)"
		
		
		if [ "$modo_arquivo" == "0" ]; then
			arquivo="$(Menu_Selecionar_Arquivo)"
			atributos="$(Menu_Selecionar_Atributos)"
		fi

		if [ "$modo_arquivo" == "1" ]; then
			arquivos="$(Menu_Selecionar_Arquivos)"
			atributos="$(Menu_Selecionar_Atributos)"

		fi

		if [ "$modo_arquivo" == "2" ]; then
			diretorio="$(Menu_Selecionar_Diretorio)"
			atributos="$(Menu_Selecionar_Atributos)"
		fi
		;;
	2)	
		Help_Sticky_Bit
		;;
	3)	
		echo "Você escolheu visualizr o help sobre Chattr"
		
esac
}
