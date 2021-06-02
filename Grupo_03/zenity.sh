#!/bin/bash

if [ "$(id -nu)" != "root" ]; then
  sudo -k
  passwd=$(zenity --title="Você é root?"  --text="Digite a senha:" --entry --hide-text)
  echo && exec sudo -S -p ' ' "$0" "$@" <<< "$passwd" &> /dev/null && echo
  exit -1 &> /dev/null
fi

zenity --info --title="BOAS-VINDAS :}" \
--text="Este script irá ajudá-lo a melhorar seu manuseio no SSH. Vamos prosseguir?" \
--width="300" height="100"

if [ "$?" == "1" ]; then
  exit
fi

opt=$(zenity --autokill && "$?")

while [ "$?" != "1" ]; do

result=$(
  zenity --list --title="Opções:" --width=650 --height=450 \
  --column="" \
  "Verificar se há um SSH instalado" \
  "Instalar o SSH" \
  "Verificar se o SSH está rodando" \
  "Inicializar o SSH" \
  "Encerrar o SSH" \
  "Visualizar a porta atual" \
  "Substituir a porta atual" \
  "Verificar a conexão via root" \
  "Habilitar a conexão via root" \
  "Desabilitar a conexão via root" \
  "Criar chave criptografada RSA" \
  "Criar chave criptografada DSA" \
  "Inserir usuários ao acesso SSH" \
  "Verificar usuários com acesso ao SSH" \
)

if [ "$?" == "1" ]; then
  exit
fi

if [[ $result = "Verificar se há um SSH instalado" ]]; then
	ssh="$(ssh -V > r.txt 2>&1 && cat r.txt | awk {'print $1'})"
        vssh="$(sed -n '/OpenSSH*/p' r.txt | awk {'print $1'})"

            if [ $vssh == $ssh ]; then
            zenity --info --title="Aviso:" \
            zenity --info --text="O SSH está instalado." \
            --width="320" --height="100"
            else
            zenity --info --title="Aviso:" \
            zenity --info --text="O SSH não está instalado." \
            --width="320" --height="100"
            fi
       remove="$(rm r.txt)"
else
  if [[ $result = "Instalar o SSH" ]]; then
  	  echo "$(sudo apt-get install openssh-server)"
	  zenity --info --title="Aviso:" \
  	  zenity --info --text="O SSH já foi instalado." \
	  --width="320" --height="100"
  else
    if [[ $result = "Verificar se o SSH está rodando" ]]; then
	    status="$(service sshd status | head -3 | tail -1 | awk {'print $2'})"

                if [ $status == "inactive" ]; then
                zenity --info --title="Aviso:" \
		zenity --info --text="O SSH está inativo." \
		--width="320" --height="100"
                else
                  if [ $status == "active" ]; then
                  zenity --info --title="Aviso:" \
                  zenity --info --text="O SSH está ativo." \
                  --width="320" --height="100"
                  fi
                fi
    else
      if [[ $result = "Inicializar o SSH" ]]; then
	    echo "$(service sshd start)"
            zenity --info --title="Aviso:" \
            zenity --info --text="O SSH foi iniciado!" \
            --width="320" --height="100"
      else
        if [[ $result = "Encerrar o SSH" ]]; then
              echo "$(service sshd stop)"
              zenity --info --title="Aviso:" \
              zenity --info --text="O SSH foi encerrado!" \
	      --width="320" --height="100"
        else
          if [[ $result = "Visualizar a porta atual" ]]; then
                porta="$(sed -n '/Port [0-9]*/p' sshd_config | tail -1 | awk {'print $2'})"
                zenity --info --title="Aviso:" \
                zenity --info --text="A porta atual é: $porta" \
                --width="320" --height="100"
          else
            if [[ $result = "Substituir a porta atual" ]]; then
                  p=$(zenity --title="Atenção:" --text="Insira a porta desejada:" --entry)
                  echo "$(sed -i.bkp '/Port [0-9]*/c\Port '$p'' ./sshd_config)"
                  zenity --info --title="Aviso:" \
                  zenity --info --text="Porta substituída com sucesso." \
                  --width="320" --height="100"
            else
              if [[ $result = "Verificar a conexão via root" ]]; then
                    permroot="$(sed -n '/PermitRootLogin */p' sshd_config | tail -1 | awk '{print $2}')"

			if [ $permroot == "no" ]; then
			zenity --info --title="Aviso:" \
                        zenity --info --text="O login por root está desabilitado." \
                        --width="320" --height="100"
			else
		  	  if [ $permroot == "yes" ]; then
		  	  zenity --info --title="Aviso:" \
                          zenity --info --text="O login por root está habilitado." \
                          --width="320" --height="100"
		  	  else
		    	  zenity --info --title="Aviso:" \
			  zenity --info --text="A permissão ainda não foi configurada." \
                          --width="320" --height="100"
		  	  fi
	                fi
              else
                if [[ $result = "Habilitar a conexão via root" ]]; then
                      echo "$(sed -i.bkp '/PermitRootLogin */c\PermitRootLogin yes' sshd_config)"
                      zenity --info --title="Aviso:" \
                      zenity --info --text="Conexão por root habilitada." \
                      --width="320" --height="100"
		else
                  if [[ $result = "Desabilitar a conexão via root" ]]; then
                        echo "$(sed -i.bkp '/PermitRootLogin */c\PermitRootLogin no' sshd_config)"
                        zenity --info --title="Aviso:" \
                        zenity --info --text="Conexão por root desabilitada." \
                        --width="320" --height="100"
                  else
                    if [[ $result = "Criar chave criptografada RSA" ]]; then
                          zenity --info --title="Aviso:" \
                          zenity --info --text="Utilize o comando: ssh-keygen -t rsa" \
                          --width="320" --height="100"
                    else
                      if [[ $result = "Criar chave criptografada DSA" ]]; then
                            zenity --info --title="Aviso:" \
                            zenity --info --text="Utilize o comando: ssh-keygen -t dsa" \
                            --width="320" --height="100"
                      else
                        if [[ $result = "Inserir usuários ao acesso SSH" ]]; then
                              zenity --info --title="Aviso:" \
	  		      zenity --info --text="Digite todos os usuários a serem habilitados ao SSH e/ou digite 'x' para encerrar." \
			      --width="320" --height="100"

			           for ((i=1; i<6; i++)); do
                                   uuu[i]=$(zenity --title="Digite x para parar" --text "Digite o $iº (de 5): " --entry)
                                   vusers[i]=${uuu[i]}

			           if [[ "${vusers[i]}" = "x" ]]; then
			             break
			           fi

				     echo "$(sed -i.bkp '/AllowUsers */c\AllowUsers '${vusers[1]}' '${vusers[2]}' '${vusers[3]}' '${vusers[4]}' '${vusers[5]}'' sshd_config)"
			             habusers="$(sed -n '/AllowUsers*/p' sshd_config | tail -1 | awk -F " " '{print $2,$3,$4,$5,$6}')"

			           done

                                     if [[ "${vusers[1]}" = "x" ]]; then
			               exit 0
                                     else
                                       zenity --info --title="Aviso:" \
				       zenity --info --text="Os usuários habilitados: $habusers" \
				       --width="320" --height="100"
				     fi
                        else
                          if [[ $result = "Verificar usuários com acesso ao SSH" ]]; then
			        habusers="$(sed -n '/AllowUsers*/p' sshd_config | tail -1 | awk -F " " '{print $2,$3,$4,$5,$6}')"
                                zenity --info --title="Aviso:" \
                                zenity --info --text="$habusers" \
                                --width="320" -- height="100"
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
  fi
fi
done
