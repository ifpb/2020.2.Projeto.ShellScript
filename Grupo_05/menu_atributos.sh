#!/bin/bash

source menus_graficos.sh
source funcionalidades_atributos.sh

Menu_Atributos() {

    modo_arquivo="$(Menu_Selecionar_Tipo_Arquivo)"

                if [ "$modo_arquivo" == "0" ]; then
                        arquivo="$(Selecionar_Arquivo)"
                        atributos="$(Menu_Selecionar_Atributos | sed 's/|//g')"
                        operador="$(Menu_Selecionar_Operador)"
                        verifica_atributo_A="0"
                        verifica_atributo_a="0"
                        verifica_atributo_c="0"
			verifica_atributo_i="0"
			verifica_atributo_s="0"
			verifica_atributo_u="0"

			#Condições para Adição de Atributos
                        if [[ "$operador" == "0" ]]; then
                                for (( i=0; i<${#atributos}; i++ )); do
                                        #Condições de Adições de Atributos
                                        if [[ $atributos =~ 0 && "$verifica_atributo_A" == "0" ]]; then
						adiciona-atributoA $arquivo
					fi
					if [[ $atributos =~ 0 && "$verifica_atributo_a" == "0" ]]; then
						adiciona-atributo-a $arquivo
					fi
					if [[ $atributos =~ 0 && "$verifica_atributo_c" == "0" ]]; then
						adiciona-atributo-c $arquivo
					fi
					if [[ $atributos =~ 0 && "$verifica_atributo_i" == "0" ]]; then
						adiciona-atributo-i $arquivo
					fi
					if [[ $atributos =~ 0 && "$verifica_atributo_s" == "0" ]]; then
						adiciona-atributo-s $arquivo
					fi
					if [[ $atributos =~ 0 && "$verifica_atributo_u" == "0" ]]; then
						adiciona-atributo-u $arquivo
					fi
				done
			fi
		fi
}
