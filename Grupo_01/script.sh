#!/bin/bash
#------------------APENAS O BETA DO BETA DO BETA-------------------------"
# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_GRAPHICS_DRIVERS="ppa:graphics-drivers/ppa"
URL_WINE_KEY="https://dl.winehq.org/wine-builds/winehq.key"
URL_PPA_WINE="https://dl.winehq.org/wine-builds/ubuntu/"

read -p "Como deseja iniciar a atualização do sistema?
	s	- para fechar
	p	- para instalação referente a programação
	d	- ...
	" ini

while [ "${ini}" != "s" ];do
	if [[ ${ini} = "p" ]]; then
		sudo apt update		#Update the packages index and install the dependencies
		sudo apt install software-properties-common apt-transport-https wget
		wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - #Import the Microsoft GPG key
		#enable the Visual Studio Code repository
		sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
		sudo apt install code #install VSC
		read -p "qual linguagem você deseja? (p) - Python; (j) - Java; (js) - JavaScript" lin; fi
		if [[ "${lin}" = p ]]; then
			which python3 > 


	



#programas para instalar:
#"wine, chrome, drivers de video, spotify, vscode, sublime"

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

## instalando pacote de produtor de midias digitais ##
sudo apt-get install ubuntustudio-installer -y
#vai abrir uma janela e o usuario escolhe o que vai ser instalado automaticamente"

#instalando ferramentas de pofissional de cyber segurança"
wget https://raw.githubusercontent.com/LionSec/katoolin/master/katoolin.py
sudo mv katoolin.py /usr/bin/katoolin
sudo chmod +x /usr/bin/katoolin
katoolin

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y
# ---------------------------------------------------------------------- #
