#!/bin/bash

source menus_graficos.sh

Menu_Permissoes() {
		
    modo_arquivo="$(Menu_Selecionar_Tipo_Arquivo)"
		
		
		if [ "$modo_arquivo" == "0" ]; then
			arquivo="$(Selecionar_Arquivo)"
			permissoes="$(Menu_Selecionar_Permissoes)"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"
				
			#Condições para Adição de Permissões
			#Condições de Execução
			if [[ $permissoes =~ 0 && "$operador" == "0" && "$usuarios" == "0"]]; then
				adicionar-execucao-dono-arquivo $arquivo
			fi
			
			if [[ $permissoes =~ 0 && "$operador" == "0" && "$usuarios" == "1"]]; then
				adicionar-execucao-grupo-arquivo $arquivo
			fi
			
			if [[ $permissoes =~ 0 && "$operador" == "0" && "$usuarios" == "2"]]; then
				adicionar-execucao-outros $arquivo
			fi
			
			if [[ $permissoes =~ 0 && "$operador" == "0" && "$usuarios" == "3"]]; then
				adicionar-execucao-todos $arquivo
			fi	
			
			#Condições para Escrita
			
			#Condições para Leitura
			
			
			#Condições para Remoção de Permissões
			#Condições de Execução
			#Condições para Escrita
			#Condições para Leitura
			
		fi
		
		if [ "$modo_arquivo" == "1" ]; then
			arquivos="$(Selecionar_Arquivos)"
			permissoes="$(Menu_Selecionar_Permissoes)"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"
				
		fi
	
		if [ "$modo_arquivo" == "2" ]; then 
			diretorio="$(Selecionar_Diretorio)"
			permissoes="$(Menu_Selecionar_Permissoes)"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"

		fi

}
