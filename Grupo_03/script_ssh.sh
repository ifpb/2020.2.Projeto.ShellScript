#!/bin/bash

echo -e "\nBem-vindo, ${USER}!\n"
echo "Este é o script que irá ajudá-lo com suas possíveis dúvidas do SSH."
echo -e "A seguir, as opções:\n"

echo "a) Verificar se há um SSH instalado"
echo "b) Instalar o SSH"
echo "c) Verificar se o SSH está rodando"
echo "d) Inicializar o SSH"
echo "e) Parar o SSH"
echo "f) Visualizar a porta atual"
echo "g) Substituir a porta atual"
echo "h) Verificar a conexão via root"
echo "i) Habilitar a conexão via root"
echo "j) Desabilitar a conexão via root"
echo "k) Inserir usuários para conectar ao SSH"
echo "l) Criar chave criptografada RSA"
echo "m) Criar chave criptografada DSA"

echo
read -p "Tecle o que deseja: " opt
echo

case $opt in

  "a"|"A") echo "$(ssh -V)"
           echo "Apareceu uma mensagem com 'OpenSSH'?"
           echo -e "Então, o SSH está instalado.\n"
           ;;
# O comando ssh -V vai mostrar se existe um SSH instalado.




  "b"|"B") echo "$(sudo apt-get install openssh-server)" && echo ;;
# O comando irá instalar o openssh-server.




  "c"|"C") status="$(service sshd status | head -3 | tail -1 | awk {'print $2'})"

                if [ $status == "inactive" ]; then
                echo "O SSH está inativo." && echo
                else
                  if [ $status == "active" ]; then
                  echo "O SSH está ativo." && echo
                  fi
                fi
            ;;
# Aqui, irá executar o comando service sshd statuss e irá capturar
# apenas a 3ª linha dele e, em seguida, irá mostrar o resultado
# da linha 3 e a segunda coluna com AWK na tela.




  "d"|"D") echo "$(service sshd start)"
           echo -e "O SSH foi iniciado!\n"
           ;;
# Para iniciar o SSH e mostrar que foi iniciado.




  "e"|"E") echo "$(service sshd stop)"
           echo -e "O SSH foi encerrado!\n"
           ;;
# Para encerrar o SSH e mostrar que foi encerrado.




  "f"|"F") porta="$(sed -n '/Port [0-9]*/p' sshd_config | tail -1 | awk {'print $2'})"
           echo "A porta atual é: $porta" && echo
           ;;
# Para printar a porta atual ao usuário.




  "g"|"G") read -p "Qual a porta que deseja liberar? " p
           echo "$(sed -i.bkp '/Port [0-9]*/c\Port '$p'' ./sshd_config)"
           echo -e "Porta substituída com sucesso.\n"
           ;;
# Para substituir a porta atual.




  "h"|"H") permroot="$(sed -n '/PermitRootLogin */p' sshd_config | tail -1 | awk '{print $2}')"

		if [ $permroot == "no" ]; then
		echo "O login por root está desabilitado." && echo
		else
		  if [ $permroot == "yes" ]; then
		  echo "O login por root está habilitado." && echo
		  else
		    echo "A permissão ainda não foi configurada." && echo
		  fi
	        fi
	    ;;

  "i"|"I") echo "$(sed -i.bkp '/PermitRootLogin */c\PermitRootLogin yes' sshd_config)"
           echo -e "Conexão por root habilitada.\n"
           ;;
# Habilitar conexão via root.




  "j"|"J") echo "$(sed -i.bkp '/PermitRootLogin */c\PermitRootLogin no' sshd_config)"
           echo -e "Conexão por root desabilitada.\n"
           ;;
# Desabilitar conexão via root.




  "k"|"K") echo "Digite todos os usuários a serem habilitados ao SSH."
           echo "O limite é de 5 usuários."
           echo "Tecle 'x' para encerrar."
           echo

           for ((i=1; i<6; i++)); do
           read -p "$iº: " u$i
           vusers="u$i"

           if [ "${!vusers}" == "x" ]; then
             echo
             break
           else
             if [ "${!vusers}" != "x" ]; then
               echo "$(sed -i.bkp '/AllowUsers */c\AllowUsers '$u1' '$u2' '$u3' '$u4' '$u5'' sshd_config)"

               habusers="$(sed -n '/AllowUsers*/p' sshd_config | tail -1 | awk -F " " '{print $2,$3,$4,$5,$6}')"
             fi
           fi

           done
             echo "Os usuários habilitados: $habusers" && echo
           ;;
# Para inserir até cinco usuários para eles terem acesso ao SSH.




  "l"|"L") echo -e "Utilize o comando: ssh-keygen -t rsa\n" ;;
# Criar chave RSA.




  "m"|"M") echo -e "Utilize o comando: ssh-keygen -t dsa\n" ;;
#Criar chave DSA.

esac
