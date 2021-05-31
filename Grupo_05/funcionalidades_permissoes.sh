#!/bin/bash

#Operações de Adição
#Adicionando leitura para dono, grupo, outros e todos.
adicionar-leitura-dono-arquivo(){
	chmod u+r $arquivo 
}
adicionar-leitura-grupo-arquivo(){
	chmod g+r $arquivo
}
adicionar-leitura-outros(){
	chmod o+r $arquivo
}
adicionar-leitura-todos(){
	chmod a+r $arquivo
}

#Adicionando escrita para dono, grupo, outros e todos.
adicionar-escrita-dono-arquivo(){
	chmod u+w $arquivo
}
adicionar-escrita-grupo-arquivo(){
	chmod g+w $arquivo
}
adicionar-escrita-outros(){
	chmod o+w $arquivo
}
adicionar-escrita-todos(){
	chmod a+w
}

#Adicionando execução para dono, grupo, outros e todos.
adicionar-execucao-dono-arquivo(){
	chmod u+x $arquivo
}
adicionar-execucao-grupo-arquivo(){
	chmod g+x $arquivo
}
adicionar-execucao-outros(){
	chmod o+x $arquivo
}
adicionar-execucao-todos(){
	chmod a+x $arquivo 
}


#Operações de Remoção
#Remoção de Leitura
remover-leitura-dono-arquivo(){
	chmod u-r $arquivo 
}
remover-leitura-grupo-arquivo(){
	chmod g-r $arquivo
}
remover-leitura-outros(){
	chmod o-r $arquivo
}
remover-leitura-todos(){
	chmod a-r $arquivo
}

#Remoção de Escrita
remover-escrita-dono-arquivo(){
	chmod u-w $arquivo
}
remover-escrita-grupo-arquivo(){
	chmod g-w $arquivo
}
remover-escrita-outros(){
	chmod o-w $arquivo
}
remover-escrita-todos(){
	chmod a-w $arquivo
}

#Remoção de Execução
remover-execucao-dono-arquivo(){
	chmod u-x $arquivo
}
remover-execucao-grupo-arquivo(){
	chmod g-x $arquivo
}
remover-execucao-outros(){
	chmod p-x $arquivo
}
remover-execucao-todos(){
	chmod a-x $arquivo 
}
