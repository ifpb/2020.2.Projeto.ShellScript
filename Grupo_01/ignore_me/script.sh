#!/bin/bash

#APENAS PARA LINUX MINT E UBUNTU!!!!!!!

# para saber a distribuição
# lsb\_release -a

#read -p "Qual a sua distribuição linux? " dist

read -p "Sua distribuição é linux mint? (s/n): " dest
if [[ "${dest}" = s ]]; then 
	sudo rm /var/lib/dpkg/lock-frontend
	sudo rm /var/cache/apt/archives/lock
	sudo apt update
	sudo apt install snapd
else	
	echo "Prosseguindo"
fi

while true; do
        read -p "Como deseja iniciar a atualização do sistema?
                s       - para fechar
                p       - pacote programador
                r       - pacote de redes
                e       - pacote para escritório
                f       - pacote para entretenimento
		a       - instalação padrão de pacotes esenciais(opção automatica)
                " ini
        case ${ini} in
		"a") echo "## instalando pacote da opção automatico ##"
			sudo snap install code --classic -y
			sudo snap install brave -y
			sudo apt-get install wireshark -y
			sudo snap install sftpclient -y
			sudo snap install remmina -y
			sudo snap install spotify -y
			sudo snap install wps-2019-snap -y
			;;				
                "p") read -p "Você quer: 
                                (i) instalar ou
				(r) remover
                                " opc
                        if [[ "${opc}" = i ]]; then
			#	echo "será instalado o code, sublime, beekeeper, kubectl, incomnia e docker"
				read -p "Selecione:
			       		(C) - code
					(S) - sublime
					(B) - beekeeper
					(K) - kubectl
					(I) - insomnia 
					(D) - docker
					" dest
					if [ ${dest} = "C" ]; then
						sudo snap install code --classic
					elif [ ${dest} = "S" ]; then
					       	sudo snap install sublime-text --classic
					elif [ ${dest} = "B" ]; then
					       	sudo snap install beekeeper-studio
					elif [ ${dest} = "K" ]; then
					       	sudo snap install kubectl --classic
					elif [ ${dest} = "I" ]; then 
						sudo snap install insomnia
					elif [ ${dest} = "D" ]; then
					       	sudo snap install docker
					fi
			fi
			if [[ "${opc}" = r ]]; then
				read -p "Selecione:
                                        (C) - code
                                        (S) - sublime
                                        (B) - beekeeper
                                        (K) - kubectl
                                        (I) - insomnia 
                                        (D) - docker
					" dest
					if [ ${dest} = "C" ]; then
                                                sudo snap remove code --classic
                                        elif [ ${dest} = "S" ]; then
                                                sudo snap remove sublime-text --classic
                                        elif [ ${dest} = "B" ]; then
                                                sudo snap remove beekeeper-studio
                                        elif [ ${dest} = "K" ]; then
                                                sudo snap remove kubectl --classic
                                        elif [ ${dest} = "I" ]; then
                                                sudo snap remove insomnia
                                        elif [ ${dest} = "D" ]; then
                                                sudo snap remove docker
                                        fi
			fi	
                        ;;
                "r") read -p "Você quer: 
                                (i) instalar ou
                                (r) remover
                                " opc
                        if [[ "${opc}" = i ]]; then
				read -p "Selecione:
					(G) - google cloud
					(W) - wireshark
					(S) - sftpclient
					(R) - remina
					" dest
					if [ ${dest} = "G" ]; then
						sudo snap install google-cloud-sdk --classic
					elif [ ${dest} = "W" ]; then				#REVER
						sudo apt-get install wireshark
					elif [ ${dest} = "S" ]; then
						sudo snap install sftpclient
					elif [ ${dest} = "R" ]; then
						sudo snap install remmina
					fi
			fi
			if [[ "${opc}" = r ]]; then
				read -p "Selecione:
                                        (G) - google cloud
                                        (W) - wireshark
                                        (S) - sftpclient
                                        (R) - remina
                                        " dest
                                        if [ ${dest} = "G" ]; then
                                                sudo snap remove google-cloud-sdk --classic
                                        elif [ ${dest} = "W" ]; then				#REVER
						sudo add-apt-repository ppa:wireshark-dev/stable -r -y
						sudo apt-get remove wireshark --auto-remove
					elif [ ${dest} = "S" ]; then
                                                sudo snap remove sftpclient
                                        elif [ ${dest} = "R" ]; then
                                                sudo snap remove remmina
                                        fi
                        fi
                       ;;
		"f") read -p "Você quer: 
				(i) instalar ou
			      	(r) remover 
				" opc
			if [[ "${opc}" = i ]]; then
				read -p "Selecione:
					(Y) - spotify
					(K) - skype
					(D) - discord
					(T) - teams insiders
				" dest
				if [ ${dest} = "Y" ]; then
					sudo snap install spotify
				elif [ ${dest} = "K" ]; then
					sudo snap install skype
				elif [ ${dest} = "D" ]; then
					sudo snap install discord
				elif [ ${dest} = "T" ]; then
					sudo snap install teams-insiders
				fi
			fi
			if [[ "${opc}" = r ]]; then
				read -p "Selecione:
                                        (Y) - spotify
                                        (K) - skype
                                        (D) - discord
					(T) - teams insiders
                                " dest
                                if [ ${dest} = "Y" ]; then
                                        sudo snap remove spotify
                                elif [ ${dest} = "K" ]; then
                                        sudo snap remove skype
                                elif [ ${dest} = "D" ]; then
                                        sudo snap remove discord
				elif [ ${dest} = "T" ]; then
                                        sudo snap remove teams-insiders
                                fi

			fi	
                        ;;
                "e") read -p "Você quer: 
                                (i) instalar ou
                                (r) remover 
                                 " opc
                        if [[ "${opc}" = i ]]; then
				read -p "Selecione:
					(M) - mailspring
					(W) - wps 
					(B) - brave
					(C) - chromium
				" dest
				if [ ${dest} = "M" ]; then
					sudo snap install mailspring
				elif [ ${dest} = "W" ]; then
					sudo snap install wps-2019-snap
				elif [ ${dest} = "B" ]; then
					sudo snap install brave
				elif [ ${dest} = "C" ]; then
					sudo snap install chromium
				fi
			fi
			if [[ "${opc}" = r ]]; then
                                read -p "Selecione:
                                        (M) - mailspring
                                        (W) - wps 
					(B) - brave
					(C) - chromium
                                " dest
                                if [ ${dest} = "M" ]; then
                                        sudo snap remove mailspring
                                elif [ ${dest} = "Y" ]; then
                                        sudo snap remove wps-2019-snap
				elif [ ${dest} = "B" ]; then
                                        sudo snap remove brave
                                elif [ ${dest} = "C" ]; then
                                        sudo snap remove chromium
                                fi
			fi
                        ;;
                "s") break ;;
        esac
done
	
