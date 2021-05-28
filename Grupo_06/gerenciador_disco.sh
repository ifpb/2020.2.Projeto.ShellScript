#!/bin/bash

echo "O programa necessita de permissão elevada para ser executado."

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

clear
Menu() {

	echo " ---------------------------------"
	echo " Gerenciador de DISCO "
	echo "----------------------------------"
	echo
	echo "[ 1 ] mostrar os discos em uso "
	echo "[ 2 ] listar as partições "
	echo "[ 3 ] montar partição "
	echo "[ 4 ] desmontar partição " 
	echo "[ 5 ] compartilhamento samba "
	echo "[ 6 ] sair "
	echo
	echo -n "Qual a opção desejada ? "
	read opcao
	case $opcao in
		1) mostrar ;;
		2) listar ;;
		3) montar ;;
		4) desmontar ;; 
		5) compartilhar ;;
		6) exit ;;
		*) echo "Opção desconhecida"; 
		    echo; Menu
	esac
}

mostrar() {


        echo -e "\n mostrar os discos em uso  "
        df -h
	Menu
}

listar() {

       echo -e " \n listar partições " 
       lsblk
       Menu
}

montar() {

	echo -e "\n  montar Partição : " 

	echo -e  "\n  Informe o nome desejado para pasta a ser ponto de montagem: "
	read mntpoint
	
	echo -e  "\n  Informe o dispositivo especial a ser montado na pasta(sda, sdb...): "
	read mntdev
		
	mntdir="/media/$mntpoint"
	
	cd /media/
	
	if [ ! -d "$mntdir" ]; then
	mkdir /media/$mntpoint/
	mount /dev/$mntdev /media/$mntpoint/
	df -h
	
	else
	
	mount /dev/$mntdev /media/$mntpoint/
	df -h
	
	fi
	Menu
}


desmontar() {
	
	
	echo -e "\n diretórios usados para montagem:\n "
	cd /media/
	ls -l 	
	echo -e "\n desmontar qual diretório? \n "
	read mntpoint
	umount /media/$mntpoint/
	
}



compartilhar() {
	#instalação e configuração do samba
	apt install samba # instalando o samba
	/etc/init.d/smbd restart # reinicializando o samba
	mkdir compSamba # criando a pasta para ser  compartilhada 
	chmod -R 777 compSamba #alterando as permissões
	echo "
	[COMPATILHAMENTO]
	path = /home/ubuntu/compSamba
	public = yes
	writeable = yes
	browseable = yes" >> /etc/samba/smb.conf #inserindo o conteúdo no final do arquivo smb.conf.
	smbd restart # restartando o serviço
	ifconfig #veifiue o IP do servidor p/ poder acessar o servidor no cliente
	adduser -a cmp #criando o usuário cmp no linux
	smbpasswd -a cmp #criando o usuário cmp no samba
	Menu
}

Menu


