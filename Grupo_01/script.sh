#!/bin/bash
#------------------APENAS O BETA DO BETA DO BETA-------------------------"
# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"

# para saber a distribuição
# lsb\_release -a

#read -p "Qual a distribuição do seu linux? " dist

read -p "Primeiro necessitamos do snap e atualizar o sistema (s/n): " dest
if [[ "${dest}" = s ]]; then 
	sudo apt install snapd
	#sudo apt update
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
                " ini
        case ${ini} in
                "p")  
                        ;;
                "r")
                        ;;
		"e") read -p "Você quer: 
				(i) instalar, 
				(a) atualizar ou
			      	(r) remover 
				(s) sair " opc
			if [[ "${opc}" = i ]]; then
				echo "será instalado o spotifr, skype e discord"
				sudo snap install spotify
				sudo snap install skype
				sudo snap install discord
			fi
			if [[ "${opc}" = r ]]; then
				echo "Removendo"
				sudo snap remove spotify
				sudo snap remove skype
				sudo snap remove discord
			fi	
                        ;;
                "f")
                        ;;
                "s") break ;;
        esac
done
	



programas para instalar:
#"DEV"
#"sudo snap install code --classic"
#"sudo snap install sublime-text --classic"
#"sudo snap install beekeeper-studio"
#"sudo snap install kubectl --classic"
#"sudo snap install insomnia"
#"sudo snap install docker"
#"REDES"
#"sudo snap install google-cloud-sdk --classic"
#"sudo apt-get install wireshark"
#"sudo snap install sftpclient"
#"sudo snap install remmina"
#"ENTRETERIMENTO"
#"sudo snap install spotify"
#"sudo snap install skype"
#"sudo snap install discord"
#"ESCRITORIO"
#"sudo snap install mailspring"
#"sudo snap install wps-2019-snap"
#"OUTROS"
#"sudo snap install brave"
#"sudo snap install chromium"
#"sudo snap install teams-insiders"
#
#


# ----------------------------- REQUISITOS ----------------------------- #
## Removendo travas do apt ##
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

## Atualizando o repositório ##
sudo apt update -y

## Adicionando repositórios de terceiros e driver de video (Driver Logitech e Drivers Nvidia)##
sudo apt-add-repository "$PPA_GRAPHICS_DRIVERS" -y
wget -nc "$URL_WINE_KEY"
sudo apt-key add winehq.key
sudo apt-add-repository "deb $URL_PPA_WINE bionic main"
sudo add-apt-repository ppa:wireshark-dev/stable
# ---------------------------------------------------------------------- #

# ----------------------------- EXECUÇÃO ----------------------------- #
## Atualizando o repositório depois da adição de novos repositórios ##
sudo apt update -y
sudo apt upgrade -y


# Instalar programas no apt
sudo apt install --install-recommends winehq-stable wine-stable wine-stable-i386 wine-stable-amd64 -y
sudo apt install preload


## retirando a trava com o snap do linux mint ##
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo apt update
sudo apt install snapd

## Instalando pacotes Snap ##
sudo snap install spotify
sudo snap install chromium
sudo snap install sublime-text --classic
sudo snap install code --classic
# ---------------------------------------------------------------------- #

## instalando pacote da opção "auto" ##
sudo snap install code --classic -y
sudo snap install brave -y
sudo apt-get install wireshark -y
sudo snap install sftpclient -y
sudo snap install remmina -y
sudo snap install spotify -y
sudo snap install wps-2019-snap -y


## instalando pacote de produtor de midias digitais ##
sudo apt-get install ubuntustudio-installer -y
#vai abrir uma janela e o usuario escolhe o que vai ser instalado automaticamente"

#instalando ferramentas de pofissional de cyber segurança"
sudo snap install brave -y
sudo snap install remmina -y
wget https://raw.githubusercontent.com/LionSec/katoolin/master/katoolin.py
sudo mv katoolin.py /usr/bin/katoolin
sudo chmod +x /usr/bin/katoolin
katoolin
#vai abrir uma janela e o usuario escolhe o que vai ser instalado automaticamente"

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
