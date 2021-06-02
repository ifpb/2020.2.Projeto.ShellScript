#!/bin/bash

#Operações de Adição
#Adicionando leitura para dono, grupo, outros e todos.
adicionar-leitura-dono-arquivo(){
	chmod u+r $*
}
adicionar-leitura-grupo-arquivo(){
	chmod g+r $*
}
adicionar-leitura-outros(){
	chmod o+r $*
}
adicionar-leitura-todos(){
	chmod a+r $*
}

#Adicionando escrita para dono, grupo, outros e todos.
adicionar-escrita-dono-arquivo(){
	chmod u+w $*
}
adicionar-escrita-grupo-arquivo(){
	chmod g+w $*
}
adicionar-escrita-outros(){
	chmod o+w $*
}
adicionar-escrita-todos(){
	chmod a+w $*
}

#Adicionando execução para dono, grupo, outros e todos.
adicionar-execucao-dono-arquivo(){
	chmod u+x $*
}
adicionar-execucao-grupo-arquivo(){
	chmod g+x $*
}
adicionar-execucao-outros(){
	chmod o+x $*
}
adicionar-execucao-todos(){
	chmod a+x $*
}


#Operações de Remoção
#Remoção de Leitura
remover-leitura-dono-arquivo(){
	chmod u-r $* 
}
remover-leitura-grupo-arquivo(){
	chmod g-r $*
}
remover-leitura-outros(){
	chmod o-r $*
}
remover-leitura-todos(){
	chmod a-r $*
}

#Remoção de Escrita
remover-escrita-dono-arquivo(){
	chmod u-w $*
}
remover-escrita-grupo-arquivo(){
	chmod g-w $*
}
remover-escrita-outros(){
	chmod o-w $*
}
remover-escrita-todos(){
	chmod a-w $*
}

#Remoção de Execução
remover-execucao-dono-arquivo(){
	chmod u-x $*
}
remover-execucao-grupo-arquivo(){
	chmod g-x $*
}
remover-execucao-outros(){
	chmod p-x $*
}
remover-execucao-todos(){
	chmod a-x $* 
}

#Operação de Reinicilização
reiniciar-dono-arquivo(){
	chmod u= $*
}

reiniciar-grupo(){
	chmod g= $*
}

reiniciar-outros(){
	chmod p= $*
}

reiniciar-todos(){
	chmod a= $*
}
