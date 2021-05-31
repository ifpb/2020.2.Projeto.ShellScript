#!/bin/bash

#Adicionando leitura para dono, grupo, outros e todos.

adicionar-leitura-dono-arquivo(){
	chmod r+u $arquivo 
}
adicionar-leitura-grupo-arquivo(){
	chmod r+g $arquivo
}
adicionar-leitura-outros(){
	chmod r+o $arquivo
}
adicionar-leitura-todos(){
	chmod r+a $arquivo
}

#Adicionando escrita para dono, grupo, outros e todos.

adicionar-escrita-dono-arquivo(){
	chmod w+u $arquivo
}
adicionar-escrita-grupo-arquivo(){
	chmod w+g $arquivo
}
adicionar-escrita-outros(){
	chmod w+o $arquivo
}
adicionar-escrita-todos(){
	chmod w+a
}

#Adicionando execução para dono, grupo, outros e todos.
adicionar-execucao-dono-arquivo(){
	chmod x+u $arquivo
}
adicionar-execucao-grupo-arquivo(){
	chmod x+g $arquivo
}
adicionar-execucao-outros(){
	chmod x+o $arquivo
}
adicionar-execucao-todos(){
	chmod x+a $arquivo 
}
