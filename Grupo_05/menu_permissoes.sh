#!/bin/bash

source menus_graficos.sh
source funcionalidades_permissoes.sh

Menu_Permissoes() {
		
    modo_arquivo="$(Menu_Selecionar_Tipo_Arquivo)"
			
		if [ "$modo_arquivo" == "0" ]; then
			arquivo="$(Selecionar_Arquivo)"
			permissoes="$(Menu_Selecionar_Permissoes | sed 's/|//g')"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"
			verifica_execucao="0"
			verifica_escrita="0"
			verifica_leitura="0"
	

			for (( i=0; i<${#permissoes}; i++ )); do
				#Condições para Adição de Permissões
				#Condições de Execução
				if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
					if [[ "$operador" == "0" && "$usuarios" == "0" ]]; then
						adicionar-execucao-dono-arquivo $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "1" ]]; then
						adicionar-execucao-grupo-arquivo $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "2" ]]; then
						adicionar-execucao-outros $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "3" ]]; then
						adicionar-execucao-todos $arquivo
					fi
					verifica_execucao="1"
				fi

				#Condições para Escrita
				if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
					if [[ "$operador" == "0" && "$usuarios" == "0" ]]; then
						adicionar-escrita-dono-arquivo $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "1" ]]; then
						adicionar-escrita-grupo-arquivo $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "2" ]]; then
						adicionar-escrita-outros $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "3" ]]; then
						adicionar-escrita-todos $arquivo
					fi
					verifica_escrita="1"
				fi	

				#Condições para Leitura
				if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
					if [[ "$operador" == "0" && "$usuarios" == "0" ]]; then
						adicionar-leitura-dono-arquivo $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "1" ]]; then
						adicionar-leitura-grupo-arquivo $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "2" ]]; then
						adicionar-leitura-outros $arquivo
					fi

					if [[ "$operador" == "0" && "$usuarios" == "3" ]]; then
						adicionar-leitura-todos $arquivo
					fi
					verifica_leitura="1"
				fi
			done
			
			#Condições para Remoção de Permissões
			for (( i=0; i<${#permissoes}; i++ )); do
				#Condições para Remoção de Permissões
				#Condições de Execução
				if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
					if [[ "$operador" == "1" && "$usuarios" == "0" ]]; then
						remover-execucao-dono-arquivo $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "1" ]]; then
						remover-execucao-grupo-arquivo $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "2" ]]; then
						remover-execucao-outros $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "3" ]]; then
						remover-execucao-todos $arquivo
					fi
					verifica_execucao="1"
				fi

				#Condições para Escrita
				if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
					if [[ "$operador" == "1" && "$usuarios" == "0" ]]; then
						remover-escrita-dono-arquivo $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "1" ]]; then
						remover-escrita-grupo-arquivo $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "2" ]]; then
						remover-escrita-outros $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "3" ]]; then
						remover-escrita-todos $arquivo
					fi
					verifica_escrita="1"
				fi	

				#Condições para Leitura
				if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
					if [[ "$operador" == "1" && "$usuarios" == "0" ]]; then
						remover-leitura-dono-arquivo $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "1" ]]; then
						remover-leitura-grupo-arquivo $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "2" ]]; then
						remover-leitura-outros $arquivo
					fi

					if [[ "$operador" == "1" && "$usuarios" == "3" ]]; then
						remover-leitura-todos $arquivo
					fi
					verifica_leitura="1"
				fi
			done
			
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
