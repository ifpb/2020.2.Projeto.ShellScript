function listar_perfis {
    echo "========== LISTAGEM DE PERFIS =========="
    perfis_usuario_path=../perfis/$USER/
    echo -e "\nPerfis do usuário $USER:\n"
    if [ -d $perfis_usuario_path ]; then
        contador=0
        for arquivo in $(ls $perfis_usuario_path); do
            contador+=1
            echo $arquivo
        done
        echo -e "\n"
        if [ $contador -eq 0 ]; then
            echo "Este usuário ainda não possui perfis."
        fi
    else
        echo "Este usuário ainda não possui perfis."
    fi
    return 0
}
