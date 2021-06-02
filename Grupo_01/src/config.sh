#!/bin/bash

if [ -f /etc/os-release ]; then
  OS=$(head -1 /etc/os-release)
fi

if ! gtkdialog --help &>/dev/null && snap &>/dev/null; then
  echo -e "O Programa precisa instalar o \e[31mGTKDialog\e[m e o \e[31mSnap\e[m, deseja prosseguir?[S/n]"
  read -r CHOICE

  case "${CHOICE}" in
  s* | S* | '')
    sudo apt update
    echo "Instalando \e[31mGTKDialog\e[m e dependências..."
    echo "Instalando \e[31mbuild-essential\e[m..."
    sudo apt install build-essential
    echo "OK"
    if ! dpkg -l libgtk2.0-dev &> /dev/null; then
      echo "Instalando \e[31mlibgtk2.0-dev\e[m..."
      sudo apt install libgtk2.0-dev
      echo "OK"
    fi
    if ! gtkdialog --help &> /dev/null; then
      echo "Baixando \e[31mGTKDialog 0.8.3\e[m..."
      mkdir ~/GTK && cd ~/GTK
      wget "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gtkdialog/gtkdialog-0.8.3.tar.gz"
      tar -zxvf gtkdialog-0.8.3.tar.gz
      cd gtkdialog-0.8.3/
      echo "OK"
      echo -n "Configurando \e[31mGTKDialog 0.8.3\e[m..."
      ./configure
      make
      sudo make install
      echo "OK"
    fi
    if ! snap; then
      echo "Instalando \e[31mSnap\e[m..."
      [[ ${OS} == "NAME=\"Linux Mint\"" ]] \
      && sudo rm /var/lib/dpkg/lock-frontend \
      && sudo rm /var/cache/apt/archives/lock
      sudo apt install snapd
      echo "OK"
    fi
    ;;

  *)
    echo "Finalizando Programa."
    exit
    ;;
  esac

fi
