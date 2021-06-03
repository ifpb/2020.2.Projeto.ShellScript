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
                        verifica_atributo_a="1"
                        verifica_atributo_c="2"
			verifica_atributo_i="3"
			verifica_atributo_s="4"
			verifica_atributo_u="5"
			verifica_atributo_todos="6"

			#Condições para Adição de Atributos
                        if [[ "$operador" == "0" ]]; then
                                for (( i=0; i<${#atributos}; i++ )); do
                                        #Condições de Adições de Atributos
                                        if [[ $atributos =~ 0 && "$verifica_atributo_A" == "0" ]]; then
						adiciona-atributoA $arquivo
						verifica_atributo_A="1"
					fi
					if [[ $atributos =~ 1 && "$verifica_atributo_a" == "1" ]]; then
						adiciona-atributo-a $arquivo
						verifica_atributo_a="2"
					fi
					if [[ $atributos =~ 2 && "$verifica_atributo_c" == "2" ]]; then
						adiciona-atributo-c $arquivo
						verifica_atributo_c="3"
					fi
					if [[ $atributos =~ 3 && "$verifica_atributo_i" == "3" ]]; then
						adiciona-atributo-i $arquivo
						verifica_atributo_i="4"
					fi
					if [[ $atributos =~ 4 && "$verifica_atributo_s" == "4" ]]; then
						adiciona-atributo-s $arquivo
						verifica_atributo_s="5"
					fi
					if [[ $atributos =~ 5 && "$verifica_atributo_u" == "5" ]]; then
						adiciona-atributo-u $arquivo
						verifica_atributo_u="6"
					fi

				done
			fi
			#Condições para retirada de Atributos
			if  [[ "$operador" == "1" ]]; then
                                for (( i=0; i<${#atributos}; i++ )); do
                                        #Condições de Retirada de Atributos
                                        if [[ $atributos =~ 0 && "$verifica_atributo_A" == "0" ]]; then
                                                retira-atributoA $arquivo
                                                verifica_atributo_A="1"
                                        fi
                                        if [[ $atributos =~ 1 && "$verifica_atributo_a" == "1" ]]; then
                                                retira-atributo-a $arquivo
                                                verifica_atributo_a="2"
                                        fi
                                        if [[ $atributos =~ 2 && "$verifica_atributo_c" == "2" ]]; then
                                                retira-atributo-c $arquivo
                                                verifica_atributo_c="3"
                                        fi
                                        if [[ $atributos =~ 3 && "$verifica_atributo_i" == "3" ]]; then
                                                retira-atributo-i $arquivo
                                                verifica_atributo_i="4"
                                        fi
                                        if [[ $atributos =~ 4 && "$verifica_atributo_s" == "4" ]]; then
                                                retira-atributo-s $arquivo
                                                verifica_atributo_s="5"
                                        fi
                                        if [[ $atributos =~ 5 && "$verifica_atributo_u" == "5" ]]; then
                                                retira-atributo-u $arquivo
                                                verifica_atributo_u="6"
                                        if [[ $atributos =~ 6 && "$verifica_atributo_todos" == "6" ]]; then
						retira-todos-atributos $arquivo
						verifica_atributo_todos="7"
					fi
				done
			fi
		fi
}
