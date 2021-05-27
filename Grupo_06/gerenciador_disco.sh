#!/bin/bash

clear
Menu(){

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

       echo -e " \n listar partições  montadas e não montadas  " 
       blkid -o list
       Menu
}

montar() {

       echo -e "\n  montar Partição : " 

       echo -e  "\n  Informe nome  partição para montar: "
       read montagem


       mkdir $montagem
       mount -t ext4 /dev/sdb1 /$montagem 
       df -h
       Menu
}


desmontar() {


          umount /$montagem

          echo -e "\n Desmontar disco "


          blkid -o list 
	  Menu

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


