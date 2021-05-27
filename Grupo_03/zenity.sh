#!/bin/bash

zenity --info --title="BOAS-VINDAS :}" \
--text="$USER, este script irá ajudá-lo a melhorar seu manuseio no SSH. Vamos prosseguir?" \
--width="300" height="100"

result=$(
  zenity --list --title="OPÇÕES:" --width=650 --height=450 \
  --column="Selecione o que deseja." \
  "a) Verificar se há um SSH instalado" \
  "b) Instalar o SSH" \
  "c) Verificar se o SSH está rodando" \
  "d) Inicializar o SSH" \
  "e) Parar o SSH" \
  "f) Visualizar a porta atual" \
  "g) Substituir a porta atual" \
  "h) Verificar a conexão via root" \
  "i) Habilitar a conexão via root" \
  "j) Desabilitar a conexão via root" \
  "k) Criar chave criptografada RSA" \
  "l) Criar chave criptografada DSA" \
  "m) Inserir usuários ao acesso SSH" \
)

if [[ $result = "a) Verificar se há um SSH instalado" ]]; then
	echo "$(ssh -V)"
	zenity --info --title="Opção a)" \
	zenity --info --text="Apareceu uma mensagem com 'OpenSSH'? Então o SSH está instalado." \
	--width="320" --height="100"
else
  if [[ $result = "b) Instalar o SSH" ]]; then
  	  echo "$(sudo apt-get install openssh-server)"
	  zenity --info --title="Opção b)" \
  	  zenity --info --text="O SSH já foi instalado." \
	  --width="320" --height="100"
  else
    if [[ $result = "c) Verificar se o SSH está rodando" ]]; then
	    status="$(service sshd status | head -3 | tail -1 | awk {'print $2'})"

                if [ $status == "inactive" ]; then
                zenity --info --title="Opção c)" \
		zenity --info --text="O SSH está inativo." \
		--width="320" --height="100"
                else
                  if [ $status == "active" ]; then
                  zenity --info --title="Opção c)" \
                  zenity --info --text="O SSH está ativo." \
                  --width="320" --height="100"
                  fi
                fi
    else
      if [[ $result = "d) Inicializar o SSH" ]]; then
	    echo "$(service sshd start)"
            zenity --info --title="Opção d)" \
            zenity --info --text="O SSH foi iniciado!" \
            --width="320" --height="100"
      else
        if [[ $result = "e) Parar o SSH" ]]; then
              echo "$(service sshd stop)"
              zenity --info --title="Opção e)" \
              zenity --info --text="O SSH foi encerrado!" \
	      --width="320" --height="100"
        else
          if [[ $result = "f) Visualizar a porta atual" ]]; then
                porta="$(sed -n '/Port [0-9]*/p' sshd_config | tail -1 | awk {'print $2'})"
                zenity --info --title="Opção f)" \
                zenity --info --text="A porta atual é: $porta" \
                --width="320" --height="100"
          else
            if [[ $result = "g) Substituir a porta atual" ]]; then
                  p=$(zenity --title="Atenção:" --text "Insira a porta desejada:" --entry)
                  #zenity --info --title="Boas-vindas" --text=" $porta" --width="100" height="50"
                  echo "$(sed -i.bkp '/Port [0-9]*/c\Port '$p'' ./sshd_config)"
                  zenity --info --title="Opção g)" \
                  zenity --info --text="Porta substituída com sucesso." \
                  --width="320" --height="100"
            else
              if [[ $result = "h) Verificar a conexão via root" ]]; then
                    permroot="$(sed -n '/PermitRootLogin */p' sshd_config | tail -1 | awk '{print $2}')"

			if [ $permroot == "no" ]; then
			zenity --info --title="Opção h)" \
                        zenity --info --text="O login por root está desabilitado." \
                        --width="320" --height="100"
			else
		  	  if [ $permroot == "yes" ]; then
		  	  zenity --info --title="Opção h)" \
                          zenity --info --text="O login por root está habilitado." \
                          --width="320" --height="100"
		  	  else
		    	  zenity --info --title="Opção h)" \
			  zenity --info --text="A permissão ainda não foi configurada." \
                          --width="320" --height="100"
		  	  fi
	                fi
              else
                if [[ $result = "i) Habilitar a conexão via root" ]]; then
                      echo "$(sed -i.bkp '/PermitRootLogin */c\PermitRootLogin yes' sshd_config)"
                      zenity --info --title="Opção i)" \
                      zenity --info --text="Conexão por root habilitada." \
                      --width="320" --height="100"
		else
                  if [[ $result = "j) Desabilitar a conexão via root" ]]; then
                        echo "$(sed -i.bkp '/PermitRootLogin */c\PermitRootLogin no' sshd_config)"
                        zenity --info --title="Opção j)" \
                        zenity --info --text"Conexão por root desabilitada." \
                        --width="320" --height="100"
                  else
                    if [[ $result = "k) Criar chave criptografada RSA" ]]; then
                          zenity --info --title="Opção k)" \
                          zenity --info --text="Utilize o comando: ssh-keygen -t rsa" \
                          --width="320" --height="100"
                    else
                      if [[ $result = "l) Criar chave criptografada DSA" ]]; then
                            zenity --info --title="Opção l)" \
                            zenity --info --text="Utilize o comando: ssh-keygen -t dsa" \
                            --width="320" --height="100"

                      fi
                    fi
                  fi
                fi
              fi
            fi
          fi
        fi
      fi
    fi
  fi
fi
