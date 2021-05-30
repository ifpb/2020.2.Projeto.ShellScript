#!/bin/bash

source menus_graficos.sh

Menu_permissoes() {
		
    modo_arquivo="$(Menu_Tipo_Arquivo)"
		
		
		if [ "$modo_arquivo" == "0" ]; then
			arquivo="$(Selecionar_Arquivo)"
			operador="$(Menu_Operador)"
			usuarios="$(Menu_Usuarios)"
			permissoes="$(Menu_Permissoes)"	

			if [[ $permissoes =~ 0 && "$operador" == "0" ]]; then
				adicionar-execucao $arquivo
			fi
		fi
		
		if [ "$modo_arquivo" == "1" ]; then
			arquivos="$(Selecionar_Arquivos)"
			usuarios="$(Menu_Usuarios)"
			permissoes="$(Menu_Permissoes)"
			operador="$(Menu_Operador)"	
		fi
	
		if [ "$modo_arquivo" == "2" ]; then 
			diretorio="$(Selecionar_Diretorio)"
			usuarios="$(Menu_Usuarios)"
			permissoes="$(Menu_Permissoes)"
			operador="$(Menu_Operador)"
		fi

}
