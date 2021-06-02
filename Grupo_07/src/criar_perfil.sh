IFACE="wlp2s0"
IP=$(ifconfig $IFACE | sed -e 's/[ \t]*//' | sed -n 2p | cut -d ' ' -f 2)
USUARIO=$USER

function criar_perfil {
    echo "========== Criação de perfil ==========="
    echo -ne "\nInforme um nome para o perfil:\n>> "
    read NOME_PERFIL
    export NOME_PERFIL

    perfil_path=../perfis/$USUARIO/$NOME_PERFIL.txt
    if [ -f $perfil_path ]; then
        echo -n "O nome já está em uso!"
        sleep 2
        clear
        criar_perfil
    else
        mkdir -p ../perfis/$USUARIO/
        echo -en "Criar política de permissão? (s/n):\n>> "
        read criar_permissao
        if [ "$criar_permissao" = "s" ]; then
            politica_permitir_enderecos $perfil_path
            echo -en "Permitir portas? (s/n):\n>> "
            read allow_portas
            if [ "$allow_portas" = "s" ]; then
                politica_permitir_portas $perfil_path
            fi
        fi
        echo -en "Criar política de bloqueio? (s/n):\n>> "
        read criar_bloqueio
        if [ "$criar_bloqueio" = "s" ]; then
            politica_negar_enderecos $perfil_path
            echo -en "Bloquear portas? (s/n):\n>> "
            read block_portas
            if [ "$block_portas" = "s" ]; then
                politica_negar_portas  $perfil_path
            fi
        fi
        #echo -en "$USUARIO;$nome_perfil\n" >> $perfil_path
        tr -d "\n\r" < $perfil_path > /tmp/out && mv /tmp/out $perfil_path
        echo "Criando perfil..."
        montar_regras
        echo -e "\nPerfil $NOME_PERFIL criado com sucesso!"
        unset NOME_PERFIL
        return 0
    fi
}


function politica_permitir_enderecos {
    profile_path=$1
    echo -en "Informe os endereços IP ou rede que deseja permitir (separados por vígula):\n>> "
    read ips
    echo -en "Permitir pacotes vindos (entrada) destes IP's? (s/n):\n>> "
    read entrada
    if [ "$entrada" = "s" ]; then
        flag_entrada="INPUT"
    else
        flag_entrada=""
    fi
    echo -en "Permitir pacotes direcionados (sáida) a estes IP's? (s/n):\n>> "
    read saida
    if [ "$saida" = "s" ]; then
        flag_saida="OUTPUT"
    else
        flag_saida=""
    fi
    echo -en "Informe os dias separados por vírgula (ex 1,3,5,7 para seg, qua, sex, dom):\n>> "
    read dias
    echo -en "Informe o hórario em que a regra será ativada a cada dia escolhido (ex: 10:30 ou 21:10):\n>> "
    read horario
    echo "$ips;$flag_entrada;$flag_saida;$dias;$horario;" >> $profile_path
}

function politica_negar_enderecos {
    profile_path=$1
    echo -en "Informe os endereços IP ou rede que deseja negar (separados por vígula):\n>> "
    read ips
    echo -en "Negar pacotes vindos (entrada) destes IP's? (s/n):\n>> "
    read entrada
    if [ "$entrada" = "s" ]; then
        flag_entrada="INPUT"
    else
        flag_entrada=""
    fi
    echo -en "Negar pacotes direcionados (saída) a estes IP's? (s/n):\n>> "
    read saida
    if [ "$saida" = "s" ]; then
        flag_saida="OUTPUT"
    else
        flag_saida=""
    fi
    echo -en "Informe os dias separados por vírgula (ex 1,3,5,7 para seg, qua, sex, dom):\n>> "
    read dias
    echo -en "Informe o hórario em que a regra será ativada a cada dia escolhido (ex: 10:30 ou 21:10):\n>> "
    read horario
    echo "$ips;$flag_entrada;$flag_saida;$dias;$horario;" >> $profile_path
}


function politica_permitir_portas {
    profile_path=$1
    echo -en "Liberar protocolo (udp/tcp):\n>> "
    read protocolo
    if  [ "$protocolo" = "udp" ]; then
        flag_proto="udp"
    elif [ "$protocolo" = "tcp" ]; then
        flag_proto="tcp"
    else
        flag_proto="all"
    fi
    echo -en "Informe as portas separadas por vírgulas:\n>> "
    read portas
    echo "$flag_proto;$portas;" >> $profile_path
}

function politica_negar_portas {
    profile_path=$1
    echo -en "Bloquear protocolo (udp/tcp):\n>> "
    read protocolo
    if [ "$protocolo" = "udp" ]; then
        flag_proto="udp"
    elif [ "$protocolo" = "tcp" ]; then
        flag_proto="tcp"
    else
        flag_proto="all"
    fi
    echo -en "Informe as portas separadas por vírgulas:\n>> "
    read portas
    echo "$flag_proto;$portas;" >> $profile_path
}

