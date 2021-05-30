#!/bin/bash

source funcionalidades_permissoes.sh
source menu_permissoes.sh

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
		echo "Você escolheu visualizar o help sobre Stick Bits";;
	3)	
		echo "Você escolheu visualizr o help sobre Chattr"
		
esac
}


#Menus de Interação
Selecionar_Tipo_Arquivo() {
	zenity	--list \
		--width=450 \
		--height=350 \
		--title="Seleção de Arquivos" \
		--text="Selecione uma opcão" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Um arquivo" false 1 "Múltiplos Arquivos" false 2 "Diretório"
}

Menu_Selecionar_Permissoes() {
	zenity	--list \
		--width=450 \
		--height=350 \
		--title="Escolha as permissões" \
		--checklist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Executar" false 1 "Escrever" false 2 "Ler"
}

Menu_Selecionar_Atributos() {
	zenity 	--list \
		--width=450 \
		--height=350 \
		--title="Escolha as permissões" \
		--checklist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Atributo 1" false 1 "Atributo 2" false 2 "Atributo 3"
}


Menu_Selecionar_Usuarios() {
	zenity 	--list \
		--width=450 \
		--height=350 \
		--title="Escolha o usuário" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Usuário que é o Dono do Arquivo" false 1 "Usuários que não são do mesmo Grupo do arquivo" false 2 "Usúarios que são do mesmo Grupo do arquivo" false 3 "Todos os Usuários do Sistema"
}

Menu_Selecionar_Operador(){
	zenity 	--list \
		--width=450 \
		--height=350 \
		--title="Escolha o operador" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Adicionar Permissão" false 1 "Retirar Permissão" false 2 "Redifinir Permissões"
}



#Seleção de Arquivos e Diretório.
Selecionar_Arquivo() {
	zenity --file-selection --title="Selecione o arquivo"
}

Selecionar_Arquivos() {
	zenity --file-selection --multiple --title="Selecione os arquivos"
}

Selecionar_Diretorio() {
	zenity --file-selection --directory --title="Selecione o diretório"
}
