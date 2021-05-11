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
		--width=350 \
		--height=150 \
		--title="Bem-vindo" \
		--text="Script para Modificação de Permissões e Atributos" 

}



Menu_Principal() {
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
		opcao="$(Menu_Secundario)"
		permissoes="$(Menu_Permissoes)"
		;;
	1)
		opcao="$(Menu_Secundario)"
		atributos="$(Menu_Atributos)"
		;;
	2)	
		echo "Você escolheu visualizar o help sobre Stick Bits";;
	3)	
		echo "Você escolheu visualizr o help sobre Chattr"

esac

} 



Menu_Secundario() {
	permissoes=$(zenity --list \
		--width=350 \
		--height=250 \
		--title="" \
		--text="" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Um arquivo" false 1 "Múltiplos Arquivos" false 2 "Diretório")

}


Menu_Permissoes() {
	echo ""	
}

Menu_Atributos() {
	echo ""
}

Selecionar_Arquivo() {
	arquivo="$(zenity --file-selection --title="Selecione o arquivo")"
}

Selecionar_Arquivos() {
	arquivos="$(zenity --file-selection --multiple --title="Selecione os arquivos")"
}

Inicio
Menu_Principal