function montar_regras {
    crontab -l 2> /dev/null 1> current_crontab;
    cat current_crontab 1> novo_crontab;
    regra_raw=$(cat ../perfis/$USUARIO/$NOME_PERFIL.txt | tr -s ";" " ")
    accept_ips=$(echo $regra_raw | cut -d ' ' -f 1)
    accept_input=$(echo $regra_raw | cut -d ' ' -f 2)
    accept_output=$(echo $regra_raw | cut -d ' ' -f 3)
    days_allow=$(echo $regra_raw | cut -d ' ' -f 4)
    time_allow=$(echo $regra_raw | cut -d ' ' -f 5)
    proto_accept=$(echo $regra_raw | cut -d ' ' -f 6)
    ports_accept=$(echo $regra_raw | cut -d ' ' -f 7)
    drop_ips=$(echo $regra_raw | cut -d ' ' -f 8)
    drop_input=$(echo $regra_raw | cut -d ' ' -f 9)
    drop_output=$(echo $regra_raw | cut -d ' ' -f 10)
    days_deny=$(echo $regra_raw | cut -d ' ' -f 11)
    time_deny=$(echo $regra_raw | cut -d ' ' -f 12)
    proto_drop=$(echo $regra_raw | cut -d ' ' -f 13)
    ports_drop=$(echo $regra_raw | cut -d ' ' -f 14)


    regras=$(readlink -f ../perfis/$USUARIO/$NOME_PERFIL)
    rm $regras.txt
    for ip in $(echo "$accept_ips" | sed -e 's/[,]/ /g'); do
        linha_input="/sbin/iptables -A"
        linha_output="/sbin/iptables -A"
        if [ "$accept_input" = "INPUT" ]; then
            linha_input="$linha_input INPUT -i $IFACE"
            if [ "$proto_accept" != "" ]; then
                linha_input="$linha_input -p $proto_accept --match multiport --dports $ports_accept -s $ip -j ACCEPT"
                echo  "$linha_input" >> "$regras""_permitir"
            else
                linha_input="$linha_input -s $ip -j ACCEPT"
                echo "$linha_input" >> "$regras""_permitir"
            fi
        fi
        if [ "$accept_output" = "OUTPUT" ]; then
            linha_output="$linha_output -o $IFACE"
            if [ "$proto_accept" != "" ]; then
                linha_output="$linha_output -p $proto_accept --match multiport --dports $ports_drop -d $ip -j ACCEPT"
                echo  "$linha_output" >> "$regras""_permitir"
            else
                linha_output="$linha_output -d $ip -j ACCEPT"
                echo "$linha_output" >> "$regras""_permitir"
            fi
        fi
    done

    echo -e "# $NOME_PERFIL PERMITIR\n$(echo $time_allow | cut -d ':' -f 2) $(echo $time_allow | cut -d ':' -f 1) * * $days_allow\
    $PWD/agendamento.sh "$regras"_permitir\n#" >> novo_crontab

    for ip in $(echo "$drop_ips" | sed -e 's/[,]/ /g'); do
        linha_input="/sbin/iptables -A"
        linha_output="/sbin/iptables -A"
        if [ "$accept_input" = "INPUT" ]; then
            linha_input="$linha_input INPUT -i $IFACE"
            if [ "$proto_drop" != "" ]; then
                linha_input="$linha_input -p $proto_drop --match multiport --dports $ports_drop -s $ip -j DROP"
                echo  "$linha_input" >> "$regras""_negar"
            else
                linha_input="$linha_input -s $ip -j DROP"
                echo "$linha_input" >> "$regras""_negar"
            fi
        fi
        if [ "$accept_output" = "OUTPUT" ]; then
            linha_output="$linha_output OUTPUT -o $IFACE"
            if [ "$proto_drop" != "" ]; then
                linha_output="$linha_output -p $proto_drop --match multiport --dports $ports_drop -d $ip -j DROP"
                echo "$linha_output" >> "$regras""_negar"
            else
                linha_output="$linha_output -d $ip -j DROP"
                echo "$linha_output" >> "$regras""_negar"
            fi
        fi
    done
    echo -e "# $NOME_PERFIL BLOQUEAR\n$(echo $time_deny | cut -d ':' -f 2) $(echo $time_deny | cut -d ':' -f 1) * * $days_deny\
    $PWD/agendamento.sh "$regras"_negar\n#" >> novo_crontab
    chmod 700 $regras*
    crontab novo_crontab
    rm current_crontab novo_crontab
    service cron restart
    return 0
}

