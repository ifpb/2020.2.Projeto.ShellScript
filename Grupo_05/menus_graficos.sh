#!/bin/bash

#Menus da Interface Gráfica
Menu_Secundario() {
	zenity	--list \
		--width=450 \
		--height=300 \
		--title="Seleção de Arquivos" \
		--text="Selecione uma opcão" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Um arquivo" false 1 "Múltiplos Arquivos" false 2 "Diretório"
}

Menu_Permissoes() {
	zenity	--list \
		--width=450 \
		--height=300 \
		--title="Escolha as permissões" \
		--checklist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Executar" false 1 "Escrever" false 2 "Ler"
}

Menu_Atributos() {
	zenity 	--list \
		--width=450 \
		--height=300 \
		--title="Escolha as permissões" \
		--checklist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Atributo 1" false 1 "Atributo 2" false 2 "Atributo 3"
}


Menu_Usuarios() {
	zenity 	--list \
		--width=450 \
		--height=300 \
		--title="Escolha o usuário" \
		--radiolist \
		--hide-column 2 \
		--column="Marque" --column="" --column="Opções" false 0 "Usuário que é o Dono do Arquivo" false 1 "Usuários que não são do mesmo Grupo do arquivo" false 2 "Usúarios que são do mesmo Grupo do arquivo" false 3 "Todos os Usuários do Sistema"
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

