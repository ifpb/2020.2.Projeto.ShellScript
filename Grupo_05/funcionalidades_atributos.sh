#!/bin/bash

#Adicionando atributos 
adiciona-atributoA(){
	sudo chattr +A $* #Não modifica a hora de acesso de arquivos. #root
}
adiciona-atributo-a(){
	sudo chattr +a $* #Append-Only, o conteúdo poderá somente ser adicionado ao final do arquivo.
#Em diretórios faz com que os arquivos sejam apenas adicionados.
#Somente o root pode especificar ou retirar este atributo.
}
adiciona-atributo-c(){
	chattr +c $* #Permite compactação nos arquivos especificados de forma transparente para o usuário. 
}
adiciona-atributo-i(){
	sudo chattr +i $* #Arquivos imutáveis não podem ser modificados.
}
adiciona-atributo-s(){
	chattr +s $* #O arquivo especificado é marcado como apagamento seguro.
}
adiciona-atributo-u(){
	chattr +u $* #O arquivo especificado é marcado como recuperável.
}

#Retirando atributos dos arquivos.
retira-atributoA(){
	sudo chattr -A $*
}
retira-atributo-a(){
	sudo chattr -a $* #válido apenas para root.
}
retira-atributo-c(){
	chattr -c $*
}
retira-atributo-i(){
	sudo chattr -i $*
#Em diretórios, faz com que arquivos não possam ser adicionados ou apagados.
#Somente o usuário root pode especificar ou retirar este atributo.
}
retira-atributo-s(){
	chattr -s $*
}
retira-atributo-u(){
	chattr -u $*
}
retira-todos-atributos(){
	sudo chattr = $*
}

