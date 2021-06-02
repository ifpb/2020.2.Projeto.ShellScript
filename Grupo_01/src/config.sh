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
    if ! dpkg -l build-essential &> /dev/null; then
      echo -n "Instalando \e[31mbuild-essential\e[m..."
      sudo -S apt install build-essential <<< "${PASSWORD}"
      echo "OK"
    fi
    if ! dpkg -l libgtk2.0-dev &> /dev/null; then
      echo -n "Instalando \e[31mlibgtk2.0-dev\e[m..."
      sudo -S apt install libgtk2.0-dev <<< "${PASSWORD}"
      echo "OK"
    fi
    if ! gtkdialog --help &> /dev/null; then
      echo -n "Baixando \e[31mGTKDialog 0.8.3\e[m..."
      mkdir ~/GTK && cd ~/GTK
      wget "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gtkdialog/gtkdialog-0.8.3.tar.gz"
      tar -zxvf gtkdialog-0.8.3.tar.gz
      cd gtkdialog-0.8.3/
      echo "OK"
      echo -n "Configurando \e[31mGTKDialog 0.8.3\e[m..."
      ./configure
      make
      sudo -S make install <<< "${PASSWORD}"
      echo "OK"
    fi
    if ! snap; then
      echo -n "Instalando \e[31mSnap\e[m..."
      [[ ${OS} == "NAME=\"Linux Mint\"" ]] \
      && sudo -S rm /var/lib/dpkg/lock-frontend <<< "${PASSWORD}" \
      && sudo -S rm /var/cache/apt/archives/lock <<< "${PASSWORD}"
      sudo -S apt install snapd <<< "${PASSWORD}"
      echo "OK"
    fi
    ;;

  *)
    echo "Finalizando Programa."
    exit
    ;;
  esac

fi
