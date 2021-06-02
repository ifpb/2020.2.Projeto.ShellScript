#!/bin/bash

#Menus de Interação
Menu_Selecionar_Tipo_Arquivo() {
	zenity	--list \
		--width=450 \
		--height=350 \
		--title="Seleção de Arquivos" \
		--text="Selecione uma opcão" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Um arquivo" false 1 "Múltiplos arquivos" false 2 "Diretório"
}

Menu_Selecionar_Permissoes() {
	zenity	--list \
		--width=450 \
		--height=350 \
		--title="Escolha as permissões" \
		--text="Selecione alguma das opções abaixo" \
		--checklist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Execução" false 1 "Escrita" false 2 "Leitura"
}

Menu_Selecionar_Atributos() {
	zenity 	--list \
		--width=450 \
		--height=350 \
		--title="Escolha os atributos" \
		--checklist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Não modifica a hora de acesso. (Necessário root)" false 1 "Append-Only. (Necessário root)" false 2 "Permite compactação nos arquivos." false 3 "'i' Arquivos imutáveis não podem ser modificados. (Necessário root)" false 4 "O arquivo especificado é marcado como apagamento seguro." false 5 "O arquivo especificado é marcado como recuperável." false 6 "Retirar todos os atributos."
}


Menu_Selecionar_Usuarios() {
	zenity 	--list \
		--width=450 \
		--height=350 \
		--title="Escolha o usuário" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Usuário que é o Dono do Arquivo" false 1 "Usuários que são do mesmo Grupo do arquivo" false 2 "Outros Usúarios que não são do mesmo Grupo do arquivo" false 3 "Todos os Usuários do Sistema"
}

Menu_Selecionar_Operador() {
	zenity 	--list \
		--width=450 \
		--height=350 \
		--title="Escolha o operador" \
		--radiolist \
		--hide-column=2 \
		--column="Marque" --column="" --column="Opções" false 0 "Adicionar Permissões" false 1 "Retirar Permissões" false 2 "Redefinir Permissões"
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
