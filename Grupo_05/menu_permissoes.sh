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
			
			#Condições para Adição de Permissões
			if [[ "$operador" == "0" ]]; then
				for (( i=0; i<${#permissoes}; i++ )); do
					#Condições de Execução
					if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-execucao-dono-arquivo $arquivo
						fi
	
						if [[ "$usuarios" == "1" ]]; then
							adicionar-execucao-grupo-arquivo $arquivo
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-execucao-outros $arquivo
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-execucao-todos $arquivo
						fi
						verifica_execucao="1"
					fi

					#Condições para Escrita
					if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-escrita-dono-arquivo $arquivo
						fi

						if [[ "$usuarios" == "1" ]]; then
							adicionar-escrita-grupo-arquivo $arquivo
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-escrita-outros $arquivo
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-escrita-todos $arquivo
						fi
						verifica_escrita="1"
					fi	

					#Condições para Leitura
					if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-leitura-dono-arquivo $arquivo
						fi

						if [[ "$usuarios" == "1" ]]; then
							adicionar-leitura-grupo-arquivo $arquivo
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-leitura-outros $arquivo
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-leitura-todos $arquivo
						fi
						verifica_leitura="1"
					fi
				done
			fi
			
			#Condições para Remoção de Permissões
			if [[ "$operador" == "1" ]]; then
				for (( i=0; i<${#permissoes}; i++ )); do
					#Condições de Execução
					if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-execucao-dono-arquivo $arquivo
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-execucao-grupo-arquivo $arquivo
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-execucao-outros $arquivo
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-execucao-todos $arquivo
						fi
						verifica_execucao="1"
					fi

					#Condições para Escrita
					if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-escrita-dono-arquivo $arquivo
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-escrita-grupo-arquivo $arquivo
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-escrita-outros $arquivo
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-escrita-todos $arquivo
						fi
						verifica_escrita="1"
					fi	

					#Condições para Leitura
					if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-leitura-dono-arquivo $arquivo
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-leitura-grupo-arquivo $arquivo
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-leitura-outros $arquivo
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-leitura-todos $arquivo
						fi
						verifica_leitura="1"
					fi
				done
			fi
			
			#Condições de Reinicilização
			if [[ "operador" =~ "2" ]]; then
				if [[ "$usuarios" == "0" ]]; then
					reinicilizar-dono $arquivo
				fi
	
				if [[ "$usuarios" == "1" ]]; then
					reinicilizar-grupo $arquivo
				fi

				if [[ "$usuarios" == "2" ]]; then
					reinicilizar-outros $arquivo
				fi

				if [[ "$usuarios" == "3" ]]; then
					reinicilizar-todos $arquivo
				fi
			fi
		fi
		
		#Múltiplos Arquivos
		if [ "$modo_arquivo" == "1" ]; then
			arquivos="$(Selecionar_Arquivos | sed 's/|/ /g')"
			permissoes="$(Menu_Selecionar_Permissoes | sed 's/|//g')"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"
			verifica_execucao="0"
			verifica_escrita="0"
			verifica_leitura="0"
			
			#Condições para Adição de Permissões
			if [[ "$operador" == "0" ]]; then
				for (( i=0; i<${#permissoes}; i++ )); do
					#Condições de Execução
					if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-execucao-dono-arquivo $arquivos
						fi
	
						if [[ "$usuarios" == "1" ]]; then
							adicionar-execucao-grupo-arquivo $arquivos
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-execucao-outros $arquivos
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-execucao-todos $arquivos
						fi
						verifica_execucao="1"
					fi

					#Condições para Escrita
					if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-escrita-dono-arquivo $arquivos
						fi

						if [[ "$usuarios" == "1" ]]; then
							adicionar-escrita-grupo-arquivo $arquivos
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-escrita-outros $arquivos
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-escrita-todos $arquivos
						fi
						verifica_escrita="1"
					fi	

					#Condições para Leitura
					if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-leitura-dono-arquivo $arquivos
						fi

						if [[ "$usuarios" == "1" ]]; then
							adicionar-leitura-grupo-arquivo $arquivos
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-leitura-outros $arquivos
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-leitura-todos $arquivos
						fi
						verifica_leitura="1"
					fi
				done
			fi
			
			#Condições para Remoção de Permissões
			if [[ "$operador" == "1" ]]; then
				for (( i=0; i<${#permissoes}; i++ )); do
					#Condições de Execução
					if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-execucao-dono-arquivo $arquivos
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-execucao-grupo-arquivo $arquivos
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-execucao-outros $arquivos
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-execucao-todos $arquivos
						fi
						verifica_execucao="1"
					fi

					#Condições para Escrita
					if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-escrita-dono-arquivo $arquivos
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-escrita-grupo-arquivo $arquivos
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-escrita-outros $arquivos
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-escrita-todos $arquivos
						fi
						verifica_escrita="1"
					fi	

					#Condições para Leitura
					if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-leitura-dono-arquivo $arquivos
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-leitura-grupo-arquivo $arquivos
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-leitura-outros $arquivos
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-leitura-todos $arquivos
						fi
						verifica_leitura="1"
					fi
				done
			
			fi
			
			#Condições de Reinicilização
			if [[ "operador" =~ "2" ]]; then
				if [[ "$usuarios" == "0" ]]; then
					reiniciar-dono $arquivos
				fi
	
				if [[ "$usuarios" == "1" ]]; then
					reiniciar-grupo $arquivos
				fi

				if [[ "$usuarios" == "2" ]]; then
					reiniciar-outros $arquivos
				fi

				if [[ "$usuarios" == "3" ]]; then
					reiniciar-todos $arquivos
				fi
			fi
				
		fi
		
		#Diretório
		if [ "$modo_arquivo" == "2" ]; then
			diretorio="$(Selecionar_Diretorio)"
			permissoes="$(Menu_Selecionar_Permissoes | sed 's/|//g')"
			operador="$(Menu_Selecionar_Operador)"
			usuarios="$(Menu_Selecionar_Usuarios)"
			verifica_execucao="0"
			verifica_escrita="0"
			verifica_leitura="0"
			
			#Condições para Adição de Permissões
			if [[ "$operador" == "0" ]]; then
				for (( i=0; i<${#permissoes}; i++ )); do
					#Condições de Execução
					if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-execucao-dono-arquivo $diretorio
						fi
	
						if [[ "$usuarios" == "1" ]]; then
							adicionar-execucao-grupo-arquivo $diretorio
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-execucao-outros $diretorio
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-execucao-todos $diretorio
						fi
						verifica_execucao="1"
					fi

					#Condições para Escrita
					if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-escrita-dono-arquivo $diretorio
						fi

						if [[ "$usuarios" == "1" ]]; then
							adicionar-escrita-grupo-arquivo $diretorio
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-escrita-outros $diretorio
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-escrita-todos $diretorio
						fi
						verifica_escrita="1"
					fi	

					#Condições para Leitura
					if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							adicionar-leitura-dono-arquivo $diretorio
						fi

						if [[ "$usuarios" == "1" ]]; then
							adicionar-leitura-grupo-arquivo $diretorio
						fi

						if [[ "$usuarios" == "2" ]]; then
							adicionar-leitura-outros $diretorio
						fi

						if [[ "$usuarios" == "3" ]]; then
							adicionar-leitura-todos $diretorio
						fi
						verifica_leitura="1"
					fi
				done
			fi
			
			#Condições para Remoção de Permissões
			if [[ "$operador" == "1" ]]; then
				for (( i=0; i<${#permissoes}; i++ )); do
					#Condições de Execução
					if [[ $permissoes =~ 0 && "$verifica_execucao" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-execucao-dono-arquivo $diretorio
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-execucao-grupo-arquivo $diretorio
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-execucao-outros $diretorio
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-execucao-todos $diretorio
						fi
						verifica_execucao="1"
					fi

					#Condições para Escrita
					if [[ $permissoes =~ 1 && "$verifica_escrita" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-escrita-dono-arquivo $diretorio
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-escrita-grupo-arquivo $diretorio
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-escrita-outros $diretorio
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-escrita-todos $diretorio
						fi
						verifica_escrita="1"
					fi	

					#Condições para Leitura
					if [[ $permissoes =~ 2 && "$verifica_leitura" == "0" ]]; then
						if [[ "$usuarios" == "0" ]]; then
							remover-leitura-dono-arquivo $diretorio
						fi

						if [[ "$usuarios" == "1" ]]; then
							remover-leitura-grupo-arquivo $diretorio
						fi

						if [[ "$usuarios" == "2" ]]; then
							remover-leitura-outros $diretorio
						fi

						if [[ "$usuarios" == "3" ]]; then
							remover-leitura-todos $diretorio
						fi
						verifica_leitura="1"
					fi
				
				done
			fi
			
			#Condições de Reinicilização
			if [[ "operador" =~ "2" ]]; then
				if [[ "$usuarios" == "0" ]]; then
					reiniciar-dono $diretorio
				fi
	
				if [[ "$usuarios" == "1" ]]; then
					reiniciar-grupo $diretorio
				fi

				if [[ "$usuarios" == "2" ]]; then
					reiniciar-outros $diretorio
				fi

				if [[ "$usuarios" == "3" ]]; then
					reiniciar-todos $diretorio
				fi
			fi
				
		fi

}
