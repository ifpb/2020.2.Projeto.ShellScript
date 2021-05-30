#!/bin/bash

source menus_graficos.sh

Menu_Permissoes() {
		
    modo_arquivo="$(Menu_Selecionar_Tipo_Arquivo)"
		
		
		if [ "$modo_arquivo" == "0" ]; then
			arquivo="$(Selecionar_Arquivo)"
			permissoes="$(Menu_Selecionar_Permissoes)"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"
				

			if [[ $permissoes =~ 0 && "$operador" == "0" ]]; then
				adicionar-execucao $arquivo
			fi
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
