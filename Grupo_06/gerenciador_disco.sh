#!/bin/bash

while true
do

opcao=$(zenity --width=280 --height=250 --list --title="Gerenciador de Discos" --column="Id" --column="Opção" 1 "mostrar os discos em uso" \
2 "listar as partições" \
3 "montar partição" \
4 "desmontar partição" \
5 "compartilhamento samba" \
6 "sair do programa" )


[[ "$?" != "0" ]] && exit 1

if [ $opcao -eq 1 ]; then
	
	df -h > discos.txt
	zenity --width=576 --height=400 --list --title="Discos em Uso"	--column="Sis. Arq" --column="Tam." --column="Usado"  	--column="Disp." --column="Uso%" --column="Montado em" \
	$(tail -n +2 discos.txt)
	[[ "$?" != "0" ]] && exit 1

elif [ $opcao -eq 2 ]; then
        
        lsblk > part.txt
	zenity --width=576 --height=400 --list --title="Partições" --column="Nome" --column="MAJ:MIN" --column="RM" --column="Tamanho" --column="RO" --column="Tipo" --column="Ponto de Montagem" \
  	$(tail -n +2 part.txt)
  	[[ "$?" != "0" ]] && exit 1
  	
elif [ $opcao -eq 3 ]; then 
	
	lsblk --noheadings --raw -o NAME,MOUNTPOINT | awk '$1~/[[:digit:]]/ && $2 == ""' > unmnt.txt
	
		
	if [ ! -d ~/shmount ]; then
	
		sudo -k mkdir ~/shmount 
	
		mntdev=$(zenity --list --title="Discos em Uso" --column="Sis. Arq" \
		$(cat unmnt.txt))
		
		[[ "$?" != "0" ]] && exit 1           
	
		echo $mntdev > mntdev.txt
		sudo -k mount /dev/$(cat mntdev.txt) ~/shmount
		zenity --width=225 --height=100 --info \
		--text="Disco montado com sucesso."
		
	else
	         
		mntdev=$(zenity --list --title="Discos em Uso" --column="Sis. Arq" \
		$(cat unmnt.txt))           
		
		[[ "$?" != "0" ]] && exit 1
		
		echo $mntdev > mntdev.txt
		sudo -k mount /dev/$(cat mntdev.txt) ~/shmount
		zenity --width=225 --height=100 --info \
		--text="Disco montado com sucesso."
	
	fi
           


elif [ $opcao -eq 4 ]; then 
        
        df -h > discos.txt     
	mntdev=$(zenity --width=576 --height=400 --list --title="Desmontar disco" --column="Sis. Arq" --column="Tam." --column="Usado" 	--column="Disp." --column="Uso%" --column="Montado em" \
  	$(tail -n +2 discos.txt))           
	
	[[ "$?" != "0" ]] && exit 1	
	
	echo $mntdev > mntdev.txt
	sudo -k umount $(cat mntdev.txt)
	
	zenity --width=225 --height=100 --info \
	--text="Disco desmontado com sucesso."
		     
	     	
elif [ $opcao -eq 5 ]; then

	zenity --width=225 --height=100 --info \
	--text="Iniciando configuração de servidor SMB."	
	#instalação e configuração do samba
	sudo apt install libcups2 samba samba-common # instalando o samba
	sudo /etc/init.d/smbd restart # reinicializando o samba
	sudo mkdir ~/compartilhado # criando a pasta para ser  compartilhada 
    	sudo chmod -R 777 compartilhado #alterando as permissões
	echo " 
	[COMPATILHAMENTO]
	path = /home/$USER/compartilhado
	public = yes
	writeable = yes
	browseable = yes" >> /etc/samba/smb.conf #inserindo o conteúdo no final do arquivo smb.conf.
	smbd restart # restartando o serviço
 	ifconfig #veifiue o IP do servidor p/ poder acessar o servidor no cliente
	sudo adduser -a cmp #criando o usuário cmp no linux
	sudo -k smbpasswd -a cmp #criando o usuário cmp no samba
	zenity --width=225 --height=100 --info \
	--text="Configuração concluída, seu diretório compartilhado é foi criado."
	
elif [ $opcao -eq 6 ]; then	
	
	break
fi

done


