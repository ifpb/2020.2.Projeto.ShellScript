#!/bin/bash
# shellcheck disable=SC2016
# shellcheck disable=SC2001

# Caminho da Pasta do Script
export DIR_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Importar Ícones dos Programas
source "${DIR_PATH}/src/img/icons.sh"

# Importar Actions
## Pop-ups
source "${DIR_PATH}/src/actions/popups.sh"
## Widgets
source "${DIR_PATH}/src/actions/widgets.sh"
## Programs
source "${DIR_PATH}/src/actions/programs.sh"

# Importar Padrões de Widgets
source "${DIR_PATH}/src/widgets.sh"

XML='

<window '"${AUTOBASH_WINDOW_CONFIG}"'>

<notebook '"${NOTEBOOK_CONFIG}"'>

  ###############
  ## Programas ##
  ###############

  <vbox>

    <frame Desenvolvimento>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "TOOLBOX_BUTTON" "JetBrains ToolBox" "ToolBox" "${TOOLBOX_ICON}" "INSTALL_TOOLBOX")"'
      '"$(program_button "VSCODE_BUTTON" "Visual Studio" "VSCode" "${VSCODE_ICON}" "INSTALL_VSCODE")"'
      '"$(program_button "INSOMNIA_BUTTON" "Insomnia" "Insomnia" "${INSOMNIA_ICON}" "INSTALL_INSOMNIA")"'
      '"$(program_button "BEEKEEPER_BUTTON" "Beekeeper" "Beekeeper" "${BEEKEEPER_ICON}" "INSTALL_BEEKEEPER")"'
      '"$(program_button "KUBERNETES_BUTTON" "Kubernetes" "Kubernetes" "${KUBERNETES_ICON}" "INSTALL_KUBERNETES")"'
      '"$(program_button "DOCKER_BUTTON" "Docker" "Docker" "${DOCKER_ICON}" "INSTALL_DOCKER")"'
      '"$(program_button "NODE_BUTTON" "Node JS" "Node JS" "${NODE_ICON}" "INSTALL_NODE")"'
      '"$(program_button "REACT_BUTTON" "React JS" "React JS" "${REACT_ICON}" "INSTALL_REACT")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Redes>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "GOOGLE_CSDK_BUTTON" "Google Cloud SDK" "Cloud SDK" "${GOOGLE_CSDK_ICON}" "INSTALL_GOOGLE_CSDK")"'
      '"$(program_button "TCPDUMP_BUTTON" "TCPdump" "TCPDump" "${TCPDUMP_ICON}" "INSTALL_TCPDUMP")"'
      '"$(program_button "WIRESHARK_BUTTON" "Wireshark" "Wireshark" "${WIRESHARK_ICON}" "INSTALL_WIRESHARK")"'
      '"$(program_button "VBOX_BUTTON" "Oracle Virtual Box" "Virtual Box" "${VBOX_ICON}" "INSTALL_VBOX")"'
      '"$(program_button "VMWARE_BUTTON" "VMWare" "VMWare" "${VMWARE_ICON}" "INSTALL_VMWARE")"'
      '"$(program_button "FILEZILLA_BUTTON" "FileZilla" "FileZilla" "${FILEZILLA_ICON}" "INSTALL_FILEZILLA")"'
      '"$(program_button "PUTTY_BUTTON" "Putty" "Putty" "${PUTTY_ICON}" "INSTALL_PUTTY")"'
      '"$(program_button "REMMINA_BUTTON" "Remmina" "Remmina" "${REMMINA_ICON}" "INSTALL_REMMINA")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Escritório>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "WPS_BUTTON" "WPS Office" "WPS" "${WPS_ICON}" "INSTALL_WPS")"'
      '"$(program_button "FOXIT_BUTTON" "Foxit PDF" "Foxit PDF" "${FOXIT_ICON}" "INSTALL_FOXIT")"'
      '"$(program_button "GIMP_BUTTON" "Gimp" "Gimp" "${GIMP_ICON}" "INSTALL_GIMP")"'
      '"$(program_button "KRITA_BUTTON" "Krita" "Krita" "${KRITA_ICON}" "INSTALL_KRITA")"'
      '"$(program_button "INKSCAPE_BUTTON" "Inkscape" "Inkscape" "${INKSCAPE_ICON}" "INSTALL_INKSCAPE")"'
      '"$(program_button "MAILSPRING_BUTTON" "Mailspring" "Mailspring" "${MAILSPRING_ICON}" "INSTALL_MAILSPRING")"'
      '"$(program_button "AUDACITY_BUTTON" "Audacity" "Audacity" "${AUDACITY_ICON}" "INSTALL_AUDACITY")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <hbox>
      <frame Lazer>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(program_button "SPOTIFY_BUTTON" "Spotify" "Spotify" "${SPOTIFY_ICON}" "INSTALL_SPOTIFY")"'
        '"$(program_button "SKYPE_BUTTON" "Skype" "Skype" "${SKYPE_ICON}" "INSTALL_SKYPE")"'
        '"$(program_button "DISCORD_BUTTON" "Discord" "Discord" "${DISCORD_ICON}" "INSTALL_DISCORD")"'

      </hbox>
      </frame>

      <frame Utilitários>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(program_button "WINE_BUTTON" "Wine" "Wine" "${WINE_ICON}" "INSTALL_WINE")"'
        '"$(program_button "CHROME_BUTTON" "Chrome" "Chrome" "${CHROME_ICON}" "INSTALL_CHROME")"'
        '"$(program_button "BRAVE_BUTTON" "Brave" "Brave" "${BRAVE_ICON}" "INSTALL_BRAVE")"'
        '"$(program_button "OPERA_BUTTON" "Opera" "Opera" "${OPERA_ICON}" "INSTALL_OPERA")"'
        '"$(program_button "WINRAR_BUTTON" "WinRAR" "WinRAR" "${WINRAR_ICON}" "INSTALL_WINRAR")"'

      </hbox>
      </frame>
    </hbox>

  </vbox>


  #############
  ## Pacotes ##
  #############

  <vbox>

    <hbox homogeneous="true">

      '"$(package_button "Programador" "PROGRAMADOR_BUTTON" "${PACKAGE_PROGRAMADOR_BUTTON_ACTIONS}")"'
      '"$(package_button "Redes" "REDES_BUTTON" "${PACKAGE_REDES_BUTTON_ACTIONS}")"'
      '"$(package_button "Escritório" "ESCRITORIO_BUTTON" "${PACKAGE_ESCRITORIO_BUTTON_ACTIONS}")"'
      '"$(package_button "Lazer" "LAZER_BUTTON" "${PACKAGE_LAZER_BUTTON_ACTIONS}")"'

    </hbox>

    '"${GAP}"'
    <text><label>"Selecione todos os programas que deseja instalar."</label></text>

    <frame>

        ## PROGRAMADOR
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "JetBrains ToolBox" "${TOOLBOX_ICON}")"'
          '"$(tgbutton "Visual Studio" "${VSCODE_ICON}")"'
          '"$(tgbutton "Insomnia" "${INSOMNIA_ICON}")"'
          '"$(tgbutton "Beekeeper" "${BEEKEEPER_ICON}")"'
          '"$(tgbutton "Kubernetes" "${KUBERNETES_ICON}")"'
          '"$(tgbutton "Docker" "${DOCKER_ICON}")"'
          '"$(tgbutton "Node JS" "${NODE_ICON}")"'
          '"$(tgbutton "React JS" "${REACT_ICON}")"'
          '"$(tgbutton "WinRAR" "${WINRAR_ICON}")"'
          '"$(tgbutton "Chrome" "${CHROME_ICON}")"'
          '"$(tgbutton "Brave" "${BRAVE_ICON}")"'
          '"$(tgbutton "Opera" "${OPERA_ICON}")"'
        <variable>PROGRAMADOR_VBOX</variable> </vbox>

        ## REDES
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "Google Cloud SDK" "${GOOGLE_CSDK_ICON}")"'
          '"$(tgbutton "TCPdump" "${TCPDUMP_ICON}")"'
          '"$(tgbutton "Wireshark" "${WIRESHARK_ICON}")"'
          '"$(tgbutton "Oracle Virtual Box" "${VBOX_ICON}")"'
          '"$(tgbutton "VMWare" "${VMWARE_ICON}")"'
          '"$(tgbutton "FileZilla" "${FILEZILLA_ICON}")"'
          '"$(tgbutton "Putty" "${PUTTY_ICON}")"'
          '"$(tgbutton "Remmina" "${REMMINA_ICON}")"'
          '"$(tgbutton "WinRAR" "${WINRAR_ICON}")"'
          '"$(tgbutton "Brave" "${BRAVE_ICON}")"'
        <variable>REDES_VBOX</variable> </vbox>

        ## ESCRITORIO
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "WPS Office" "${WPS_ICON}")"'
          '"$(tgbutton "Foxit PDF" "${FOXIT_ICON}")"'
          '"$(tgbutton "Gimp" "${GIMP_ICON}")"'
          '"$(tgbutton "Krita" "${KRITA_ICON}")"'
          '"$(tgbutton "Inkscape" "${INKSCAPE_ICON}")"'
          '"$(tgbutton "Mailspring" "${MAILSPRING_ICON}")"'
          '"$(tgbutton "Audacity" "${AUDACITY_ICON}")"'
          '"$(tgbutton "WinRAR" "${WINRAR_ICON}")"'
          '"$(tgbutton "Chrome" "${CHROME_ICON}")"'
        <variable>ESCRITORIO_VBOX</variable> </vbox>

        ## LAZER
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "Spotify" "${SPOTIFY_ICON}")"'
          '"$(tgbutton "Skype" "${SKYPE_ICON}")"'
          '"$(tgbutton "Discord" "${DISCORD_ICON}")"'
        <variable>LAZER_VBOX</variable> </vbox>

    </frame>

    '"${GAP}"'
    <button image-position="1" height-request="40">
      <label>Instalar</label>
      <input file icon="bottom"></input>
      <action>echo Instalando...[Mentira]</action>
    </button>
    '"${GAP}"'

  </vbox>


  #################
  ## Desinstalar ##
  #################

  <vbox>

      '"${REFRESH_BUTTON}"'

      <frame>

         <vbox '"${INSTALLED_VBOX_CONFIG}"'>
            <text><label>Clique em Refresh para listar os programas instalados.</label></text>
         <variable>UNINSTALL_VBOX</variable> </vbox>

      </frame>

    '"${GAP}"'
    <button image-position="1" height-request="40">
      <label>Desinstalar</label>
      <input file icon="stop"></input>
      <action>echo Desinstalando...[Mentira]</action>
    </button>
    '"${GAP}"'

  </vbox>


  ###############
  ## Atualizar ##
  ###############

  <vbox>

      '"${REFRESH_BUTTON}"'

      <frame>

         <vbox '"${INSTALLED_VBOX_CONFIG}"'>
            <text><label>Clique em Refresh para listar os programas instalados.</label></text>
         <variable>UNINSTALL_VBOX</variable> </vbox>

      </frame>

    '"${GAP}"'
    <button image-position="1" height-request="40">
      <label>Atualizar</label>
      <input file stock="gtk-jump-to"></input>
      <action>echo Desinstalando...[Mentira]</action>
    </button>
    '"${GAP}"'

  </vbox>

</notebook>
</window>
'

sed -e "s/##.*//" <<< "${XML}" > /tmp/xml

case $1 in
-d | --dump) echo "${XML}" ;;
*) gtkdialog --file=/tmp/xml --center 2> /dev/null ;;
esac
