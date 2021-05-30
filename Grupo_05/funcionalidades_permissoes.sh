#!/bin/bash

#Adicionando leitura para dono, grupo, outros e todos.
#teste
adicionar-leitura-dono-arquivo(){
	chmod +ru $arquivo 
}
adicionar-leitura-grupo-arquivo(){
	chmod +rg $arquivo
}
adicionar-leitura-outros(){
	chmod +ro $arquivo
}
adicionar-leitura-todos(){
	chmod +ra $arquivo
}

#Adicionando escrita para dono, grupo, outros e todos.

adicionar-escrita-dono-arquivo(){
	chmod +wu $arquivo
}
adicionar-escrita-grupo-arquivo(){
	chmod +wg $arquivo
}
adicionar-escrita-outros(){
	chmod +wo $arquivo
}
adicionar-escrita-todos(){
	chmod +wa
}

#Adicionando execução para dono, grupo, outros e todos.

adicionar-execucao-dono-arquivo(){
	chmod +xu $arquivo
}
adicionar-execucao-grupo-arquivo(){
	chmod +xg $arquivo
}
adicionar-execucao-outros(){
	chmod +xo $arquivo
}
adicionar-execucao-todos(){
	chmod +xa
}
